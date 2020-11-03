/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ldp_de.core;

import com.fazecast.jSerialComm.SerialPort;
import com.fazecast.jSerialComm.SerialPortInvalidPortException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JLabel;
import org.chartBean.core.ChartBean;

/**
 *
 * @author aleksander.lipiec
 */
public class StacjaTestowa implements Runnable {

    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");

    private byte[] pureData_7018P;
    private byte[] pureData_7017;
    private byte[] pureData_7067D;
    private byte[] pureData_ION6200;
    private byte[] pureData_ION6200_V;
    private byte[] pureData_ION6200_I;
    
    private final byte[] readBuffer = new byte[1024];
    private int numRead;

    private final String[] array_7018P_Check = {"24", "32", "31", "4D", "0D"};
    private final String[] array_7018P_Read = {"23", "32", "31", "0D"};
    private final String[] array_7017_Check = {"24", "31", "46", "4D", "0D"};
    private final String[] array_7017_Read = {"23", "31", "46", "0D"};
    private final String[] array_7067D_Check = {"24", "32", "30", "4D", "0D"};
    private final String[] array_7067D_ResetWTD = {"7E", "32", "30", "31", "0D"};
    private final String[] array_7067D_Read = {"40", "32", "30", "0D"};
    private final String[] array_ION6200_Check = {"24", "32", "30", "4D", "0D"};
    private final String[] array_ION6200_Read_V = {"40", "32", "30", "0D"};
    private final String[] array_ION6200_Read_I = {"40", "32", "30", "0D"};
    
    private byte[] masterData_7018P;
    private byte[] masterData_7017;
    private byte[] masterData_7067D;
    private byte[] masterData_ION6200;
    
    private byte[] bytes_7018P_Check;
    private byte[] bytes_7018P_Read;
    private byte[] bytes_7017_Check;
    private byte[] bytes_7017_Read;
    private byte[] bytes_7067D_Check;
    private byte[] bytes_7067D_ResetWTD;
    private byte[] bytes_7067D_Read;
    private byte[] bytes_ION6200_Check;
    private byte[] bytes_ION6200_Read_V;
    private byte[] bytes_ION6200_Read_I;
    
    private final ConnectionPoolManager connection;
    private final String portName;
    private final int numerTestera;
    private final String modelGrzalki;
    private final JButton jButtonStart;
    private final JButton jButtonStop;
    private final JButton jButtonStep_1;
    private final JButton jButtonStep_2;
    private final JButton jButtonStep_3;
    private final JButton jButtonStep_4;
    private final ChartBean chartBeanTemperatura;
    private final JLabel jLabelNumerCyklu;
    private boolean startData;
    private static final ExecutorService EXECUTOR_SEKWENCJA = Executors.newSingleThreadExecutor();
    private static final ExecutorService EXECUTOR_WYKRES = Executors.newSingleThreadExecutor();
    private final SqlQueryContainer sqlQueryContainer;
    private SekwencjaTestowa sekwencjaTestowa;
    private int testID;
    private WykresTemperatury wykresTemperatury;
    private final DataProducer dataProducer;
    private final IOData ioData = new IOData();
    private final Queue<IOData> ioDataToRead = new LinkedList<>();
    private final Queue<byte[]> bytesToWrite = new LinkedList<>();

    @SuppressWarnings("NonPublicExported")

    public StacjaTestowa(ConnectionPoolManager connection, String portName, int numerTestera, String modelGrzalki, JButton jButtonStart, JButton jButtonStop, JButton jButtonStep_1, JButton jButtonStep_2, JButton jButtonStep_3, JButton jButtonStep_4, ChartBean chartBeanTemperatura, JLabel jLabelNumerCyklu) {
        this.connection = connection;
        this.portName = portName;
        this.numerTestera = numerTestera;
        this.modelGrzalki = modelGrzalki;
        this.jButtonStart = jButtonStart;
        this.jButtonStop = jButtonStop;
        this.jButtonStep_1 = jButtonStep_1;
        this.jButtonStep_2 = jButtonStep_2;
        this.jButtonStep_3 = jButtonStep_3;
        this.jButtonStep_4 = jButtonStep_4;
        this.chartBeanTemperatura = chartBeanTemperatura;
        this.jLabelNumerCyklu = jLabelNumerCyklu;
        sqlQueryContainer = new SqlQueryContainer(connection);
        dataProducer = new DataProducer();
        initComunication();
        startData = true;
        jButtonStart.setEnabled(false);
        jButtonStop.setEnabled(true);
    }

    private void initComunication() {
        bytes_7018P_Check = new byte[array_7018P_Check.length];
        dataProducer.setFillBytes(array_7018P_Check, bytes_7018P_Check);
        bytes_7018P_Read = new byte[array_7018P_Read.length];
        dataProducer.setFillBytes(array_7018P_Read, bytes_7018P_Read);
        bytes_7017_Check = new byte[array_7017_Check.length];
        dataProducer.setFillBytes(array_7017_Check, bytes_7017_Check);
        bytes_7017_Read = new byte[array_7017_Read.length];
        dataProducer.setFillBytes(array_7017_Read, bytes_7017_Read);
        bytes_7067D_Check = new byte[array_7067D_Check.length];
        dataProducer.setFillBytes(array_7067D_Check, bytes_7067D_Check);
        bytes_7067D_ResetWTD = new byte[array_7067D_ResetWTD.length];
        dataProducer.setFillBytes(array_7067D_ResetWTD, bytes_7067D_ResetWTD);
        bytes_7067D_Read = new byte[array_7067D_Read.length];
        dataProducer.setFillBytes(array_7067D_Read, bytes_7067D_Read);
        bytes_ION6200_Check = new byte[array_ION6200_Check.length];
        dataProducer.setFillBytes(array_ION6200_Check, bytes_ION6200_Check);
        bytes_ION6200_Read_V = new byte[array_ION6200_Read_V.length];
        dataProducer.setFillBytes(array_ION6200_Read_V, bytes_ION6200_Read_V);
        bytes_ION6200_Read_I = new byte[array_ION6200_Read_I.length];
        dataProducer.setFillBytes(array_ION6200_Read_I, bytes_ION6200_Read_I);
    }

    @Override
    public void run() {
        SerialPort comPort = SerialPort.getCommPort(portName);
        try {
            comPort.openPort();
            comPort.setComPortTimeouts(SerialPort.TIMEOUT_READ_BLOCKING, 500, 0);
            if (checkComModule(comPort)) {
                testID = sqlQueryContainer.setTestStart(numerTestera, modelGrzalki);
                sekwencjaTestowa = new SekwencjaTestowa(startData, connection, testID, ioDataToRead, jButtonStep_1, jButtonStep_2, jButtonStep_3, jButtonStep_4, jLabelNumerCyklu, bytesToWrite);
                EXECUTOR_SEKWENCJA.execute(sekwencjaTestowa);
                wykresTemperatury = new WykresTemperatury();
                EXECUTOR_WYKRES.execute(wykresTemperatury);

                while (startData) {
                    synchronized (ioDataToRead) {
                        comPort.writeBytes(bytes_7018P_Read, bytes_7018P_Read.length);
                        numRead = comPort.readBytes(readBuffer, readBuffer.length);
                        pureData_7018P = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

                        comPort.writeBytes(bytes_7017_Read, bytes_7017_Read.length);
                        numRead = comPort.readBytes(readBuffer, readBuffer.length);
                        pureData_7017 = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

                        comPort.writeBytes(bytes_7067D_Read, bytes_7067D_Read.length);
                        numRead = comPort.readBytes(readBuffer, readBuffer.length);
                        pureData_7067D = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

                        comPort.writeBytes(bytes_ION6200_Read_V, bytes_ION6200_Read_V.length);
                        numRead = comPort.readBytes(readBuffer, readBuffer.length);
                        pureData_ION6200_V = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

                        comPort.writeBytes(bytes_ION6200_Read_I, bytes_ION6200_Read_I.length);
                        numRead = comPort.readBytes(readBuffer, readBuffer.length);
                        pureData_ION6200_I = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

                        ioDataToRead.add(ioData);
                        ioDataToRead.notify();
                    }

                    synchronized (bytesToWrite) {
                        while (bytesToWrite.isEmpty()) {
                            try {
                                bytesToWrite.wait();
                            } catch (InterruptedException e) {
                                throw new RuntimeException(e);
                            }
                        }
                        byte[] bytes_7067D_Write = bytesToWrite.poll();
                        comPort.writeBytes(bytes_7067D_Write, bytes_7067D_Write.length);
                        numRead = comPort.readBytes(readBuffer, readBuffer.length);
                        pureData_7067D = Arrays.copyOfRange(readBuffer, 1, numRead - 1);
                    }
                }
            }
        } catch (SerialPortInvalidPortException ex) {
            LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
            comPort.closePort();
        } catch (RuntimeException ex) {
            LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
            comPort.closePort();
        }
        comPort.closePort();
        finito();
        jButtonStop.setEnabled(false);
        jButtonStart.setEnabled(true);
    }

    public void finito() {
        startData = false;
    }

    private synchronized boolean checkComModule(SerialPort comPort) {
        comPort.writeBytes(bytes_7018P_Check, bytes_7018P_Check.length);
        numRead = comPort.readBytes(readBuffer, readBuffer.length);
        pureData_7018P = Arrays.copyOfRange(readBuffer, 1, numRead - 1);
        if(checkEqual(pureData_7018P, masterData_7018P)){
            return false;
        }

        comPort.writeBytes(bytes_7017_Check, bytes_7017_Check.length);
        numRead = comPort.readBytes(readBuffer, readBuffer.length);
        pureData_7017 = Arrays.copyOfRange(readBuffer, 1, numRead - 1);
        if(checkEqual(pureData_7017, masterData_7017)){
            return false;
        }

        comPort.writeBytes(bytes_7067D_Check, bytes_7067D_Check.length);
        numRead = comPort.readBytes(readBuffer, readBuffer.length);
        pureData_7067D = Arrays.copyOfRange(readBuffer, 1, numRead - 1);
        if(checkEqual(pureData_7067D, masterData_7067D)){
            return false;
        }

        comPort.writeBytes(bytes_7067D_ResetWTD, bytes_7067D_ResetWTD.length);
        numRead = comPort.readBytes(readBuffer, readBuffer.length);
        pureData_7067D = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

        comPort.writeBytes(bytes_ION6200_Check, bytes_ION6200_Check.length);
        numRead = comPort.readBytes(readBuffer, readBuffer.length);
        pureData_ION6200 = Arrays.copyOfRange(readBuffer, 1, numRead - 1);
        if(checkEqual(pureData_ION6200, masterData_ION6200)){
            return false;
        }
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

    private class WykresTemperatury implements Runnable {

        private WykresTemperatury() {
            chartBeanTemperatura.setClear();
        }

        @Override
        @SuppressWarnings("SleepWhileInLoop")
        public void run() {
            while (startData) {
                chartBeanTemperatura.setValue_0(dataProducer.getTemperature(pureData_7018P, 0));
                chartBeanTemperatura.setValue_1(dataProducer.getTemperature(pureData_7018P, 1));
                chartBeanTemperatura.setValue_2(dataProducer.getTemperature(pureData_7018P, 2));
                chartBeanTemperatura.setValue_3(dataProducer.getTemperature(pureData_7018P, 3));
                chartBeanTemperatura.setValue_4(dataProducer.getTemperature(pureData_7018P, 4));
                chartBeanTemperatura.setValue_5(dataProducer.getTemperature(pureData_7018P, 5));
                chartBeanTemperatura.setValue_6(dataProducer.getTemperature(pureData_7018P, 6));
                chartBeanTemperatura.setValue_7(dataProducer.getTemperature(pureData_7018P, 7));
                sqlQueryContainer.setTemperatury(testID, dataProducer.getTemperatureAll(pureData_7018P));
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException ex) {
                    LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
                }
            }
        }
    }
}
