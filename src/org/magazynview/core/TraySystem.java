package org.magazynview.core;

import java.awt.*;
import java.awt.TrayIcon.MessageType;
import java.awt.event.ActionEvent;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.prefs.Preferences;
import javax.swing.ImageIcon;
import javax.swing.JFrame;

@SuppressWarnings("ClassWithMultipleLoggers")
class TraySystem extends JFrame {

    static final long serialVersionUID = 6L;
    final PopupMenu popup = new PopupMenu();
    final TrayIcon trayIcon = new TrayIcon(createImage("/org/magazynview/resources/ico.png", "tray icon"));
    final SystemTray tray = SystemTray.getSystemTray();
    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");
    Preferences root = Preferences.userRoot();
    final Preferences node = root.node("/org/magazynview");
    private final JFrame jFrame;
    private final ConnectionPoolManager connection;
    
    TraySystem(JFrame jFrame, ConnectionPoolManager connection) {
        this.jFrame = jFrame;
        this.connection = connection;
    }

    public void createTryIcon() {
        if (!SystemTray.isSupported()) {
            System.out.println("SystemTray is not supported");
            return;
        }

        MenuItem shutDownItem = new MenuItem("ShutDown");
        shutDownItem.setFont(new Font("Tahoma", Font.PLAIN, 11));
        popup.add(shutDownItem);
        trayIcon.setPopupMenu(popup);
        trayIcon.setImageAutoSize(true);
        trayIcon.setToolTip("Magazyn VIEW v " + node.get("Setings.version", null));

        try {
            tray.add(trayIcon);
        } catch (AWTException ex) {
            LOGGER_ERR.log(Level.SEVERE, null, ex);
            return;
        }

        trayIcon.addActionListener((ActionEvent e) -> {
            if (!jFrame.isVisible()) {
                jFrame.setVisible(true);
            }
            if (jFrame.getExtendedState() == JFrame.ICONIFIED) {
                jFrame.setExtendedState(JFrame.NORMAL);
            }
        });

        shutDownItem.addActionListener((ActionEvent e) -> {
            tray.remove(trayIcon);
            jFrame.dispose();
            System.exit(0);
        });
    }

    public void displayMessage(String caption, String message, MessageType typ) {
        trayIcon.displayMessage(caption, message, typ);
    }

    protected static Image createImage(String path, String description) {
        URL imageURL = Main.class.getResource(path);
        if (imageURL == null) {
            Logger.getLogger("LOG_ERR.log").logp(Level.SEVERE, "TraySystem", "createImage", ("Resource not found: " + path));
            System.err.println("Resource not found: " + path);
            return null;
        } else {
            return (new ImageIcon(imageURL, description)).getImage();
        }
    }
}
