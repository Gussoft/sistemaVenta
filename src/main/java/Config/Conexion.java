package Config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    Connection con;

    public Connection Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sisventas?user=root&password=123456");
        } catch (Exception e) {
            System.out.println("Error Conexion: " + e);
        }
        
        return con;
    }
}
