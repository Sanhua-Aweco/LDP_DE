/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package producerconsumer;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.FileHandler;
import java.util.logging.Formatter;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
@SuppressWarnings("ClassWithMultipleLoggers")
public class ProducerConsumer {

    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");
    private static final Logger LOGGER_INF = Logger.getLogger("LOG_INF.log");
    private static final ExecutorService EXEC = Executors.newSingleThreadExecutor();

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        try {
            FileHandler FileHandlerErr = new FileHandler("LOG_ERR.log", true);
            LOGGER_ERR.addHandler(FileHandlerErr);
            LOGGER_ERR.setLevel(Level.SEVERE);

            FileHandler FileHandlerInf = new FileHandler("LOG_INF.log", true);
            LOGGER_INF.addHandler(FileHandlerInf);
            LOGGER_INF.setLevel(Level.SEVERE);

            FileFormatter fileFormatter = new FileFormatter();
            FileHandlerErr.setFormatter(fileFormatter);
            FileHandlerInf.setFormatter(fileFormatter);
            BlockingQueue<Message> dataQueue = new ArrayBlockingQueue<>(10);
            EXEC.execute(new DataIOServer(dataQueue));
        } catch (IOException | SecurityException ex) {
            String exceptionMessage = getStackTrace(ex);
            LOGGER_ERR.log(Level.SEVERE, exceptionMessage);
        }
    }

    public static String getStackTrace(final Throwable throwable) {
        final StringWriter sw = new StringWriter();
        final PrintWriter pw = new PrintWriter(sw, true);
        throwable.printStackTrace(pw);
        return sw.getBuffer().toString();
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
