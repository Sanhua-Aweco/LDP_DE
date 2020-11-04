/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package producerconsumer;

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

    private int x;

    public enum Option {
        Data_7018P, Data_7017, Data_7067D
    }

    private static final ExecutorService EXEC = Executors.newCachedThreadPool();
    private final BlockingQueue<Message> dataQueue;
    private final MessageCreator messageCreator = new MessageCreator();

    private byte[] bytes_7018P;
    private byte[] bytes_7017;
    private byte[] bytes_7067D;

    private byte[] data_7018P;
    private byte[] data_7017;
    private byte[] data_7067D;

    private final String[] array_7018P = {"23", "32", "31", "0D"};
    private final String[] array_7017 = {"23", "31", "46", "0D"};
    private final String[] array_7067D = {"40", "32", "30", "0D"};

    public DataIOServer(BlockingQueue<Message> dataQueue) {
        this.dataQueue = dataQueue;
    }

    @Override
    @SuppressWarnings("SleepWhileInLoop")
    public void run() {

        initMessage();
        EXEC.execute(new DataProducer(this,dataQueue, bytes_7018P, data_7018P, Option.Data_7018P));
        EXEC.execute(new DataProducer(this,dataQueue, bytes_7017, data_7017, Option.Data_7017));
        EXEC.execute(new DataProducer(this,dataQueue, bytes_7067D, data_7067D, Option.Data_7067D));
       
        System.out.println("Producer and Consumer has been started");
        while (true) {
            try {
                Message message;
                while (true) {
                    message = dataQueue.take();
                    byte[] dataWrite = message.getDataWrite();
                    switch (message.getDataRead()) {
                        case Data_7018P:
                            data_7018P = Arrays.copyOfRange(dataWrite, 1, dataWrite.length-1);
                            break;
                        case Data_7017:
                            data_7017 = Arrays.copyOfRange(dataWrite, 1, dataWrite.length-1);
                            break;
                        case Data_7067D:
                            data_7067D = Arrays.copyOfRange(dataWrite, 1, dataWrite.length-1);
                            break;
                    }
                    Thread.sleep(10);
                    System.out.println("Consumed " + Arrays.toString(message.getDataWrite()) + " Send " + message.getDataRead());
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    
    public int getData(){
        return x++;
    }
    
    private void initMessage() {
        bytes_7018P = new byte[array_7018P.length];
        messageCreator.setFillBytes(array_7018P, bytes_7018P);
        bytes_7017 = new byte[array_7017.length];
        messageCreator.setFillBytes(array_7017, bytes_7017);
        bytes_7067D = new byte[array_7067D.length];
        messageCreator.setFillBytes(array_7067D, bytes_7067D);
    }

}
