/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package producerconsumer;

import com.fazecast.jSerialComm.SerialPort;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Arrays;
import java.util.concurrent.BlockingQueue;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class DataIOServer extends Thread {

    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");

    private final BlockingQueue<Message> dataQueue;

    private SerialPort comPort;
    private final byte[] readBuffer = new byte[64];

    private byte[] data_7018P;
    private byte[] data_7017;
    private byte[] data_7067D;
    private byte[] data_ION6200_V;
    private byte[] data_ION6200_I;

    private byte[] bytes_7018P_Check;
    private byte[] bytes_7017_Check;
    private byte[] bytes_7067D_Check;
    private byte[] bytes_7067D_ResetWTD;
    private byte[] bytes_7067D_Stop;
    private byte[] bytes_ION6200_Check;

    private final String[] array_7018P_Check = {"24", "32", "31", "4D", "0D"};
    private final String[] array_7017_Check = {"24", "31", "46", "4D", "0D"};
    private final String[] array_7067D_Check = {"24", "32", "30", "4D", "0D"};
    private final String[] array_7067D_ResetWTD = {"7E", "32", "30", "31", "0D"};
    private final String[] array_7067D_Stop = {"40", "32", "30", "30", "30", "0D"};
    private final String[] array_ION6200_Check = {"24", "32", "30", "4D", "0D"};

    DataProducer_7018P dataProducer_7018P;
    DataProducer_7017 dataProducer_7017;
    DataProducer_7067D dataProducer_7067D;
    DataProducer_ION6200_V dataProducer_ION6200_V;
    DataProducer_ION6200_I dataProducer_ION6200_I;

    Thread thread_7018P;
    Thread thread_7017;
    Thread thread_7067D;
    Thread thread_ION6200_V;
    Thread thread_ION6200_I;

    private final DataProducer dataProducer;

    public enum Option {
        Data_7018P, Data_7017, Data_7067D, Data_ION6200_V, Data_ION6200_I
    }

    private boolean doStop = false;

    public synchronized void doStop() {
        this.doStop = true;
    }

    private synchronized boolean keepRunning() {
        return this.doStop == false;
    }

    public DataIOServer(BlockingQueue<Message> dataQueue) {
        this.dataQueue = dataQueue;
        dataProducer = new DataProducer();
        initSerialPort("COM3", 9600);
        dataProducer_7018P = new DataProducer_7018P(this, dataQueue);
        dataProducer_7017 = new DataProducer_7017(this, dataQueue);
        dataProducer_7067D = new DataProducer_7067D(this, dataQueue);
        dataProducer_ION6200_V = new DataProducer_ION6200_V(this, dataQueue);
        dataProducer_ION6200_I = new DataProducer_ION6200_I(this, dataQueue);
    }

    @Override
    @SuppressWarnings("SleepWhileInLoop")
    public void run() {
        try {
            comPort.openPort();
            comPort.setComPortTimeouts(SerialPort.TIMEOUT_READ_BLOCKING, 50, 0);
            if (checkComModule(comPort)) {
                resetWDT(comPort);
                thread_7018P = new Thread(dataProducer_7018P);
                thread_7017 = new Thread(dataProducer_7017);
                thread_7067D = new Thread(dataProducer_7067D);
                thread_ION6200_V = new Thread(dataProducer_ION6200_V);
                thread_ION6200_I = new Thread(dataProducer_ION6200_I);

                thread_7018P.start();
                thread_7017.start();
                thread_7067D.start();
                thread_ION6200_V.start();
                thread_ION6200_I.start();

                Message message;
                while (keepRunning()) {
                    message = dataQueue.take();
                    byte[] dataWrite = message.getDataWrite();
                    switch (message.getDataRead()) {
                        case Data_7018P:
                            data_7018P = comReadWrite(comPort, dataWrite, readBuffer);
                            break;
                        case Data_7017:
                            data_7017 = comReadWrite(comPort, dataWrite, readBuffer);
                            break;
                        case Data_7067D:
                            data_7067D = comReadWrite(comPort, dataWrite, readBuffer);
                            break;
                        case Data_ION6200_V:
                            data_ION6200_V = comReadWrite(comPort, dataWrite, readBuffer);
                            break;
                        case Data_ION6200_I:
                            data_ION6200_I = comReadWrite(comPort, dataWrite, readBuffer);
                            break;
                    }
                    Thread.sleep(10);
                }
            }
        } catch (InterruptedException ex) {
            String exceptionMessage = getStackTrace(ex);
            LOGGER_ERR.log(Level.SEVERE, exceptionMessage);
        } finally {
            dataProducer_7018P.doStop();
            dataProducer_7017.doStop();
            dataProducer_7067D.doStop();
            dataProducer_ION6200_V.doStop();
            dataProducer_ION6200_I.doStop();
            this.doStop();
        }
    }

    public static String getStackTrace(final Throwable throwable) {
        final StringWriter sw = new StringWriter();
        final PrintWriter pw = new PrintWriter(sw, true);
        throwable.printStackTrace(pw);
        return sw.getBuffer().toString();
    }

    private void initSerialPort(String name, int baud) {
        if (comPort != null && comPort.isOpen()) {
            comPort.closePort();
        }
        comPort = SerialPort.getCommPort(name);
        comPort.setParity(SerialPort.NO_PARITY);
        comPort.setNumStopBits(SerialPort.ONE_STOP_BIT);
        comPort.setNumDataBits(8);
        comPort.setBaudRate(baud);
    }

    private byte[] comReadWrite(SerialPort comPort, byte[] dataWrite, byte[] readBuffer) {
        comPort.writeBytes(dataWrite, dataWrite.length);
        byte[] copyOfRange = null;
        try {
            copyOfRange = Arrays.copyOfRange(readBuffer, 1, comPort.readBytes(readBuffer, readBuffer.length) - 1);
        } catch (IllegalArgumentException ex) {
            String exceptionMessage = getStackTrace(ex);
            LOGGER_ERR.log(Level.SEVERE, exceptionMessage);
            dataProducer_7018P.doStop();
            dataProducer_7017.doStop();
            dataProducer_7067D.doStop();
            dataProducer_ION6200_V.doStop();
            dataProducer_ION6200_I.doStop();
            this.doStop();
        }
        return copyOfRange;
    }

    private void initCheckDataComunication() {
        bytes_7018P_Check = new byte[array_7018P_Check.length];
        dataProducer.setFillBytes(array_7018P_Check, bytes_7018P_Check);
        bytes_7017_Check = new byte[array_7017_Check.length];
        dataProducer.setFillBytes(array_7017_Check, bytes_7017_Check);
        bytes_7067D_Check = new byte[array_7067D_Check.length];
        dataProducer.setFillBytes(array_7067D_Check, bytes_7067D_Check);
        bytes_7067D_ResetWTD = new byte[array_7067D_ResetWTD.length];
        dataProducer.setFillBytes(array_7067D_ResetWTD, bytes_7067D_ResetWTD);
        bytes_7067D_Stop = new byte[array_7067D_Stop.length];
        dataProducer.setFillBytes(array_7067D_Stop, bytes_7067D_Stop);
        bytes_ION6200_Check = new byte[array_ION6200_Check.length];
        dataProducer.setFillBytes(array_ION6200_Check, bytes_ION6200_Check);
    }

    private synchronized boolean checkComModule(SerialPort comPort) {
        
        initCheckDataComunication();
        
        final byte[] masterData_7018P = {50, 49, 55, 48, 49, 56, 80};
        final byte[] masterData_7017 = {49, 70, 55, 48, 49, 55};
        final byte[] masterData_7067D = {50, 48, 55, 48, 54, 55, 68};
        final byte[] masterData_ION6200 = {22, 22, 22, 22, 22, 22};

        if (!(checkEqual(comReadWrite(comPort, bytes_7018P_Check, readBuffer), masterData_7018P))) {
            return false;
        }

        if (!(checkEqual(comReadWrite(comPort, bytes_7017_Check, readBuffer), masterData_7017))) {
            return false;
        }

        if (!(checkEqual(comReadWrite(comPort, bytes_7067D_Check, readBuffer), masterData_7067D))) {
            return false;
        }

//        if (!(checkEqual(comReadWrite(comPort, bytes_ION6200_Check, readBuffer), masterData_ION6200))) {
//            return false;
//        }
        return true;
    }

    private boolean checkEqual(byte[] pureData, byte[] masterData) {
        if (pureData.length != masterData.length) {
            return false;
        }
        int i;
        int l;
        for (i = 0, l = pureData.length; i < l; i++) {
            if (pureData[i] != masterData[i]) {
                return false;
            }
        }
        return true;
    }

    private void resetWDT(SerialPort comPort) {
        comPort.writeBytes(bytes_7067D_ResetWTD, bytes_7067D_ResetWTD.length);
    }

    public byte[] getData_7018P() {
        return data_7018P;
    }

    public byte[] getData_7017() {
        return data_7017;
    }

    public byte[] getData_7067D() {
        return data_7067D;
    }

    public byte[] getData_ION6200_V() {
        return data_ION6200_V;
    }

    public byte[] getData_ION6200_I() {
        return data_ION6200_I;
    }
}
