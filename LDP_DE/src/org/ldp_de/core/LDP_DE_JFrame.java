/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ldp_de.core;

import com.microsoft.sqlserver.jdbc.SQLServerConnection;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.print.PrinterJob;
import java.io.OutputStream;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Formatter;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.Logger;
import java.util.logging.StreamHandler;
import java.util.prefs.Preferences;
import javax.swing.JDialog;
import javax.swing.JOptionPane;
import javax.swing.Timer;
import javax.swing.text.BadLocationException;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyledDocument;

/**
 *
 * @author aleksander.lipiec
 */
@SuppressWarnings("ClassWithMultipleLoggers")
public class LDP_DE_JFrame extends javax.swing.JFrame {

    private final Preferences root = Preferences.userRoot();
    private final Preferences node = root.node("/org/ldp_de");
    private final String databaseUrl = node.get("Connection.databaseUrl", null);
    private final String UserName = node.get("Connection.userName", null);
    private final String Password = node.get("Connection.password", null);
    private final String user = (System.getProperty("user.name"));
    private String namePrinterDoc = node.get("Setings.namePrinterDoc", null);
    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");
    private static final Logger LOGGER_INF = Logger.getLogger("LOG_INF.log");
    private final Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
    private static final DateFormat DATEFORMAT = new SimpleDateFormat("dd MMMMMMMMM yyyy");
    private static final DateFormat DATEFORMAT2 = new SimpleDateFormat("HH:mm:ss");
    private static final DateFormat DATEFORMAT3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private ConnectionPoolManager connection = null;
    private String[] multiLineMsg;

    private int jFrame_LDP_DE_Height;
    private int jFrame_LDP_DE_Width;

    private int jDialogDocSettingsWidth;
    private int jDialogDocSettingsHeight;
    private int jDialogServerSettingsHeight;
    private int jDialogServerSettingsWidth;

    private static final ExecutorService EXECUTOR_RS232 = Executors.newSingleThreadExecutor();
    private String[] analogInput7018P;
    

    /**
     * Creates new form Rs232_v1JFrame
     */
    public LDP_DE_JFrame() {
        
        try {
            SQLServerConnection conn = (SQLServerConnection) DriverManager.getConnection(databaseUrl, UserName, Password);
            conn.close();
            connection = new ConnectionPoolManager(databaseUrl, UserName, Password);
        } catch (SQLException ex) {
            node.put("Connection.databaseUrl", "");
            node.put("Connection.userName", "");
            node.put("Connection.password", "");
            multiLineMsg = new String[]{"Brak po\u0142\u0105czenia z baz\u0105 danych.", ex.getLocalizedMessage(), "Sprawd\u017A ustawienia komunikacji z serwerem."};
            komunikat(multiLineMsg, "Panel informacyjny", JOptionPane.ERROR_MESSAGE, JOptionPane.CLOSED_OPTION);
            LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
        }
        
        initComponents();
        
        EventQueue.invokeLater(() -> {
            LogFormatter logFormatter = new LogFormatter();

            Handler WindowHandlerInf = new WindowHandlerInf();
            WindowHandlerInf.setLevel(Level.ALL);
            LOGGER_INF.addHandler(WindowHandlerInf);
            WindowHandlerInf.setFormatter(logFormatter);
            LOGGER_INF.setUseParentHandlers(false);

            Handler WindowHandlerErr = new WindowHandlerErr();
            WindowHandlerErr.setLevel(Level.ALL);
            LOGGER_ERR.addHandler(WindowHandlerErr);
            WindowHandlerErr.setFormatter(logFormatter);
            LOGGER_ERR.setUseParentHandlers(false);
        });

        node.put("Setings.stopka", "Aleksander Lipiec 2004/" + Year.now().getValue());
        node.put("Setings.version", "0.0.1");
        node.put("Setings.stopka", "Stanowisko testowe LDP DE");
        jLabelStopka.setText(node.get("Setings.stopka", null));
        jLabelUser.setText("Zalogowany użytkownik: " + user);
        TraySystem traySystem = new TraySystem(this, connection);
        traySystem.createTryIcon();
        clock();
        EXECUTOR_RS232.execute(new DataIOServer(jTextField1, jTextField2, jTextField3, jTextField4, jTextField5, jTextField6, jTextField7, jTextField8));
        ldp_De_FrameShow();
    }

    private void ldp_De_FrameShow() {
        jFrame_LDP_DE_Width = node.getInt("Setings.jFrame_LDP_DE_Width", 0);
        jFrame_LDP_DE_Height = node.getInt("Setings.jFrame_LDP_DE_Height", 0);

        if (jFrame_LDP_DE_Width == 0) {
            jFrame_LDP_DE_Width = 500;
        }
        if (jFrame_LDP_DE_Height == 0) {
            jFrame_LDP_DE_Height = 500;
        }
        setBounds((screenSize.width - jFrame_LDP_DE_Width) / 2, (screenSize.height - jFrame_LDP_DE_Height) / 2, jFrame_LDP_DE_Width, jFrame_LDP_DE_Height);
        LDP_DE_JFrame.this.setTitle("Stanowisko testowe LDP DE v " + node.get("Setings.version", null));
    }

    private void komunikatError(JDialog jDialog, Object message, String title) {
        JOptionPane.showConfirmDialog(jDialog, message, title, JOptionPane.DEFAULT_OPTION, JOptionPane.ERROR_MESSAGE);
    }

    private int komunikat(Object message, String title, int messageType, int optionType) {
        JOptionPane optionPane = new JOptionPane();
        optionPane.setMessageType(messageType);
        optionPane.setOptionType(optionType);
        optionPane.setMessage(message);
        JDialog dialog = optionPane.createDialog(title);
        dialog.setDefaultCloseOperation(
                JDialog.DO_NOTHING_ON_CLOSE);
        dialog.setAlwaysOnTop(true);
        dialog.setVisible(true);
        return ((Integer) optionPane.getValue());
    }

    public final void clock() {
        Timer timer = new Timer(1000, new LDP_DE_JFrame.ClockListener());
        timer.start();
    }

    class ClockListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            jLabelData.setText(DATEFORMAT.format(System.currentTimeMillis()));
            jLabelCzas.setText(DATEFORMAT2.format(System.currentTimeMillis()));
        }
    }

    class WindowHandlerErr extends StreamHandler {

        StyledDocument doc = jTextPaneKomunikatySystemowe.getStyledDocument();
        SimpleAttributeSet keyWord = new SimpleAttributeSet();

        public WindowHandlerErr() {
            StyleConstants.setForeground(keyWord, Color.RED);
            setOutputStream(new OutputStream() {
                @Override
                public void write(int b) {
                }

                @Override
                public void write(byte[] b, int off, int len) {
                    try {
                        doc.insertString(jTextPaneKomunikatySystemowe.getDocument().getLength(), new String(b, off, len), keyWord);
                    } catch (BadLocationException ex) {
                        LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
                    }
                }
            });
        }

        @Override
        public void publish(LogRecord record) {
            super.publish(record);
            jTextPaneKomunikatySystemowe.setCaretPosition((jTextPaneKomunikatySystemowe.getDocument().getLength()));
            flush();
        }
    }

    class WindowHandlerInf extends StreamHandler {

        StyledDocument doc = jTextPaneKomunikatySystemowe.getStyledDocument();
        SimpleAttributeSet keyWord = new SimpleAttributeSet();

        public WindowHandlerInf() {
            StyleConstants.setForeground(keyWord, Color.BLUE);
            setOutputStream(new OutputStream() {
                @Override
                public void write(int b) {
                }

                @Override
                public void write(byte[] b, int off, int len) {
                    try {
                        doc.insertString(jTextPaneKomunikatySystemowe.getDocument().getLength(), new String(b, off, len), keyWord);
                    } catch (BadLocationException ex) {
                        LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
                    }
                }
            });
        }

        @Override
        public void publish(LogRecord record) {
            super.publish(record);
            jTextPaneKomunikatySystemowe.setCaretPosition((jTextPaneKomunikatySystemowe.getDocument().getLength()));
            flush();
        }
    }

    class LogFormatter extends Formatter {

        private final DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss.SSS");

        @Override
        public String format(LogRecord record) {
            StringBuilder builder = new StringBuilder(1000);
            builder.append(df.format(new Date(record.getMillis()))).append(" - ");
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

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPopupMenuKomunikatySystemowe = new javax.swing.JPopupMenu();
        jMenuItemCls = new javax.swing.JMenuItem();
        jDialogSettings = new javax.swing.JDialog();
        jPanelSettings = new javax.swing.JPanel();
        jPanelReportServer = new javax.swing.JPanel();
        jTextAreaReportServer = new javax.swing.JTextArea();
        jCheckBoxDetailWindow = new javax.swing.JCheckBox();
        jButtonSettingsCancel = new javax.swing.JButton();
        jButtonSettingsSaveMod = new javax.swing.JButton();
        jDialogServerSettings = new javax.swing.JDialog();
        jPanelServerSettings = new javax.swing.JPanel();
        jPaneConnectionServerSettings = new javax.swing.JPanel();
        jLabelInstance = new javax.swing.JLabel();
        jTextFieldInstance = new javax.swing.JTextField();
        jLabelServer = new javax.swing.JLabel();
        jTextFieldServer = new javax.swing.JTextField();
        jLabelDatabaseName = new javax.swing.JLabel();
        jTextFieldDatabaseName = new javax.swing.JTextField();
        jButtonAnulujServerSettings = new javax.swing.JButton();
        jButtonSaveModServerSettings = new javax.swing.JButton();
        jPanelUserLogin = new javax.swing.JPanel();
        jLabelUserName = new javax.swing.JLabel();
        jLabelPassword = new javax.swing.JLabel();
        jTextFieldUserName = new javax.swing.JTextField();
        jPasswordFieldPassword = new javax.swing.JPasswordField();
        jScrollPaneTest = new javax.swing.JScrollPane();
        jPanelTest = new javax.swing.JPanel();
        jTextField1 = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jTextField2 = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jTextField3 = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jTextField4 = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jTextField5 = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jTextField6 = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jTextField7 = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jTextField8 = new javax.swing.JTextField();
        jScrollPaneKomunikatySystemowe = new javax.swing.JScrollPane();
        jTextPaneKomunikatySystemowe = new javax.swing.JTextPane();
        jSeparator1 = new javax.swing.JSeparator();
        jLabelStopka = new javax.swing.JLabel();
        jLabelUser = new javax.swing.JLabel();
        jLabelData = new javax.swing.JLabel();
        jLabelCzas = new javax.swing.JLabel();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jMenuBar = new javax.swing.JMenuBar();
        jMenuControl = new javax.swing.JMenu();
        jMenuItemExit = new javax.swing.JMenuItem();
        jMenuRaporty = new javax.swing.JMenu();
        jMenuItemRaporty = new javax.swing.JMenuItem();
        jMenuSettings = new javax.swing.JMenu();
        jMenuItemUstawienia = new javax.swing.JMenuItem();
        jMenuItemDataBaseSettings = new javax.swing.JMenuItem();

        jPopupMenuKomunikatySystemowe.setBackground(new java.awt.Color(236, 233, 216));
        jPopupMenuKomunikatySystemowe.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N

        jMenuItemCls.setBackground(new java.awt.Color(236, 233, 216));
        jMenuItemCls.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jMenuItemCls.setText("Clear");
        jMenuItemCls.setIconTextGap(0);
        jMenuItemCls.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItemClsActionPerformed(evt);
            }
        });
        jPopupMenuKomunikatySystemowe.add(jMenuItemCls);

        jDialogSettings.setModal(true);
        jDialogSettings.addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentResized(java.awt.event.ComponentEvent evt) {
                jDialogSettingsComponentResized(evt);
            }
        });
        jDialogSettings.addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                jDialogSettingsWindowClosing(evt);
            }
        });

        jPanelReportServer.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Server raport\u00F3w", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 10))); // NOI18N

        jTextAreaReportServer.setBackground(javax.swing.UIManager.getDefaults().getColor("TextArea.disabledBackground"));
        jTextAreaReportServer.setColumns(20);
        jTextAreaReportServer.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jTextAreaReportServer.setLineWrap(true);
        jTextAreaReportServer.setRows(1);
        jTextAreaReportServer.setWrapStyleWord(true);
        jTextAreaReportServer.setBorder(null);

        javax.swing.GroupLayout jPanelReportServerLayout = new javax.swing.GroupLayout(jPanelReportServer);
        jPanelReportServer.setLayout(jPanelReportServerLayout);
        jPanelReportServerLayout.setHorizontalGroup(
            jPanelReportServerLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelReportServerLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTextAreaReportServer, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanelReportServerLayout.setVerticalGroup(
            jPanelReportServerLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTextAreaReportServer, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        jCheckBoxDetailWindow.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jCheckBoxDetailWindow.setText("Detail Window Enable");

        jButtonSettingsCancel.setFont(new java.awt.Font("Tahoma", 3, 10)); // NOI18N
        jButtonSettingsCancel.setText("Anuluj");
        jButtonSettingsCancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonSettingsCancelActionPerformed(evt);
            }
        });

        jButtonSettingsSaveMod.setFont(new java.awt.Font("Tahoma", 3, 10)); // NOI18N
        jButtonSettingsSaveMod.setText("Zapisz");
        jButtonSettingsSaveMod.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonSettingsSaveModActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanelSettingsLayout = new javax.swing.GroupLayout(jPanelSettings);
        jPanelSettings.setLayout(jPanelSettingsLayout);
        jPanelSettingsLayout.setHorizontalGroup(
            jPanelSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelSettingsLayout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(jCheckBoxDetailWindow)
                .addGap(41, 41, 41))
            .addGroup(jPanelSettingsLayout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addGroup(jPanelSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
                    .addGroup(jPanelSettingsLayout.createSequentialGroup()
                        .addComponent(jButtonSettingsCancel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButtonSettingsSaveMod))
                    .addComponent(jPanelReportServer, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanelSettingsLayout.setVerticalGroup(
            jPanelSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelSettingsLayout.createSequentialGroup()
                .addGap(94, 94, 94)
                .addComponent(jPanelReportServer, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(226, 226, 226)
                .addComponent(jCheckBoxDetailWindow, javax.swing.GroupLayout.PREFERRED_SIZE, 21, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, Short.MAX_VALUE)
                .addGroup(jPanelSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonSettingsCancel)
                    .addComponent(jButtonSettingsSaveMod))
                .addContainerGap())
        );

        javax.swing.GroupLayout jDialogSettingsLayout = new javax.swing.GroupLayout(jDialogSettings.getContentPane());
        jDialogSettings.getContentPane().setLayout(jDialogSettingsLayout);
        jDialogSettingsLayout.setHorizontalGroup(
            jDialogSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanelSettings, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jDialogSettingsLayout.setVerticalGroup(
            jDialogSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanelSettings, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        jDialogServerSettings.setModal(true);
        jDialogServerSettings.addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentResized(java.awt.event.ComponentEvent evt) {
                jDialogServerSettingsComponentResized(evt);
            }
        });
        jDialogServerSettings.addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                jDialogServerSettingsWindowClosing(evt);
            }
        });

        jPaneConnectionServerSettings.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Baza danych", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 10))); // NOI18N
        jPaneConnectionServerSettings.setFont(new java.awt.Font("Tahoma", 0, 8)); // NOI18N

        jLabelInstance.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelInstance.setText("Instance name:");

        jTextFieldInstance.setBackground(javax.swing.UIManager.getDefaults().getColor("TextField.disabledBackground"));
        jTextFieldInstance.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jTextFieldInstance.setText(node.get("Connection.instance", null));
        jTextFieldInstance.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 0, new java.awt.Color(204, 204, 204)));

        jLabelServer.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelServer.setText("Server adres:");

        jTextFieldServer.setBackground(javax.swing.UIManager.getDefaults().getColor("TableHeader.background"));
        jTextFieldServer.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jTextFieldServer.setText(node.get("Connection.server", null));
        jTextFieldServer.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 0, new java.awt.Color(204, 204, 204)));

        jLabelDatabaseName.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelDatabaseName.setText("Database name:");

        jTextFieldDatabaseName.setBackground(javax.swing.UIManager.getDefaults().getColor("TextField.disabledBackground"));
        jTextFieldDatabaseName.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jTextFieldDatabaseName.setText(node.get("Connection.databaseName", null));
        jTextFieldDatabaseName.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 0, new java.awt.Color(204, 204, 204)));

        javax.swing.GroupLayout jPaneConnectionServerSettingsLayout = new javax.swing.GroupLayout(jPaneConnectionServerSettings);
        jPaneConnectionServerSettings.setLayout(jPaneConnectionServerSettingsLayout);
        jPaneConnectionServerSettingsLayout.setHorizontalGroup(
            jPaneConnectionServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPaneConnectionServerSettingsLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPaneConnectionServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPaneConnectionServerSettingsLayout.createSequentialGroup()
                        .addGroup(jPaneConnectionServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabelInstance)
                            .addComponent(jLabelServer))
                        .addGap(6, 6, 6)
                        .addGroup(jPaneConnectionServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jTextFieldServer, javax.swing.GroupLayout.DEFAULT_SIZE, 1, Short.MAX_VALUE)
                            .addComponent(jTextFieldInstance, javax.swing.GroupLayout.DEFAULT_SIZE, 1, Short.MAX_VALUE)))
                    .addGroup(jPaneConnectionServerSettingsLayout.createSequentialGroup()
                        .addComponent(jLabelDatabaseName)
                        .addGap(6, 6, 6)
                        .addComponent(jTextFieldDatabaseName, javax.swing.GroupLayout.DEFAULT_SIZE, 70, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPaneConnectionServerSettingsLayout.setVerticalGroup(
            jPaneConnectionServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPaneConnectionServerSettingsLayout.createSequentialGroup()
                .addGroup(jPaneConnectionServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabelServer)
                    .addComponent(jTextFieldServer, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPaneConnectionServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabelInstance)
                    .addComponent(jTextFieldInstance, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPaneConnectionServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabelDatabaseName)
                    .addComponent(jTextFieldDatabaseName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jButtonAnulujServerSettings.setFont(new java.awt.Font("Tahoma", 3, 10)); // NOI18N
        jButtonAnulujServerSettings.setText("Anuluj");
        jButtonAnulujServerSettings.setMaximumSize(new java.awt.Dimension(70, 23));
        jButtonAnulujServerSettings.setMinimumSize(new java.awt.Dimension(70, 23));
        jButtonAnulujServerSettings.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAnulujServerSettingsActionPerformed(evt);
            }
        });

        jButtonSaveModServerSettings.setFont(new java.awt.Font("Tahoma", 3, 10)); // NOI18N
        jButtonSaveModServerSettings.setText("Zapisz");
        jButtonSaveModServerSettings.setMaximumSize(new java.awt.Dimension(70, 23));
        jButtonSaveModServerSettings.setMinimumSize(new java.awt.Dimension(70, 23));
        jButtonSaveModServerSettings.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonSaveModServerSettingsActionPerformed(evt);
            }
        });

        jPanelUserLogin.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Użytkownik", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 10))); // NOI18N

        jLabelUserName.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelUserName.setText("Login:");

        jLabelPassword.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelPassword.setText("Hasło:");

        jTextFieldUserName.setBackground(javax.swing.UIManager.getDefaults().getColor("TextField.disabledBackground"));
        jTextFieldUserName.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jTextFieldUserName.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 0, new java.awt.Color(204, 204, 204)));
        jTextFieldUserName.setCursor(new java.awt.Cursor(java.awt.Cursor.TEXT_CURSOR));
        jTextFieldUserName.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTextFieldUserNameKeyTyped(evt);
            }
        });

        jPasswordFieldPassword.setBackground(javax.swing.UIManager.getDefaults().getColor("TextField.disabledBackground"));
        jPasswordFieldPassword.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jPasswordFieldPassword.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 0, new java.awt.Color(204, 204, 204)));
        jPasswordFieldPassword.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jPasswordFieldPasswordKeyTyped(evt);
            }
        });

        javax.swing.GroupLayout jPanelUserLoginLayout = new javax.swing.GroupLayout(jPanelUserLogin);
        jPanelUserLogin.setLayout(jPanelUserLoginLayout);
        jPanelUserLoginLayout.setHorizontalGroup(
            jPanelUserLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelUserLoginLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelUserLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanelUserLoginLayout.createSequentialGroup()
                        .addComponent(jLabelUserName)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextFieldUserName))
                    .addGroup(jPanelUserLoginLayout.createSequentialGroup()
                        .addComponent(jLabelPassword)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jPasswordFieldPassword)))
                .addContainerGap())
        );
        jPanelUserLoginLayout.setVerticalGroup(
            jPanelUserLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelUserLoginLayout.createSequentialGroup()
                .addGroup(jPanelUserLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabelUserName)
                    .addComponent(jTextFieldUserName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanelUserLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabelPassword)
                    .addComponent(jPasswordFieldPassword, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanelServerSettingsLayout = new javax.swing.GroupLayout(jPanelServerSettings);
        jPanelServerSettings.setLayout(jPanelServerSettingsLayout);
        jPanelServerSettingsLayout.setHorizontalGroup(
            jPanelServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelServerSettingsLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPaneConnectionServerSettings, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.CENTER, jPanelServerSettingsLayout.createSequentialGroup()
                        .addComponent(jButtonAnulujServerSettings, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButtonSaveModServerSettings, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jPanelUserLogin, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanelServerSettingsLayout.setVerticalGroup(
            jPanelServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelServerSettingsLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPaneConnectionServerSettings, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanelUserLogin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonAnulujServerSettings, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButtonSaveModServerSettings, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jDialogServerSettingsLayout = new javax.swing.GroupLayout(jDialogServerSettings.getContentPane());
        jDialogServerSettings.getContentPane().setLayout(jDialogServerSettingsLayout);
        jDialogServerSettingsLayout.setHorizontalGroup(
            jDialogServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanelServerSettings, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jDialogServerSettingsLayout.setVerticalGroup(
            jDialogServerSettingsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanelServerSettings, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        jScrollPaneTest.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Test", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 10))); // NOI18N

        jTextField1.setEditable(false);

        jLabel1.setText("Analog Value CHANNEL 0");

        jTextField2.setEditable(false);

        jLabel2.setText("Analog Value CHANNEL 1");

        jTextField3.setEditable(false);

        jLabel3.setText("Analog Value CHANNEL 2");

        jTextField4.setEditable(false);

        jLabel4.setText("Analog Value CHANNEL 3");

        jTextField5.setEditable(false);

        jLabel5.setText("Analog Value CHANNEL 4");

        jLabel6.setText("Analog Value CHANNEL 5");

        jTextField6.setEditable(false);

        jLabel7.setText("Analog Value CHANNEL 6");

        jTextField7.setEditable(false);

        jLabel8.setText("Analog Value CHANNEL 7");

        jTextField8.setEditable(false);

        javax.swing.GroupLayout jPanelTestLayout = new javax.swing.GroupLayout(jPanelTest);
        jPanelTest.setLayout(jPanelTestLayout);
        jPanelTestLayout.setHorizontalGroup(
            jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelTestLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanelTestLayout.createSequentialGroup()
                        .addComponent(jLabel8)
                        .addGap(50, 50, 50)
                        .addComponent(jTextField8))
                    .addGroup(jPanelTestLayout.createSequentialGroup()
                        .addComponent(jLabel7)
                        .addGap(50, 50, 50)
                        .addComponent(jTextField7))
                    .addGroup(jPanelTestLayout.createSequentialGroup()
                        .addComponent(jLabel6)
                        .addGap(50, 50, 50)
                        .addComponent(jTextField6))
                    .addGroup(jPanelTestLayout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addGap(50, 50, 50)
                        .addComponent(jTextField5))
                    .addGroup(jPanelTestLayout.createSequentialGroup()
                        .addComponent(jLabel4)
                        .addGap(50, 50, 50)
                        .addComponent(jTextField4))
                    .addGroup(jPanelTestLayout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addGap(50, 50, 50)
                        .addComponent(jTextField3))
                    .addGroup(jPanelTestLayout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(50, 50, 50)
                        .addComponent(jTextField2))
                    .addGroup(jPanelTestLayout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(50, 50, 50)
                        .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 59, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(394, Short.MAX_VALUE))
        );
        jPanelTestLayout.setVerticalGroup(
            jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelTestLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1)
                    .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3)
                    .addComponent(jTextField3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4)
                    .addComponent(jTextField4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel5)
                    .addComponent(jTextField5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel6)
                    .addComponent(jTextField6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel7)
                    .addComponent(jTextField7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelTestLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel8)
                    .addComponent(jTextField8, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(73, Short.MAX_VALUE))
        );

        jScrollPaneTest.setViewportView(jPanelTest);

        setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("/org/ldp_de/resources/ico.png")));
        addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentResized(java.awt.event.ComponentEvent evt) {
                formComponentResized(evt);
            }
        });
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
            public void windowIconified(java.awt.event.WindowEvent evt) {
                formWindowIconified(evt);
            }
        });

        jScrollPaneKomunikatySystemowe.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Komunikaty systemowe", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 10))); // NOI18N

        jTextPaneKomunikatySystemowe.setEditable(false);
        jTextPaneKomunikatySystemowe.setBackground(javax.swing.UIManager.getDefaults().getColor("TextPane.disabledBackground"));
        jTextPaneKomunikatySystemowe.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTextPaneKomunikatySystemoweMouseClicked(evt);
            }
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jTextPaneKomunikatySystemoweMouseReleased(evt);
            }
        });
        jScrollPaneKomunikatySystemowe.setViewportView(jTextPaneKomunikatySystemowe);

        jSeparator1.setBackground(javax.swing.UIManager.getDefaults().getColor("ToggleButton.background"));
        jSeparator1.setForeground(new java.awt.Color(204, 204, 204));

        jLabelStopka.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelStopka.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);

        jLabelUser.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelUser.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);

        jLabelData.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelData.setText("Pokaz date");

        jLabelCzas.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelCzas.setText("Pokaz czas");

        jMenuBar.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N

        jMenuControl.setText("Control");
        jMenuControl.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N

        jMenuItemExit.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jMenuItemExit.setIcon(new javax.swing.ImageIcon(getClass().getResource("/org/ldp_de/resources/system-shutdown.png"))); // NOI18N
        jMenuItemExit.setText("Exit");
        jMenuItemExit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItemExitActionPerformed(evt);
            }
        });
        jMenuControl.add(jMenuItemExit);

        jMenuBar.add(jMenuControl);

        jMenuRaporty.setText("Raporty");
        jMenuRaporty.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N

        jMenuItemRaporty.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jMenuItemRaporty.setIcon(new javax.swing.ImageIcon(getClass().getResource("/org/ldp_de/resources/x-office-presentation.png"))); // NOI18N
        jMenuItemRaporty.setText("Raporty");
        jMenuItemRaporty.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItemRaportyActionPerformed(evt);
            }
        });
        jMenuRaporty.add(jMenuItemRaporty);

        jMenuBar.add(jMenuRaporty);

        jMenuSettings.setText("Ustawienia");
        jMenuSettings.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N

        jMenuItemUstawienia.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jMenuItemUstawienia.setIcon(new javax.swing.ImageIcon(getClass().getResource("/org/ldp_de/resources/preferences-system.png"))); // NOI18N
        jMenuItemUstawienia.setText("Ustawienia og\u00F3lne");
        jMenuItemUstawienia.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItemUstawieniaActionPerformed(evt);
            }
        });
        jMenuSettings.add(jMenuItemUstawienia);

        jMenuItemDataBaseSettings.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jMenuItemDataBaseSettings.setIcon(new javax.swing.ImageIcon(getClass().getResource("/org/ldp_de/resources/drive-multidisk.png"))); // NOI18N
        jMenuItemDataBaseSettings.setText("Ustawienia serwera");
        jMenuItemDataBaseSettings.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItemDataBaseSettingsActionPerformed(evt);
            }
        });
        jMenuSettings.add(jMenuItemDataBaseSettings);

        jMenuBar.add(jMenuSettings);

        setJMenuBar(jMenuBar);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jTabbedPane1)
                    .addComponent(jSeparator1, javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabelStopka, javax.swing.GroupLayout.PREFERRED_SIZE, 240, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabelUser, javax.swing.GroupLayout.DEFAULT_SIZE, 173, Short.MAX_VALUE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabelData, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabelCzas, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPaneKomunikatySystemowe, javax.swing.GroupLayout.Alignment.LEADING))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 384, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addComponent(jScrollPaneKomunikatySystemowe, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 2, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabelStopka, javax.swing.GroupLayout.PREFERRED_SIZE, 13, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabelUser, javax.swing.GroupLayout.PREFERRED_SIZE, 13, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabelData, javax.swing.GroupLayout.PREFERRED_SIZE, 13, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabelCzas, javax.swing.GroupLayout.PREFERRED_SIZE, 13, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jMenuItemExitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItemExitActionPerformed
        System.exit(0);
    }//GEN-LAST:event_jMenuItemExitActionPerformed

    private void jMenuItemRaportyActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItemRaportyActionPerformed

    }//GEN-LAST:event_jMenuItemRaportyActionPerformed

    private void jMenuItemUstawieniaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItemUstawieniaActionPerformed

    }//GEN-LAST:event_jMenuItemUstawieniaActionPerformed

    private void formComponentResized(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_formComponentResized
        node.putInt("Setings.jFrame_LDP_DE_Height", LDP_DE_JFrame.this.getHeight());
        node.putInt("Setings.jFrame_LDP_DE_Width", LDP_DE_JFrame.this.getWidth());
    }//GEN-LAST:event_formComponentResized

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        node.putInt("Setings.jFrame_LDP_DE_Height", LDP_DE_JFrame.this.getHeight());
        node.putInt("Setings.jFrame_LDP_DE_Width", LDP_DE_JFrame.this.getWidth());
    }//GEN-LAST:event_formWindowClosing

    private void formWindowIconified(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowIconified
        node.putInt("Setings.jFrame_LDP_DE_Height", LDP_DE_JFrame.this.getHeight());
        node.putInt("Setings.jFrame_LDP_DE_Width", LDP_DE_JFrame.this.getWidth());
    }//GEN-LAST:event_formWindowIconified

    private void jTextPaneKomunikatySystemoweMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTextPaneKomunikatySystemoweMouseClicked
        if (evt.getClickCount() == 2 && !evt.isConsumed()) {
            evt.consume();
        }
    }//GEN-LAST:event_jTextPaneKomunikatySystemoweMouseClicked

    private void jTextPaneKomunikatySystemoweMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTextPaneKomunikatySystemoweMouseReleased
        if (evt.isPopupTrigger()) {
            jPopupMenuKomunikatySystemowe.show(evt.getComponent(), evt.getX(), evt.getY());
        }
    }//GEN-LAST:event_jTextPaneKomunikatySystemoweMouseReleased

    private void jMenuItemClsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItemClsActionPerformed
        jTextPaneKomunikatySystemowe.setText("");
    }//GEN-LAST:event_jMenuItemClsActionPerformed

    private void jButtonSettingsCancelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonSettingsCancelActionPerformed
        jDialogSettings.dispose();
    }//GEN-LAST:event_jButtonSettingsCancelActionPerformed

    private void jButtonSettingsSaveModActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonSettingsSaveModActionPerformed
        node.put("Setings.reportServer", jTextAreaReportServer.getText());
        node.putBoolean("Setings.detailWindowEnable", jCheckBoxDetailWindow.isSelected());
        jDialogSettings.dispose();
    }//GEN-LAST:event_jButtonSettingsSaveModActionPerformed

    private void jDialogSettingsComponentResized(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_jDialogSettingsComponentResized
        node.putInt("Setings.jDialogSettingsHeight", jDialogSettings.getHeight());
        node.putInt("Setings.jDialogSettingsWidth", jDialogSettings.getWidth());
    }//GEN-LAST:event_jDialogSettingsComponentResized

    private void jDialogSettingsWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_jDialogSettingsWindowClosing
        node.putInt("Setings.jDialogSettingsHeight", jDialogSettings.getHeight());
        node.putInt("Setings.jDialogSettingsWidth", jDialogSettings.getWidth());
    }//GEN-LAST:event_jDialogSettingsWindowClosing

    private void jButtonAnulujServerSettingsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAnulujServerSettingsActionPerformed
        jTextFieldServer.setText("");
        jTextFieldInstance.setText("");
        jTextFieldDatabaseName.setText("");
        jDialogServerSettings.dispose();
    }//GEN-LAST:event_jButtonAnulujServerSettingsActionPerformed

    private void jButtonSaveModServerSettingsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonSaveModServerSettingsActionPerformed
        String urlProduction;
        if (jTextFieldServer.getText().length() == 0) {
            JOptionPane.showMessageDialog(rootPane, "Musisz poda\u0107 adres serwera !", "System obs\u0142ugi b\u0142\u0119d\u00F3w", JOptionPane.ERROR_MESSAGE);
            jTextFieldServer.requestFocusInWindow();
            return;
        }
        if (jTextFieldInstance.getText().length() == 0) {
            urlProduction = "jdbc:sqlserver://" + jTextFieldServer.getText() + ";databaseName=" + ";databaseName=" + jTextFieldDatabaseName.getText();
        } else {
            urlProduction = "jdbc:sqlserver://" + jTextFieldServer.getText() + ";instanceName=" + jTextFieldInstance.getText() + ";databaseName=" + jTextFieldDatabaseName.getText();
        }
        if (jTextFieldDatabaseName.getText().length() == 0) {
            JOptionPane.showMessageDialog(rootPane, "Musisz poda\u0107 nazw\u0119 bazy !", "System obs\u0142ugi b\u0142\u0119d\u00F3w", JOptionPane.ERROR_MESSAGE);
            jTextFieldDatabaseName.requestFocusInWindow();
            return;
        }
        if (jTextFieldUserName.getText().length() == 0) {
            JOptionPane.showMessageDialog(rootPane, "Musisz poda\u0107 login !", "System obs\u0142ugi b\u0142\u0119d\u00F3w", JOptionPane.ERROR_MESSAGE);
            jTextFieldUserName.requestFocusInWindow();
            return;
        }
        if (jPasswordFieldPassword.getPassword().length == 0) {
            JOptionPane.showMessageDialog(rootPane, "Musisz poda\u0107 has\u0142o !", "System obs\u0142ugi b\u0142\u0119d\u00F3w", JOptionPane.ERROR_MESSAGE);
            jPasswordFieldPassword.requestFocusInWindow();
            return;
        }
        String databaseurlProduction = urlProduction;
        String userName = jTextFieldUserName.getText();
        String password = String.valueOf(jPasswordFieldPassword.getPassword());
        node.put("Connection.databaseUrl", databaseurlProduction);
        node.put("Connection.server", jTextFieldServer.getText());
        node.put("Connection.instance", jTextFieldInstance.getText());
        node.put("Connection.databaseName", jTextFieldDatabaseName.getText());
        node.put("Connection.userName", userName);
        node.put("Connection.password", password);
        multiLineMsg = new String[]{"Po wprowadzeniu zmian w ustawieniach", "musi nast\u0105pi\u0107 restart aplikacji."};
        int optionPane = komunikat(multiLineMsg, "Panel informacyjny", JOptionPane.INFORMATION_MESSAGE, JOptionPane.OK_OPTION);
        if (optionPane == JOptionPane.OK_OPTION) {
            System.exit(0);
        }
        jDialogServerSettings.dispose();
    }//GEN-LAST:event_jButtonSaveModServerSettingsActionPerformed

    private void jTextFieldUserNameKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextFieldUserNameKeyTyped
        if (evt.getKeyChar() == KeyEvent.VK_ENTER) {
            jPasswordFieldPassword.requestFocus();
        }
    }//GEN-LAST:event_jTextFieldUserNameKeyTyped

    private void jPasswordFieldPasswordKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jPasswordFieldPasswordKeyTyped
        if (evt.getKeyChar() == KeyEvent.VK_ENTER) {
            jButtonSaveModServerSettings.doClick();
        }
    }//GEN-LAST:event_jPasswordFieldPasswordKeyTyped

    private void jDialogServerSettingsComponentResized(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_jDialogServerSettingsComponentResized
        node.putInt("Setings.jDialogServerSettingsWidth", jDialogServerSettings.getWidth());
        node.putInt("Setings.jDialogServerSettingsHeight", jDialogServerSettings.getHeight());
    }//GEN-LAST:event_jDialogServerSettingsComponentResized

    private void jDialogServerSettingsWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_jDialogServerSettingsWindowClosing
        node.putInt("Setings.jDialogServerSettingsWidth", jDialogServerSettings.getWidth());
        node.putInt("Setings.jDialogServerSettingsHeight", jDialogServerSettings.getHeight());

    }//GEN-LAST:event_jDialogServerSettingsWindowClosing

    private void jMenuItemDataBaseSettingsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItemDataBaseSettingsActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jMenuItemDataBaseSettingsActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButtonAnulujServerSettings;
    private javax.swing.JButton jButtonSaveModServerSettings;
    private javax.swing.JButton jButtonSettingsCancel;
    private javax.swing.JButton jButtonSettingsSaveMod;
    private javax.swing.JCheckBox jCheckBoxDetailWindow;
    private javax.swing.JDialog jDialogServerSettings;
    private javax.swing.JDialog jDialogSettings;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabelCzas;
    private javax.swing.JLabel jLabelData;
    private javax.swing.JLabel jLabelDatabaseName;
    private javax.swing.JLabel jLabelInstance;
    private javax.swing.JLabel jLabelPassword;
    private javax.swing.JLabel jLabelServer;
    private javax.swing.JLabel jLabelStopka;
    private javax.swing.JLabel jLabelUser;
    private javax.swing.JLabel jLabelUserName;
    private javax.swing.JMenuBar jMenuBar;
    private javax.swing.JMenu jMenuControl;
    private javax.swing.JMenuItem jMenuItemCls;
    private javax.swing.JMenuItem jMenuItemDataBaseSettings;
    private javax.swing.JMenuItem jMenuItemExit;
    private javax.swing.JMenuItem jMenuItemRaporty;
    private javax.swing.JMenuItem jMenuItemUstawienia;
    private javax.swing.JMenu jMenuRaporty;
    private javax.swing.JMenu jMenuSettings;
    private javax.swing.JPanel jPaneConnectionServerSettings;
    private javax.swing.JPanel jPanelReportServer;
    private javax.swing.JPanel jPanelServerSettings;
    private javax.swing.JPanel jPanelSettings;
    private javax.swing.JPanel jPanelTest;
    private javax.swing.JPanel jPanelUserLogin;
    private javax.swing.JPasswordField jPasswordFieldPassword;
    private javax.swing.JPopupMenu jPopupMenuKomunikatySystemowe;
    private javax.swing.JScrollPane jScrollPaneKomunikatySystemowe;
    private javax.swing.JScrollPane jScrollPaneTest;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JTextArea jTextAreaReportServer;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField3;
    private javax.swing.JTextField jTextField4;
    private javax.swing.JTextField jTextField5;
    private javax.swing.JTextField jTextField6;
    private javax.swing.JTextField jTextField7;
    private javax.swing.JTextField jTextField8;
    private javax.swing.JTextField jTextFieldDatabaseName;
    private javax.swing.JTextField jTextFieldInstance;
    private javax.swing.JTextField jTextFieldServer;
    private javax.swing.JTextField jTextFieldUserName;
    private javax.swing.JTextPane jTextPaneKomunikatySystemowe;
    // End of variables declaration//GEN-END:variables

}
