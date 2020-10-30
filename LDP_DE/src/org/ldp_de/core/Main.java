package org.ldp_de.core;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.logging.*;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

/**
 *
 * @author aleksander.lipiec
 */
public class Main {


    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");
    private static final Logger LOGGER_INF = Logger.getLogger("LOG_INF.log");

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            try {
                UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            } catch (UnsupportedLookAndFeelException | IllegalAccessException | InstantiationException | ClassNotFoundException ex) {
                LOGGER_ERR.log(Level.SEVERE, null, ex);
            }

            FileHandler FileHandlerErr = new FileHandler("LOG_ERR.log", true);
            LOGGER_ERR.addHandler(FileHandlerErr);
            LOGGER_ERR.setLevel(Level.SEVERE);

            FileHandler FileHandlerInf = new FileHandler("LOG_INF.log", true);
            LOGGER_INF.addHandler(FileHandlerInf);
            LOGGER_INF.setLevel(Level.SEVERE);

            FileFormatter fileFormatter = new FileFormatter();
            FileHandlerErr.setFormatter(fileFormatter);
            FileHandlerInf.setFormatter(fileFormatter);
            
            SwingUtilities.invokeLater(() -> {
                new LDP_DE_JFrame().setVisible(true);
            });
        } catch (IOException | SecurityException ex) {
            LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
        }
    }

}

class FileFormatter extends Formatter {

    private static final DateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss.SSS");

    @Override
    public String format(LogRecord record) {
        StringBuilder builder = new StringBuilder(1000);
        builder.append(DATE_FORMAT.format(new java.util.Date(record.getMillis()))).append(" - ");
        builder.append(record.getSourceClassName());
        builder.append(" ");
        builder.append(record.getSourceMethodName());
        builder.append(" ");
        builder.append(formatMessage(record));
        builder.append("\n");
        return builder.toString();
    }

    @Override
    public String getHead(Handler h) {
        return super.getHead(h);
    }

    @Override
    public String getTail(Handler h) {
        return super.getTail(h);
    }
}
