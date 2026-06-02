package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class ConnectionFactory {
    private Connection conn;
    
    public void setconnect()throws SQLException, ClassNotFoundException{
        this.conn = null;
        
            Class.forName("oracle.jdbc.OracleDriver");
            this.conn = DriverManager.getConnection(
                        "jdbc:oracle:thin:@localhost:1521:xe",
                        "system",
                        "1234"
                    );
    }
    public Connection getconnect(){
        return this.conn;
    }
    public void exitconnect(){
        try {
            this.conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
}
