/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package producerconsumer;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 *
 * @author User
 */
public class ProducerConsumer {

        private static final ExecutorService EXEC = Executors.newSingleThreadExecutor();
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BlockingQueue<Message> dataQueue = new ArrayBlockingQueue<>(10);
        EXEC.execute(new DataIOServer(dataQueue));
    }
    
}
