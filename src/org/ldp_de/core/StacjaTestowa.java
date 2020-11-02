/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ldp_de.core;

import com.fazecast.jSerialComm.SerialPort;
import com.fazecast.jSerialComm.SerialPortInvalidPortException;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
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
    private final char[] HEX_ARRAY = "0123456789ABCDEF".toCharArray();
    private final String[] array_7018P_Check = {"24", "32", "31", "4D", "0D"};
    private final String[] array_7018P_Read = {"23", "32", "31", "0D"};
    private final String[] array_7017_Check = {"24", "31", "46", "4D", "0D"};
    private final String[] array_7017_Read = {"23", "31", "46", "0D"};
    private final String[] array_7067D_Check = {"24", "32", "30", "4D", "0D"};
    private final String[] array_7067D_ResetWTD = {"7E", "32", "30", "31", "0D"};
    private final String[] array_7067D_Read = {"40", "32", "30", "0D"};
    private byte[] convertedData;
    private final byte[] readBuffer = new byte[1024];
    private int numRead;
    private byte[] bytes_7018P_Check;
    private byte[] bytes_7018P_Read;
    private byte[] bytes_7017_Check;
    private byte[] bytes_7017_Read;
    private byte[] bytes_7067D_Check;
    private byte[] bytes_7067D_ResetWTD;
    private byte[] bytes_7067D_Read;
    private final ConnectionPoolManager connection;
    private final String portNameTester;
    private final JButton jButtonStart;
    private final JButton jButtonStop;
    private final JButton jButtonStep_1;
    private final JButton jButtonStep_2;
    private final JButton jButtonStep_3;
    private final JButton jButtonStep_4;
    private final ChartBean chartBeanTemperatura;
    private final JLabel jLabelNumerCyklu;
    private boolean startStat;
    private static final DateFormat DATEFORMAT = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private final SqlQueryContainer sqlQueryContainer;
    private SekwencjaTestowa sekwencjaTestowa;
    private int testID;

    @SuppressWarnings("NonPublicExported")

    public StacjaTestowa(ConnectionPoolManager connection, String portNameTester, JButton jButtonStart, JButton jButtonStop, JButton jButtonStep_1, JButton jButtonStep_2, JButton jButtonStep_3, JButton jButtonStep_4, ChartBean chartBeanTemperatura, JLabel jLabelNumerCyklu) {
        this.connection = connection;
        this.portNameTester = portNameTester;
        this.jButtonStart = jButtonStart;
        this.jButtonStop = jButtonStop;
        this.jButtonStep_1 = jButtonStep_1;
        this.jButtonStep_2 = jButtonStep_2;
        this.jButtonStep_3 = jButtonStep_3;
        this.jButtonStep_4 = jButtonStep_4;
        this.chartBeanTemperatura = chartBeanTemperatura;
        this.jLabelNumerCyklu = jLabelNumerCyklu;
        sqlQueryContainer = new SqlQueryContainer(connection);
        initComunication();
        startStat = true;
        jButtonStart.setEnabled(false);
        jButtonStop.setEnabled(true);
    }

    private void initComunication() {
        bytes_7018P_Check = new byte[array_7018P_Check.length];
        fillBytes(array_7018P_Check, bytes_7018P_Check);
        bytes_7018P_Read = new byte[array_7018P_Read.length];
        fillBytes(array_7018P_Read, bytes_7018P_Read);
        bytes_7017_Check = new byte[array_7017_Check.length];
        fillBytes(array_7017_Check, bytes_7017_Check);
        bytes_7017_Read = new byte[array_7017_Read.length];
        fillBytes(array_7017_Read, bytes_7017_Read);
        bytes_7067D_Check = new byte[array_7067D_Check.length];
        fillBytes(array_7067D_Check, bytes_7067D_Check);
        bytes_7067D_ResetWTD = new byte[array_7067D_ResetWTD.length];
        fillBytes(array_7067D_ResetWTD, bytes_7067D_ResetWTD);
        bytes_7067D_Read = new byte[array_7067D_Read.length];
        fillBytes(array_7067D_Read, bytes_7067D_Read);
    }

    @Override
    public void run() {
        chartBeanTemperatura.setClear();
        try {
            SerialPort comPort = SerialPort.getCommPort(portNameTester);
            comPort.openPort();
            comPort.setComPortTimeouts(SerialPort.TIMEOUT_READ_BLOCKING, 500, 0);

            comPort.writeBytes(bytes_7018P_Check, bytes_7018P_Check.length);
            numRead = comPort.readBytes(readBuffer, readBuffer.length);
            pureData_7018P = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

            comPort.writeBytes(bytes_7017_Check, bytes_7017_Check.length);
            numRead = comPort.readBytes(readBuffer, readBuffer.length);
            pureData_7017 = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

            comPort.writeBytes(bytes_7067D_Check, bytes_7067D_Check.length);
            numRead = comPort.readBytes(readBuffer, readBuffer.length);
            pureData_7067D = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

            comPort.writeBytes(bytes_7067D_ResetWTD, bytes_7067D_ResetWTD.length);
            numRead = comPort.readBytes(readBuffer, readBuffer.length);
            pureData_7067D = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

            testID = sqlQueryContainer.setNewTest(DATEFORMAT.format(System.currentTimeMillis()));

            sekwencjaTestowa = new SekwencjaTestowa(this,connection, testID, pureData_7018P, pureData_7017, pureData_7067D,pureData_ION6200, jButtonStep_1, jButtonStep_2, jButtonStep_3, jButtonStep_4, jLabelNumerCyklu);
            EXECUTOR.execute(sekwencjaTestowa);

            while (startStat) {
                comPort.writeBytes(bytes_7018P_Read, bytes_7018P_Read.length);
                numRead = comPort.readBytes(readBuffer, readBuffer.length);
                pureData_7018P = Arrays.copyOfRange(readBuffer, 1, numRead - 1);
                convertedData = hexStringToByteArray(bytesToHex(pureData_7018P));
                chartBeanTemperatura.setValue_0(stringToDouble(analogValue(convertedData, 0)));
                chartBeanTemperatura.setValue_1(stringToDouble(analogValue(convertedData, 1)));
                chartBeanTemperatura.setValue_2(stringToDouble(analogValue(convertedData, 2)));
                chartBeanTemperatura.setValue_3(stringToDouble(analogValue(convertedData, 3)));
                chartBeanTemperatura.setValue_4(stringToDouble(analogValue(convertedData, 4)));
                chartBeanTemperatura.setValue_5(stringToDouble(analogValue(convertedData, 5)));
                chartBeanTemperatura.setValue_6(stringToDouble(analogValue(convertedData, 6)));
                chartBeanTemperatura.setValue_7(stringToDouble(analogValue(convertedData, 7)));

                comPort.writeBytes(bytes_7017_Read, bytes_7017_Read.length);
                numRead = comPort.readBytes(readBuffer, readBuffer.length);
                pureData_7017 = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

                comPort.writeBytes(bytes_7067D_Read, bytes_7067D_Read.length);
                numRead = comPort.readBytes(readBuffer, readBuffer.length);
                pureData_7067D = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

            }

        } catch (SerialPortInvalidPortException ex) {
            LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
        } catch (Exception ex) {
            LOGGER_ERR.log(Level.SEVERE, " Com port error {0}", ex.getMessage());
        }

        jButtonStop.setEnabled(false);
        jButtonStart.setEnabled(true);
    }

    public void stop() {
        startStat = false;
    }

    private String analogValue(byte[] bytes, int channel) {
        int lenghtBytes = bytes.length;
        int channelCount = 8;
        int dataLenght = lenghtBytes / channelCount;
        int startData = dataLenght * channel;
        int end = startData + dataLenght;
        byte[] bytesFragment = Arrays.copyOfRange(bytes, startData, end);
        byte[] bytesConverted = hexStringToByteArray(bytesToHex(bytesFragment));
        return new String(bytesConverted, StandardCharsets.UTF_8);
    }

    private String bytesToHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            hexChars[j * 2] = HEX_ARRAY[v >>> 4];
            hexChars[j * 2 + 1] = HEX_ARRAY[v & 0x0F];
        }
        return new String(hexChars);
    }

    private byte[] hexStringToByteArray(String hex) {
        int l = hex.length();
        byte[] data = new byte[l / 2];
        for (int i = 0; i < l; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
                    + Character.digit(hex.charAt(i + 1), 16));
        }
        return data;
    }

    private byte[] fillBytes(String[] stringArray, byte[] bytes) {
        for (int i = 0; i < stringArray.length; i++) {
            bytes[i] = (byte) Integer.parseInt(stringArray[i], 16);
        }
        return bytes;
    }

    private Double stringToDouble(String analogValue) {
        String rawString = analogValue.substring(1, 7);
        Double stringDouble = Double.parseDouble(rawString);
        return stringDouble;
    }

}
