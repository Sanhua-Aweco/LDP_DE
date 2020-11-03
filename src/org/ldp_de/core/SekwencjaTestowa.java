/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ldp_de.core;

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
    private final boolean startData;
    private final int testID;
    private final JButton jButtonStep_1;
    private final JButton jButtonStep_2;
    private final JButton jButtonStep_3;
    private final JButton jButtonStep_4;
    private final JLabel jLabelNumerCyklu;
    private final DataProducer dataProducer;
    private final Queue<IOData> ioDataToRead;
    private final Queue<byte[]> bytesToWrite;

    SekwencjaTestowa(boolean startData, ConnectionPoolManager connection, int testID, Queue<IOData> ioDataToRead, JButton jButtonStep_1, JButton jButtonStep_2, JButton jButtonStep_3, JButton jButtonStep_4, JLabel jLabelNumerCyklu, Queue<byte[]> bytesToWrite) {
        this.startData = startData;
        this.connection = connection;
        this.testID = testID;
        this.ioDataToRead = ioDataToRead;
        this.jButtonStep_1 = jButtonStep_1;
        this.jButtonStep_2 = jButtonStep_2;
        this.jButtonStep_3 = jButtonStep_3;
        this.jButtonStep_4 = jButtonStep_4;
        this.jLabelNumerCyklu = jLabelNumerCyklu;
        this.bytesToWrite = bytesToWrite;
        sqlQueryContainer = new SqlQueryContainer(connection);
        dataProducer = new DataProducer();
    }

    @Override
    public void run() {
    }

}
