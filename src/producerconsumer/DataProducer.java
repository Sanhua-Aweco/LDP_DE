/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package producerconsumer;

import java.time.Duration;
import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.BlockingQueue;

/**
 *
 * @author User
 */
public class DataProducer implements Runnable {

    private final DataIOServer.Option option;

    public enum Option {
        Data_7018P, Data_7017, Data_7067D
    }
    
    private static final Random GENERATOR = new Random();
    private final BlockingQueue<Message> dataQueue;
    private final byte[] dataWrite;
    private final byte[] dataRead;

    public DataProducer(BlockingQueue<Message> dataQueue, byte[] dataWrite, byte[] dataRead,DataIOServer.Option option) {
        this.dataQueue = dataQueue;
        this.dataWrite = dataWrite;
        this.dataRead = dataRead;
        this.option=option;
    }

    @Override
    @SuppressWarnings("SleepWhileInLoop")
    public void run() {
        while (true) {
            Message msg = new Message(dataWrite, option);
            try {
                try {
                    Thread.sleep(Duration.ofSeconds(GENERATOR.nextInt(5)).toMillis());
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                dataQueue.put(msg);
                System.out.println("Produced " + Arrays.toString(msg.getDataWrite()) + " Odbiorca " + msg.getDataRead() + " Bufor " + Arrays.toString(dataRead));
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
