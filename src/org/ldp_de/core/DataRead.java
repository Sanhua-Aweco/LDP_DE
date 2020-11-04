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
class DataRead {
    
        private final byte[] bytesRead;
        private final byte[] pureData;

        public DataRead(byte[] bytesRead, byte[] pureData) {
            this.bytesRead = bytesRead;
            this.pureData = pureData;
        }

        public byte[] getBytesRead() {
            return bytesRead;
        }

        public byte[] getPureData() {
            return pureData;
        }
        
}
