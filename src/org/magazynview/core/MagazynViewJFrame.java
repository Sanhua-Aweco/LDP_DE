package org.magazynview.core;

import com.microsoft.sqlserver.jdbc.SQLServerConnection;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.prefs.Preferences;
import javax.swing.JDialog;
import javax.swing.JOptionPane;
import javax.swing.RowFilter;
import javax.swing.Timer;
import javax.swing.UIManager;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

/**
 *
 * @author Aleksander Lipiec
 */
public class MagazynViewJFrame extends javax.swing.JFrame {

    private final Preferences root = Preferences.userRoot();
    private final Preferences node = root.node("/org/magazynview");
    private final String databaseUrl = node.get("Connection.databaseUrl", null);
    private final String UserName = node.get("Connection.userName", null);
    private final String Password = node.get("Connection.password", null);
    private final Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
    private static final DateFormat DATEFORMAT = new SimpleDateFormat("dd MMMMMMMMM yyyy");
    private static final DateFormat DATEFORMAT2 = new SimpleDateFormat("HH:mm:ss");

    private final TableContainer tableContainer;
    private ConnectionPoolManager connection = null;

    private final String user = (System.getProperty("user.name"));
    private String[] multiLineMsg;

    private int jFrameMagazynHeight;
    private int jFrameMagazynWidth;

    private int jDialogServerSettingsHeight;
    private int jDialogServerSettingsWidth;

    /**
     * Creates new form SerwisJFrame
     *
     * @param connection
     */
    MagazynViewJFrame() {
        UIManager.put("OptionPane.cancelButtonText", "Odrzuć");
        UIManager.put("OptionPane.noButtonText", "Nie");
        UIManager.put("OptionPane.okButtonText", "OK");
        UIManager.put("OptionPane.yesButtonText", "Tak");
        UIManager.put("MenuItem.acceleratorFont", new Font("Tahoma", Font.PLAIN, 10));
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
        }
        initComponents();
        node.put("Setings.stopka", "Aleksander Lipiec 2004/" + Year.now().getValue());
        node.put("Setings.version", "0.0.1");
        jLabelStopka.setText(node.get("Setings.stopka", null));
        jLabelUser.setText("Zalogowany użytkownik: " + user);
        TraySystem traySystem = new TraySystem(this, connection);
        traySystem.createTryIcon();
        tableContainer = new TableContainer(connection);
        clock();
        magazynViewFrameShow();
        tableContainer.showPozycjaMagazynowa(jTablePozycjaMagazynowa, jScrollPanePozycjaMagazynowa);
        jTextFieldFind.requestFocus();
        jTextFieldFind.getDocument().addDocumentListener(new DocumentListener() {

            @Override
            public void insertUpdate(DocumentEvent e) {
                String text = jTextFieldFind.getText();

                if (text.trim().length() == 0) {
                    tableContainer.getSorterPozycjaMagazynowa().setRowFilter(null);
                } else {
                    tableContainer.getSorterPozycjaMagazynowa().setRowFilter(RowFilter.regexFilter("(?i)" + text));
                }
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                String text = jTextFieldFind.getText();

                if (text.trim().length() == 0) {
                    tableContainer.getSorterPozycjaMagazynowa().setRowFilter(null);
                } else {
                    tableContainer.getSorterPozycjaMagazynowa().setRowFilter(RowFilter.regexFilter("(?i)" + text));
                }
            }

            @Override
            public void changedUpdate(DocumentEvent de) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

        });

    }

    private void magazynViewFrameShow() {
        jFrameMagazynWidth = node.getInt("Setings.jFrameMagazynWidth", 0);
        jFrameMagazynHeight = node.getInt("Setings.jFrameMagazynHeight", 0);
        if (jFrameMagazynWidth == 0) {
            jFrameMagazynWidth = 500;
        }
        if (jFrameMagazynHeight == 0) {
            jFrameMagazynHeight = 500;
        }
        setBounds((screenSize.width - jFrameMagazynWidth) / 2, (screenSize.height - jFrameMagazynHeight) / 2, jFrameMagazynWidth, jFrameMagazynHeight);
        MagazynViewJFrame.this.setTitle("Magazyn View v " + node.get("Setings.version", null));
    }

    public final void clock() {
        Timer timer = new Timer(1000, new MagazynViewJFrame.ClockListener());
        timer.start();
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

    class ClockListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            jLabelData.setText(DATEFORMAT.format(System.currentTimeMillis()));
            jLabelCzas.setText(DATEFORMAT2.format(System.currentTimeMillis()));
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
        jPanelMain = new javax.swing.JPanel();
        jScrollPanePozycjaMagazynowa = new javax.swing.JScrollPane();
        jTablePozycjaMagazynowa = new javax.swing.JTable();
        jSeparator1 = new javax.swing.JSeparator();
        jLabelStopka = new javax.swing.JLabel();
        jLabelUser = new javax.swing.JLabel();
        jLabelData = new javax.swing.JLabel();
        jLabelCzas = new javax.swing.JLabel();
        jTextFieldFind = new javax.swing.JTextField();
        jMenuBar = new javax.swing.JMenuBar();
        jMenuControl = new javax.swing.JMenu();
        jMenuItemExit = new javax.swing.JMenuItem();
        jMenuSettings = new javax.swing.JMenu();
        jMenuItemConnectionSettings = new javax.swing.JMenuItem();

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

        setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("/org/magazynview/resources/ico.png")));
        addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentResized(java.awt.event.ComponentEvent evt) {
                formComponentResized(evt);
            }
        });
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        jScrollPanePozycjaMagazynowa.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Pozycje magazynowe", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 10))); // NOI18N
        jScrollPanePozycjaMagazynowa.setHorizontalScrollBarPolicy(javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        jTablePozycjaMagazynowa.setName("jTablePozycjaMagazynowa");
        jTablePozycjaMagazynowa.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jTablePozycjaMagazynowa.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jScrollPanePozycjaMagazynowa.setViewportView(jTablePozycjaMagazynowa);

        jSeparator1.setBackground(javax.swing.UIManager.getDefaults().getColor("ToggleButton.background"));
        jSeparator1.setForeground(new java.awt.Color(204, 204, 204));

        jLabelStopka.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N

        jLabelUser.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelUser.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);

        jLabelData.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelData.setText("Pokaz date");

        jLabelCzas.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jLabelCzas.setText("Pokaz czas");

        jTextFieldFind.setBackground(new java.awt.Color(240, 240, 240));
        jTextFieldFind.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jTextFieldFind.setToolTipText("");
        jTextFieldFind.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Wprowad\u017A s\u0142owo filtruj\u0105ce", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 10))); // NOI18N

        javax.swing.GroupLayout jPanelMainLayout = new javax.swing.GroupLayout(jPanelMain);
        jPanelMain.setLayout(jPanelMainLayout);
        jPanelMainLayout.setHorizontalGroup(
            jPanelMainLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelMainLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelMainLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jSeparator1)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelMainLayout.createSequentialGroup()
                        .addComponent(jLabelStopka, javax.swing.GroupLayout.PREFERRED_SIZE, 240, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabelUser, javax.swing.GroupLayout.DEFAULT_SIZE, 291, Short.MAX_VALUE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabelData, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabelCzas, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPanePozycjaMagazynowa)
                    .addComponent(jTextFieldFind))
                .addContainerGap())
        );
        jPanelMainLayout.setVerticalGroup(
            jPanelMainLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelMainLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPanePozycjaMagazynowa, javax.swing.GroupLayout.DEFAULT_SIZE, 342, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTextFieldFind, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 2, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelMainLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabelStopka, javax.swing.GroupLayout.DEFAULT_SIZE, 14, Short.MAX_VALUE)
                    .addComponent(jLabelUser, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(jPanelMainLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabelData, javax.swing.GroupLayout.PREFERRED_SIZE, 13, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabelCzas, javax.swing.GroupLayout.PREFERRED_SIZE, 13, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );

        jScrollPanePozycjaMagazynowa.getAccessibleContext().setAccessibleDescription("");

        jMenuBar.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N

        jMenuControl.setText("Control");
        jMenuControl.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N

        jMenuItemExit.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_X, java.awt.event.InputEvent.ALT_MASK | java.awt.event.InputEvent.CTRL_MASK));
        jMenuItemExit.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jMenuItemExit.setIcon(new javax.swing.ImageIcon(getClass().getResource("/org/magazynview/resources/system-shutdown.png"))); // NOI18N
        jMenuItemExit.setText("Exit");
        jMenuItemExit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItemExitActionPerformed(evt);
            }
        });
        jMenuControl.add(jMenuItemExit);

        jMenuBar.add(jMenuControl);

        jMenuSettings.setText("Ustawienia");
        jMenuSettings.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N

        jMenuItemConnectionSettings.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_S, java.awt.event.InputEvent.ALT_MASK | java.awt.event.InputEvent.CTRL_MASK));
        jMenuItemConnectionSettings.setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        jMenuItemConnectionSettings.setIcon(new javax.swing.ImageIcon(getClass().getResource("/org/magazynview/resources/network-wired.png"))); // NOI18N
        jMenuItemConnectionSettings.setText("Ustawienia serwera");
        jMenuItemConnectionSettings.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItemConnectionSettingsActionPerformed(evt);
            }
        });
        jMenuSettings.add(jMenuItemConnectionSettings);

        jMenuBar.add(jMenuSettings);

        setJMenuBar(jMenuBar);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanelMain, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanelMain, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        node.putInt("Setings.jFrameMagazynHeight", MagazynViewJFrame.this.getHeight());
        node.putInt("Setings.jFrameMagazynWidth", MagazynViewJFrame.this.getWidth());
    }//GEN-LAST:event_formWindowClosing

    private void jMenuItemExitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItemExitActionPerformed
        System.exit(0);
    }//GEN-LAST:event_jMenuItemExitActionPerformed

    private void formComponentResized(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_formComponentResized
        node.putInt("Setings.jFrameMagazynHeight", MagazynViewJFrame.this.getHeight());
        node.putInt("Setings.jFrameMagazynWidth", MagazynViewJFrame.this.getWidth());
    }//GEN-LAST:event_formComponentResized

    private void jDialogServerSettingsComponentResized(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_jDialogServerSettingsComponentResized
        node.putInt("Setings.jDialogServerSettingsWidth", jDialogServerSettings.getWidth());
        node.putInt("Setings.jDialogServerSettingsHeight", jDialogServerSettings.getHeight());
    }//GEN-LAST:event_jDialogServerSettingsComponentResized

    private void jDialogServerSettingsWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_jDialogServerSettingsWindowClosing
        node.putInt("Setings.jDialogServerSettingsWidth", jDialogServerSettings.getWidth());
        node.putInt("Setings.jDialogServerSettingsHeight", jDialogServerSettings.getHeight());
    }//GEN-LAST:event_jDialogServerSettingsWindowClosing

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

    private void jButtonAnulujServerSettingsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAnulujServerSettingsActionPerformed
        jTextFieldServer.setText("");
        jTextFieldInstance.setText("");
        jTextFieldDatabaseName.setText("");
        jDialogServerSettings.dispose();
    }//GEN-LAST:event_jButtonAnulujServerSettingsActionPerformed

    private void jMenuItemConnectionSettingsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItemConnectionSettingsActionPerformed
        jDialogServerSettingsWidth = node.getInt("Setings.jDialogServerSettingsWidth", 0);
        jDialogServerSettingsHeight = node.getInt("Setings.jDialogServerSettingsHeight", 0);
        if (jDialogServerSettingsWidth == 0) {
            jDialogServerSettingsWidth = 450;
        }
        if (jDialogServerSettingsHeight == 0) {
            jDialogServerSettingsHeight = 290;
        }
        jDialogServerSettings.setBounds((MagazynViewJFrame.this.getLocation().x + (MagazynViewJFrame.this.getWidth() / 2) - (jDialogServerSettingsWidth / 2)), MagazynViewJFrame.this.getLocation().y, jDialogServerSettingsWidth, jDialogServerSettingsHeight);
        jDialogServerSettings.setTitle("Magazyn Mini v " + node.get("Setings.version", null) + " - Settings");

        jTextFieldServer.setText(node.get("Connection.server", null));
        jTextFieldInstance.setText(node.get("Connection.instance", null));
        jTextFieldDatabaseName.setText(node.get("Connection.databaseName", null));
        jTextFieldUserName.setText("");
        jPasswordFieldPassword.setText("");
        jDialogServerSettings.setVisible(true);

    }//GEN-LAST:event_jMenuItemConnectionSettingsActionPerformed

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


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButtonAnulujServerSettings;
    private javax.swing.JButton jButtonSaveModServerSettings;
    private javax.swing.JDialog jDialogServerSettings;
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
    private javax.swing.JMenuItem jMenuItemConnectionSettings;
    private javax.swing.JMenuItem jMenuItemExit;
    private javax.swing.JMenu jMenuSettings;
    private javax.swing.JPanel jPaneConnectionServerSettings;
    private javax.swing.JPanel jPanelMain;
    private javax.swing.JPanel jPanelServerSettings;
    private javax.swing.JPanel jPanelUserLogin;
    private javax.swing.JPasswordField jPasswordFieldPassword;
    private javax.swing.JScrollPane jScrollPanePozycjaMagazynowa;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JTable jTablePozycjaMagazynowa;
    private javax.swing.JTextField jTextFieldDatabaseName;
    private javax.swing.JTextField jTextFieldFind;
    private javax.swing.JTextField jTextFieldInstance;
    private javax.swing.JTextField jTextFieldServer;
    private javax.swing.JTextField jTextFieldUserName;
    // End of variables declaration//GEN-END:variables
}
