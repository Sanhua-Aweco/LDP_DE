package org.magazynview.core;

import com.microsoft.sqlserver.jdbc.SQLServerCallableStatement;
import com.microsoft.sqlserver.jdbc.SQLServerConnection;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import com.microsoft.sqlserver.jdbc.SQLServerResultSet;
import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.RowSorter;
import javax.swing.SortOrder;
import javax.swing.SwingConstants;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableRowSorter;

/**
 *
 * @author aleksander.lipiec
 */
class TableContainer {

    private final ConnectionPoolManager connection;
    private static final Logger LOGGER_ERR = Logger.getLogger("LOG_ERR.log");

    private TableModelPozycjaMagazynowa tableModelPozycjaMagazynowa;
    private TableRowSorter<TableModelPozycjaMagazynowa> sorterPozycjaMagazynowa;

    TableContainer(ConnectionPoolManager connection) {
        this.connection = connection;
    }

//------------------------------------------------------------------------------------------------------------------------------------
    public void showPozycjaMagazynowa(JTable jTable, JScrollPane jScrollPane) {
        SQLServerConnection conn = connection.getConnectionFromPool();
        try {
            try (SQLServerCallableStatement csmt = (SQLServerCallableStatement) conn.prepareCall("{call sp_pozycjeMagazynoweView()}")) {
                tableModelPozycjaMagazynowa = new TableModelPozycjaMagazynowa((SQLServerResultSet) csmt.executeQuery());
                if (!(tableModelPozycjaMagazynowa.getRowCount() <= 0)) {
                    jTable.setModel(tableModelPozycjaMagazynowa);
                    sorterPozycjaMagazynowa = new TableRowSorter<>(tableModelPozycjaMagazynowa);
                    DefaultTableCellRenderer renderer = (DefaultTableCellRenderer) jTable.getTableHeader().getDefaultRenderer();
                    List<TableRowSorter.SortKey> sortKeys = new ArrayList<>();
                    sortKeys.add(new RowSorter.SortKey(0, SortOrder.ASCENDING));
                    sortKeys.add(new RowSorter.SortKey(2, SortOrder.DESCENDING));
                    sorterPozycjaMagazynowa.setSortKeys(sortKeys);
                    jTable.setRowSorter(sorterPozycjaMagazynowa);
                    jTable.getColumnModel().getColumn(0).setCellRenderer(new CustomTableCellRenderer(350));
                    jTable.getColumnModel().getColumn(1).setCellRenderer(new CustomTableCellRenderer(20, SwingConstants.CENTER));
                    jTable.getColumnModel().getColumn(2).setCellRenderer(new CustomTableCellRenderer(50, SwingConstants.CENTER));
                    jTable.getColumnModel().getColumn(3).setCellRenderer(new CustomTableCellRenderer(50, SwingConstants.CENTER));
                    jTable.getTableHeader().setFont(new Font("Tahoma", Font.BOLD, 10));
                    renderer.setHorizontalAlignment(SwingConstants.CENTER);
                    jTable.setRowSelectionInterval(0, 0);
                    jScrollPane.setViewportView(jTable);
                } else {
                    jScrollPane.setViewportView(null);
                    tableModelPozycjaMagazynowa.fireTableDataChanged();
                }
            } catch (SQLServerException | SQLTimeoutException ex) {
                connection.returnConnectionToPool(conn);
                LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
            }
        } finally {
            connection.returnConnectionToPool(conn);
        }
    }

    public TableModelPozycjaMagazynowa getTableModelPozycjaMagazynowa() {
        return tableModelPozycjaMagazynowa;
    }

    public TableRowSorter<TableModelPozycjaMagazynowa> getSorterPozycjaMagazynowa() {
        return sorterPozycjaMagazynowa;
    }

    class TableModelPozycjaMagazynowa extends AbstractTableModel {

        int numCols;
        int numRows;
        private String[] columnNames = {
            "Pozycja magazynowa",
            "Stan",
            "Lokalizacja",
            "Numer systemowy SSA"};

        private final ResultSet rs;
        private ArrayList<Object> data = new ArrayList<>();

        private TableModelPozycjaMagazynowa(ResultSet rs) {
            this.rs = rs;
            try {
                ResultSetMetaData metaData = rs.getMetaData();
                numRows = 0;
                numCols = metaData.getColumnCount();
                while (rs.next()) {
                    Object[] row = new Object[numCols];
                    for (int j = 0; j < numCols; j++) {
                        row[j] = rs.getObject(j + 1);
                    }
                    data.add(row);
                    numRows++;
                }
            } catch (SQLException ex) {
                LOGGER_ERR.log(Level.SEVERE, ex.getMessage());
            }
        }

        @Override
        public int getColumnCount() {
            return numCols;
        }

        @Override
        public int getRowCount() {
            return numRows;
        }

        @Override
        public Object getValueAt(int rowIndex, int columnIndex) {
            Object[] row = (Object[]) data.get(rowIndex);
            return row[columnIndex];
        }

        @Override
        public String getColumnName(int col) {
            return columnNames[col];
        }

        @Override
        public Class<?> getColumnClass(int c) {
            Object value = getValueAt(0, c);
            return (value == null ? Object.class : value.getClass());
        }

        @Override
        public boolean isCellEditable(int row, int col) {
            return false;
        }
    }

//------------------------------------------------------------------------------------------------------------------------------------
    public class CustomTableCellRenderer extends DefaultTableCellRenderer {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        private int i;

        private CustomTableCellRenderer(int i) {
            this.setHorizontalAlignment(SwingConstants.LEFT);
            this.i = i;
        }

        private CustomTableCellRenderer(int i, int a) {
            this.setHorizontalAlignment(a);
            this.i = i;
        }

        private CustomTableCellRenderer() {
            this.setHorizontalAlignment(SwingConstants.LEFT);
        }

        @Override
        public Component getTableCellRendererComponent(JTable table,
                Object obj, boolean isSelected, boolean hasFocus, int row, int column) {
            if (obj instanceof Date) {
                obj = simpleDateFormat.format(obj);
            }
            if (obj instanceof Boolean) {
                obj = convertBooleanToString((Boolean) obj);
            }
            Component cell = super.getTableCellRendererComponent(table, obj, isSelected, hasFocus, row, column);
            table.getColumnModel().getColumn(column).setPreferredWidth(i);
            table.getTableHeader().setFont(new Font("Tahoma", Font.BOLD, 10));
            cell.setFont(new Font("Tahoma", Font.PLAIN, 10));
            if (isSelected) {
                cell.setBackground(Color.BLACK);
            } else if (row % 2 == 0) {
                cell.setBackground(new Color(240, 240, 240));
            } else {
                cell.setBackground(new Color(160, 160, 160));
            }
            return cell;
        }

        private String convertBooleanToString(Boolean bool) {
            return bool ? "Ready" : "New";
        }
    }

//------------------------------------------------------------------------------------------------------------------------------------
    public class CheckBoxRenderer extends JCheckBox implements TableCellRenderer {

        private final int i;

        CheckBoxRenderer() {
            this.setHorizontalAlignment(JLabel.CENTER);
            this.i = 0;
        }

        CheckBoxRenderer(int i) {
            this.setHorizontalAlignment(JLabel.CENTER);
            this.i = i;
        }

        CheckBoxRenderer(int i, int a) {
            this.setHorizontalAlignment(a);
            this.i = i;
        }

        @Override
        public Component getTableCellRendererComponent(JTable table,
                Object obj, boolean isSelected, boolean hasFocus, int row, int column) {
            if (!(i == 0)) {
                table.getColumnModel().getColumn(column).setPreferredWidth(i);
            }
            table.getTableHeader().setFont(new Font("Tahoma", Font.BOLD, 10));
            if (isSelected) {
                setBackground(Color.BLACK);
            } else if (row % 2 == 0) {
                setBackground(new Color(240, 240, 240));
            } else {
                setBackground(new Color(160, 160, 160));
            }
            setSelected((obj != null && ((Boolean) obj)));
            return this;
        }
    }
}
