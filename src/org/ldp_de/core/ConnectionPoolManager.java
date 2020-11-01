package org.ldp_de.core;

import com.microsoft.sqlserver.jdbc.SQLServerConnection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

class ConnectionPoolManager {

    private String databaseUrl;
    private String userName;
    private String password;
    private ArrayList<Object> connectionPool = new ArrayList<>();
    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");

    public ConnectionPoolManager(String databaseUrl, String userName, String password) {
        this.databaseUrl = databaseUrl;
        this.userName = userName;
        this.password = password;
        initialize();
    }

    private void initialize() {
        initializeConnectionPool();
    }

    private void initializeConnectionPool() {
        while (!checkIfConnectionPoolIsFull()) {
            getConnectionPool().add(createNewConnectionForPool());
        }
    }

    private synchronized boolean checkIfConnectionPoolIsFull() {
        final int MAX_POOL_SIZE = 10;
        return getConnectionPool().size() >= MAX_POOL_SIZE;
    }

    private SQLServerConnection createNewConnectionForPool() {
        SQLServerConnection connection;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = (SQLServerConnection) DriverManager.getConnection(getDatabaseUrl(), getUserName(), getPassword());
        } catch (SQLException | ClassNotFoundException ex) {
            LOGGER_ERR.log(Level.SEVERE, null, ex);
            return null;
        }
        return connection;
    }

    public synchronized SQLServerConnection getConnectionFromPool() {
        SQLServerConnection connection = null;
        if (getConnectionPool().size() > 0) {
            connection = (SQLServerConnection) getConnectionPool().get(0);
            getConnectionPool().remove(0);
        }
        return connection;
    }

    public synchronized void returnConnectionToPool(SQLServerConnection connection) {
        getConnectionPool().add(connection);
    }

    public String getDatabaseUrl() {
        return databaseUrl;
    }

    public void setDatabaseUrl(String databaseUrl) {
        this.databaseUrl = databaseUrl;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public ArrayList<Object> getConnectionPool() {
        return connectionPool;
    }

    public void setConnectionPool(ArrayList<Object> connectionPool) {
        this.connectionPool = connectionPool;
    }
}
