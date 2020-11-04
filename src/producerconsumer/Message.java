/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package producerconsumer;

/**
 *
 * @author User
 */
public class Message {
    
    private final byte[] dataWrite;
    private final byte[] dataRead;
    
    public Message(byte[] dataWrite,byte[] dataRead){
        this.dataWrite=dataWrite;
        this.dataRead=dataRead;
    }

    public byte[]getDataRead() {
        return dataRead;
    }
    
    public byte[]getDataWrite() {
        return dataWrite;
    }

}
