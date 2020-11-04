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

    private static final Random GENERATOR = new Random();
    private final BlockingQueue<Message> dataQueue;
    private byte[] dataWrite;
    private byte[] dataRead;

    public DataProducer(BlockingQueue<Message> dataQueue) {
        this.dataQueue = dataQueue;
    }

    public DataProducer(BlockingQueue<Message> dataQueue, byte[] dataWrite, byte[] dataRead) {
        this.dataQueue = dataQueue;
        this.dataWrite = dataWrite;
        this.dataRead = dataRead;
    }

    @Override
    @SuppressWarnings("SleepWhileInLoop")
    public void run() {
        while (true) {
            Message msg = new Message(dataWrite, dataRead);
            try {
                try {
                    Thread.sleep(Duration.ofSeconds(GENERATOR.nextInt(1)).toMillis());
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                dataQueue.put(msg);
                System.out.println("Produced " + Arrays.toString(msg.getDataWrite()) + " Odbiorca " + Arrays.toString(msg.getDataRead()));
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

}
