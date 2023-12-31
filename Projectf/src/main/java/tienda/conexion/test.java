
package tienda.conexion;

import java.sql.Connection;

public class test {
    public static void main(String[] args) {
         Connection cn=Conexion.abrir();
         System.out.println("conexion a db: "+cn);
    }
    
}
