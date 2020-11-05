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
public class DataProducer_ION6200_V implements Runnable {

    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");

    private final DataIOServer dataIOServer;
    private final MessageCreator messageCreator = new MessageCreator();

    public enum Option {
        Data_7018P, Data_7017, Data_7067D,Data_ION6200_V,Data_ION6200_I
    }

    private final BlockingQueue<Message> dataQueue;

    private final String[] array_ION6200_V = {"23", "31", "46", "0D"};

    private byte[] bytes_ION6200_V;

    private boolean doStop = false;

    public synchronized void doStop() {
        this.doStop = true;
    }

    private synchronized boolean keepRunning() {
        return this.doStop == false;
    }
    
    public DataProducer_ION6200_V(DataIOServer dataIOServer, BlockingQueue<Message> dataQueue) {
        this.dataIOServer = dataIOServer;
        this.dataQueue = dataQueue;
        initMessage();
    }

    @Override
    @SuppressWarnings("SleepWhileInLoop")
    public void run() {
        while (keepRunning()) {
            Message msg = new Message(bytes_ION6200_V, Data_ION6200_V);
            try {
                dataQueue.put(msg);
            } catch (InterruptedException ex) {
                String exceptionMessage = getStackTrace(ex);
                LOGGER_ERR.log(Level.SEVERE, exceptionMessage);
            }
        }
    }

    private void initMessage() {
        bytes_ION6200_V = new byte[array_ION6200_V.length];
        messageCreator.setFillBytes(array_ION6200_V, bytes_ION6200_V);
    }
}
