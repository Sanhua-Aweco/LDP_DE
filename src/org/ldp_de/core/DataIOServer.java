/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ldp_de.core;

import com.fazecast.jSerialComm.SerialPort;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JTextField;

/**
 *
 * @author aleksander.lipiec
 */
public class DataIOServer implements Runnable {

    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");
    private byte[] pureData;
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
    int numRead;
    private final JTextField jTextField1;
    private final JTextField jTextField2;
    private final JTextField jTextField3;
    private final JTextField jTextField4;
    private final JTextField jTextField5;
    private final JTextField jTextField6;
    private final JTextField jTextField7;
    private final JTextField jTextField8;
    private final byte[] bytes_7018P_Check;
    private final byte[] bytes_7018P_Read;
    private final byte[] bytes_7017_Check;
    private final byte[] bytes_7017_Read;
    private final byte[] bytes_7067D_Check;
    private final byte[] bytes_7067D_ResetWTD;
    private final byte[] bytes_7067D_Read;

    public DataIOServer(JTextField jTextField1, JTextField jTextField2, JTextField jTextField3, JTextField jTextField4, JTextField jTextField5, JTextField jTextField6, JTextField jTextField7, JTextField jTextField8) {
        this.jTextField1 = jTextField1;
        this.jTextField2 = jTextField2;
        this.jTextField3 = jTextField3;
        this.jTextField4 = jTextField4;
        this.jTextField5 = jTextField5;
        this.jTextField6 = jTextField6;
        this.jTextField7 = jTextField7;
        this.jTextField8 = jTextField8;
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
        SerialPort comPort = SerialPort.getCommPorts()[1];
        try {
            comPort.openPort();
            comPort.setComPortTimeouts(SerialPort.TIMEOUT_READ_BLOCKING, 500, 0);

            comPort.writeBytes(bytes_7018P_Check, bytes_7018P_Check.length);
            numRead = comPort.readBytes(readBuffer, readBuffer.length);
            pureData = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

            comPort.writeBytes(bytes_7017_Check, bytes_7017_Check.length);
            numRead = comPort.readBytes(readBuffer, readBuffer.length);
            pureData = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

            comPort.writeBytes(bytes_7067D_Check, bytes_7067D_Check.length);
            numRead = comPort.readBytes(readBuffer, readBuffer.length);
            pureData = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

            comPort.writeBytes(bytes_7067D_ResetWTD, bytes_7067D_ResetWTD.length);
            numRead = comPort.readBytes(readBuffer, readBuffer.length);
            pureData = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

            while (true) {
                comPort.writeBytes(bytes_7018P_Read, bytes_7018P_Read.length);
                numRead = comPort.readBytes(readBuffer, readBuffer.length);
                pureData = Arrays.copyOfRange(readBuffer, 1, numRead - 1);
                convertedData = hexStringToByteArray(bytesToHex(pureData));
                jTextField1.setText(analogValue(convertedData, 0));
                jTextField2.setText(analogValue(convertedData, 1));
                jTextField3.setText(analogValue(convertedData, 2));
                jTextField4.setText(analogValue(convertedData, 3));
                jTextField5.setText(analogValue(convertedData, 4));
                jTextField6.setText(analogValue(convertedData, 5));
                jTextField7.setText(analogValue(convertedData, 6));
                jTextField8.setText(analogValue(convertedData, 7));

                comPort.writeBytes(bytes_7017_Read, bytes_7017_Read.length);
                numRead = comPort.readBytes(readBuffer, readBuffer.length);
                pureData = Arrays.copyOfRange(readBuffer, 1, numRead - 1);

                comPort.writeBytes(bytes_7067D_Read, bytes_7067D_Read.length);
                numRead = comPort.readBytes(readBuffer, readBuffer.length);
                pureData = Arrays.copyOfRange(readBuffer, 1, numRead - 1);
            }
        } catch (Exception ex) {
            LOGGER_ERR.log(Level.SEVERE, " Com port error {0}", ex.getMessage());
        }
        comPort.closePort();
    }

    private String analogValue(byte[] bytes, int channel) {
        int lenghtBytes = bytes.length;
        int channelCount = 8;
        int dataLenght = lenghtBytes / channelCount;
        int start = dataLenght * channel;
        int end = start + dataLenght;
        byte[] bytesFragment = Arrays.copyOfRange(bytes, start, end);
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

}
