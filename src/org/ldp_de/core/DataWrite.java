/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ldp_de.core;

/**
 *
 * @author aleksander.lipiec
 */
class DataWrite {
    
        private final byte[] bytesWrite;
        private final byte[] pureData;

        public DataWrite(byte[] bytesWrite, byte[] pureData) {
            this.bytesWrite = bytesWrite;
            this.pureData = pureData;
        }

        public byte[] getBytesWrite() {
            return bytesWrite;
        }

        public byte[] getPureData() {
            return pureData;
        }

         public byte[] setBytesWrite() {
            return bytesWrite;
        }

        public byte[] setPureData() {
            return pureData;
        }
}
