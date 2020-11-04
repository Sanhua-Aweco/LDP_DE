/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ldp_de.core;

import java.awt.Color;
import java.time.Duration;
import java.util.Queue;
import javax.swing.JButton;
import javax.swing.JLabel;

/**
 *
 * @author User
 */
class SekwencjaTestowa implements Runnable {

    private final ConnectionPoolManager connection;
    private final SqlQueryContainer sqlQueryContainer;
    private boolean startData;
    private final int testID;
    private final JButton jButtonStep_1;
    private final JButton jButtonStep_2;
    private final JButton jButtonStep_3;
    private final JButton jButtonStep_4;
    private final JLabel jLabelNumerCyklu;
    private final DataProducer dataProducer;
    private final Queue<DataRead> dataToRead;
    private final Queue<DataWrite> dataToWrite;
    private byte[] dane = {48, 48, 48, 48};
    private int out_0 = 1;
    private int out_1 = 2;
    private int out_2 = 4;
    private int out_3 = 8;
    private int out_4 = 10;
    private int out_5 = 20;
    private int out_6 = 40;
    private int i;
    private int j;
    
    private final String[] array_7067D = {"40", "32", "30", "30", "30", "0D"};
    private byte[] bytes_7067D;
    private DataRead dataRead;
    private DataWrite dataWrite;

    SekwencjaTestowa(ConnectionPoolManager connection, int testID, Queue<DataRead> dataToRead, JButton jButtonStep_1, JButton jButtonStep_2, JButton jButtonStep_3, JButton jButtonStep_4, JLabel jLabelNumerCyklu, Queue<DataWrite> dataToWrite) {
        this.connection = connection;
        this.testID = testID;
        this.dataToRead = dataToRead;
        this.jButtonStep_1 = jButtonStep_1;
        this.jButtonStep_2 = jButtonStep_2;
        this.jButtonStep_3 = jButtonStep_3;
        this.jButtonStep_4 = jButtonStep_4;
        this.jLabelNumerCyklu = jLabelNumerCyklu;
        this.dataToWrite = dataToWrite;
        sqlQueryContainer = new SqlQueryContainer(connection);
        dataProducer = new DataProducer();
        startData = true;
        i = 0;
        j = 0;
        bytes_7067D = new byte[array_7067D.length];
        dataProducer.setFillBytes(array_7067D, bytes_7067D);
    }

    @Override
    @SuppressWarnings({"WaitWhileNotSynced", "SleepWhileInLoop"})
    public void run() {
        while (startData) {
            synchronized (dataToRead) {
                int itemsLeft = dataToRead.size();
                while (itemsLeft > 0) {
                    while (dataToRead.isEmpty()) {
                        try {
                            dataToRead.wait();
                        } catch (InterruptedException e) {
                            throw new RuntimeException(e);
                        }
                        if (!(startData)) {
                            Thread.currentThread().interrupt();
                        }
                    }
                    itemsLeft--;
                    dataRead=dataToRead.poll();
                    byte[] w = dataRead.getBytesRead();
                    
                }
            }
            
            try {
                Thread.sleep(Duration.ofMillis(10).toMillis());
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            
            
            if(i>=4){
                    i=0;
                }
                if(i==0){
                    jButtonStep_1.setForeground(Color.GREEN);
                }else{
                    jButtonStep_1.setForeground(Color.GRAY);
                }
                if(i==1){
                    jButtonStep_2.setForeground(Color.GREEN);
                }else{
                    jButtonStep_2.setForeground(Color.GRAY);
                }
                if(i==2){
                    jButtonStep_3.setForeground(Color.GREEN);
                }else{
                    jButtonStep_3.setForeground(Color.GRAY);
                }
                if(i==3){
                    jButtonStep_4.setForeground(Color.GREEN);
                }
                else{
                    jButtonStep_4.setForeground(Color.GRAY);
                }
                i++; 
                
//                synchronized (dataToWrite) {
//                dataToWrite.add(bytes_7067D);
//                dataToWrite.notify();
//                jLabelNumerCyklu.setText(String.valueOf(j));
//                j++;
//            }
        }
    }

    public void finito() {
        startData = false;
        Thread.currentThread().interrupt();
    }
}
