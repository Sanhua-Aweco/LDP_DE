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

    public enum Option {
        Data_7018P, Data_7017, Data_7067D
    }
    
    private final byte[] dataWrite;
    private final DataIOServer.Option option;
    
    public Message(byte[] dataWrite,DataIOServer.Option option){
        this.dataWrite=dataWrite;
        this.option=option;
    }

    public DataIOServer.Option getDataRead() {
        return option;
    }
    
    public byte[]getDataWrite() {
        return dataWrite;
    }

}
