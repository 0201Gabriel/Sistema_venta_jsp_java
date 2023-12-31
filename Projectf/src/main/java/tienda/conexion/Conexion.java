package tienda.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
public class Conexion {

    private static  String url = "jdbc:mysql://localhost/bdcarritocompras";
    private static  String usuario = "root";
    private static  String clave = "";
    private static  Connection cn;

    public static Connection abrir() {
        try {
            //registrar driver para la conexion
            //al servidioro mysql
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(url, usuario, clave);
        } catch (Exception ex) {
            return null;  
        }
        return cn;
    }
}
