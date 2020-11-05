/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package producerconsumer;

import java.util.concurrent.BlockingQueue;
import java.util.logging.Level;
import java.util.logging.Logger;
import static producerconsumer.DataIOServer.Option.*;
import static producerconsumer.ProducerConsumer.getStackTrace;

/**
 *
 * @author User
 */
public class DataProducer_7017 implements Runnable {

    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");

    private final DataIOServer dataIOServer;
    private final MessageCreator messageCreator = new MessageCreator();
   
    public enum Option {
        Data_7018P, Data_7017, Data_7067D,Data_ION6200_V,Data_ION6200_I
    }

    private final BlockingQueue<Message> dataQueue;

    private final String[] array_7017 = {"23", "31", "46", "0D"};

    private byte[] bytes_7017;
    
    private boolean doStop = false;

    public synchronized void doStop() {
        this.doStop = true;
    }

    private synchronized boolean keepRunning() {
        return this.doStop == false;
    }

    public DataProducer_7017(DataIOServer dataIOServer, BlockingQueue<Message> dataQueue) {
        this.dataIOServer = dataIOServer;
        this.dataQueue = dataQueue;
        initMessage();
    }

    @Override
    @SuppressWarnings("SleepWhileInLoop")
    public void run() {
        while (keepRunning()) {
            Message msg = new Message(bytes_7017, Data_7017);
            try {
                dataQueue.put(msg);
            } catch (InterruptedException ex) {
                String exceptionMessage = getStackTrace(ex);
                LOGGER_ERR.log(Level.SEVERE, exceptionMessage);
            }
        }
    }

    private void initMessage() {
        bytes_7017 = new byte[array_7017.length];
        messageCreator.setFillBytes(array_7017, bytes_7017);
    }
}
