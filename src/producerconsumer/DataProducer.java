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
import static producerconsumer.Message.Option.Data_7018P;

/**
 *
 * @author User
 */
public class DataProducer implements Runnable {

    private DataIOServer.Option option;

    public enum Option {
        Data_7018P, Data_7017, Data_7067D
    }
    
    private static final Random GENERATOR = new Random();
    private final BlockingQueue<Message> dataQueue;
    private byte[] dataWrite;
    private byte[] dataRead;

    public DataProducer(BlockingQueue<Message> dataQueue) {
        this.dataQueue = dataQueue;
    }

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
                    Thread.sleep(Duration.ofSeconds(GENERATOR.nextInt(10)).toMillis());
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                dataQueue.put(msg);
                System.out.println("Produced " + Arrays.toString(msg.getDataWrite()) + " Odbiorca " + msg.getDataRead());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

}
