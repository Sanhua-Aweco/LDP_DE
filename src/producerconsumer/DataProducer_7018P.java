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
public class DataProducer_7018P implements Runnable {

    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");

    private final DataIOServer dataIOServer;
    private final MessageCreator messageCreator = new MessageCreator();

    public enum Option {
        Data_7018P, Data_7017, Data_7067D,Data_ION6200_V,Data_ION6200_I
    }

    private final BlockingQueue<Message> dataQueue;

    private final String[] array_7018P = {"23", "32", "31", "0D"};

    private byte[] bytes_7018P;

    private boolean doStop = false;

    public synchronized void doStop() {
        this.doStop = true;
    }

    private synchronized boolean keepRunning() {
        return this.doStop == false;
    }
    
    public DataProducer_7018P(DataIOServer dataIOServer, BlockingQueue<Message> dataQueue) {
        this.dataIOServer = dataIOServer;
        this.dataQueue = dataQueue;
        initMessage();
    }

    @Override
    @SuppressWarnings("SleepWhileInLoop")
    public void run() {
        Message msg_7018P = new Message(bytes_7018P, Data_7018P);
        while (keepRunning()) {
            try {
                dataQueue.put(msg_7018P);
            } catch (InterruptedException ex) {
                String exceptionMessage = getStackTrace(ex);
                LOGGER_ERR.log(Level.SEVERE, exceptionMessage);
            }
        }
    }

    private void initMessage() {
        bytes_7018P = new byte[array_7018P.length];
        messageCreator.setFillBytes(array_7018P, bytes_7018P);
    }
}
