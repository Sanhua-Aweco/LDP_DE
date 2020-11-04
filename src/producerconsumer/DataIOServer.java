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

/**
 *
 * @author User
 */
public class DataIOServer extends Thread {

    private static final ExecutorService EXEC = Executors.newCachedThreadPool();
    private final BlockingQueue<Message> dataQueue;
    private Runnable producer1;
    private Runnable producer2;
    private Runnable producer3;
    
    private final MessageCreator messageCreator = new MessageCreator();

    private byte[] bytes_7018P;
    private byte[] bytes_7017;
    private byte[] bytes_7067D;
    
    private byte[] Data_7018P;
    private byte[] Data_7017;
    private byte[] Data_7067D;
    
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
        producer1 = new DataProducer(dataQueue,bytes_7018P,Data_7018P);
        producer2 = new DataProducer(dataQueue,bytes_7017,Data_7017);
        producer3 = new DataProducer(dataQueue,bytes_7067D,Data_7067D);
        
        new Thread(producer1).start();
        new Thread(producer2).start();
        new Thread(producer3).start();
        System.out.println("Producer and Consumer has been started");
        while (true) {
            try {
                Message message;
                while(true) {
                message = dataQueue.take();
                    Thread.sleep(10);
                    System.out.println("Consumed " + Arrays.toString(message.getDataWrite()) + "Send " + Arrays.toString(message.getDataRead()));
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
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
