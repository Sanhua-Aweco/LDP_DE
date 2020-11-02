/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ldp_de.core;

import javax.swing.JButton;
import javax.swing.JLabel;

/**
 *
 * @author User
 */
class SekwencjaTestowa implements Runnable{

    private final ConnectionPoolManager connection;
    private final SqlQueryContainer sqlQueryContainer;
    private final StacjaTestowa stacjaTestowa;

    SekwencjaTestowa(StacjaTestowa stacjaTestowa, ConnectionPoolManager connection, int testID, byte[] pureData_7018P, byte[] pureData_7017, byte[] pureData_7067D, byte[] pureData_ION6200, JButton jButtonStep_1, JButton jButtonStep_2, JButton jButtonStep_3, JButton jButtonStep_4, JLabel jLabelNumerCyklu) {
        this.stacjaTestowa=stacjaTestowa;
    }

    @Override
    public void run() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
