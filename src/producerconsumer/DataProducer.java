/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package producerconsumer;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/**
 *
 * @author aleksander.lipiec
 */
public class DataProducer {

    private final char[] HEX_ARRAY = "0123456789ABCDEF".toCharArray();

    public DataProducer() {
    }

    private Double temperatureValue(byte[] bytes, int channel) {
        int lenghtBytes = bytes.length;
        if (lenghtBytes == 56) {
            int channelCount = 8;
            int dataLenght = lenghtBytes / channelCount;
            int startData = dataLenght * channel;
            int end = startData + dataLenght;
            byte[] bytesFragment = Arrays.copyOfRange(bytes, startData, end);
            byte[] bytesConverted = hexStringToByteArray(bytesToHex(bytesFragment));
            String rawString = new String(bytesConverted, StandardCharsets.UTF_8).substring(1, 7);
            Double stringDouble = Double.parseDouble(rawString);
            return stringDouble;
        } else {
            return 0.0;
        }
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

    public byte[] setFillBytes(String[] array, byte[] bytes) {
        return fillBytes(array, bytes);
    }

    public double getTemperature(byte[] bytes, int channel) {
        return temperatureValue(bytes, channel);
    }

    private double[] temperatureAll(byte[] bytes) {
        double temperatureArray[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
        int i;
        for (i = 0; i < temperatureArray.length; i++) {
            temperatureArray[i] = temperatureValue(bytes, i);
        }
        return temperatureArray;
    }

    public double[] getTemperatureAll(byte[] bytes) {
        return temperatureAll(bytes);
    }
}
