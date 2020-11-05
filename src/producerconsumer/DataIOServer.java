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
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class DataIOServer extends Thread {

    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");

    private static final ExecutorService EXEC = Executors.newCachedThreadPool();
    private final BlockingQueue<Message> dataQueue;

    private SerialPort comPort;
    private final byte[] readBuffer = new byte[64];

    private byte[] data_7018P;
    private byte[] data_7017;
    private byte[] data_7067D;
    private byte[] data_ION6200_V;
    private byte[] data_ION6200_I;

    Thread thread_7018P;
    Thread thread_7017;
    Thread thread_7067D;
    Thread thread_ION6200_V;
    Thread thread_ION6200_I;

    public enum Option {
        Data_7018P, Data_7017, Data_7067D,Data_ION6200_V,Data_ION6200_I
    }

    public DataIOServer(BlockingQueue<Message> dataQueue) {
        this.dataQueue = dataQueue;
        initSerialPort("COM3", 9600);
    }

    @Override
    @SuppressWarnings("SleepWhileInLoop")
    public void run() {
        try {
            comPort.openPort();
            comPort.setComPortTimeouts(SerialPort.TIMEOUT_READ_BLOCKING, 100, 0);

            DataProducer_7018P dataProducer_7018P = new DataProducer_7018P(this, dataQueue);
            DataProducer_7017 dataProducer_7017 = new DataProducer_7017(this, dataQueue);
            DataProducer_7067D dataProducer_7067D = new DataProducer_7067D(this, dataQueue);
            DataProducer_ION6200_V dataProducer_ION6200_V = new DataProducer_ION6200_V(this, dataQueue);
            DataProducer_ION6200_I dataProducer_ION6200_I = new DataProducer_ION6200_I(this, dataQueue);

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

            while (true) {
                Message message;
                while (true) {
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
                    }
                }
            }
        } catch (InterruptedException ex) {
            String exceptionMessage = getStackTrace(ex);
            LOGGER_ERR.log(Level.SEVERE, exceptionMessage);
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
        }
        return copyOfRange;
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

}
