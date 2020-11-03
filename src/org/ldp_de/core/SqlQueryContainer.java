/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ldp_de.core;

import com.microsoft.sqlserver.jdbc.SQLServerCallableStatement;
import com.microsoft.sqlserver.jdbc.SQLServerConnection;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import java.sql.SQLTimeoutException;
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
class SqlQueryContainer {

    private final ConnectionPoolManager connection;
    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");

    public SqlQueryContainer(ConnectionPoolManager connection) {
        this.connection = connection;
    }

    private int testStart(int numerTestera, String modelGrzalki) {
        int result = -1;
        SQLServerConnection conn = connection.getConnectionFromPool();
        try {
            try (SQLServerCallableStatement csmt = (SQLServerCallableStatement) conn.prepareCall("{call sp_testStart(?,?,?)}")) {
                csmt.setInt(1, numerTestera);
                csmt.setString(2, modelGrzalki);
                csmt.registerOutParameter(3, Types.INTEGER);
                csmt.execute();
                result = csmt.getInt(3);
            } catch (SQLServerException | SQLTimeoutException ex) {
                connection.returnConnectionToPool(conn);
                LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
            }
        } finally {
            connection.returnConnectionToPool(conn);
        }
        return (result);
    }


    int setTestStart(int numerTestera, String modelGrzalki) {
        return testStart(numerTestera,modelGrzalki);
    }

    private int insertTemperatury(int testID, double[] temperatureAll) {
        int result = -1;
        SQLServerConnection conn = connection.getConnectionFromPool();
        try {
            try (SQLServerCallableStatement csmt = (SQLServerCallableStatement) conn.prepareCall("{call sp_testTemperatury(?,?,?,?,?,?,?,?,?)}")) {
                csmt.setDouble(1, temperatureAll[0]);
                csmt.setDouble(2, temperatureAll[1]);
                csmt.setDouble(3, temperatureAll[2]);
                csmt.setDouble(4, temperatureAll[3]);
                csmt.setDouble(5, temperatureAll[4]);
                csmt.setDouble(6, temperatureAll[5]);
                csmt.setDouble(7, temperatureAll[6]);
                csmt.setDouble(8, temperatureAll[7]);
                csmt.registerOutParameter(9, Types.INTEGER);
                csmt.execute();
                result = csmt.getInt(9);
            } catch (SQLServerException | SQLTimeoutException ex) {
                connection.returnConnectionToPool(conn);
                LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
            }
        } finally {
            connection.returnConnectionToPool(conn);
        }
        return (result);
    }

    int setTemperatury(int testID, double[] temperatureAll) {
        return insertTemperatury(testID,temperatureAll);
    }
}
