
package modelo.dao;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import modelo.bean.Producto;
import tienda.conexion.Conexion;

public class ProductoDAO {
    
   public static ArrayList<Producto> listar(){
       String sql = "SELECT * FROM producto"; 
       Producto p;
       ArrayList<Producto> lista = new ArrayList<>();
       Connection cn = Conexion.abrir();
       try {
           PreparedStatement ps = cn.prepareStatement(sql);
           ResultSet rs = ps.executeQuery();
           while (rs.next())
            {
                p = new Producto();
                p.setIdpro(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setFoto(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                        
                lista.add(p);
            }
       } catch (Exception ex) {
          Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex); 
       }
       return lista;
   }
   
   public static Producto listarId(int id){
       String sql="select *from producto where idProducto=?";
       Producto p=null;
       Connection cn = Conexion.abrir();
       
       try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Producto(rs.getInt("idProducto"), rs.getString("Nombres"), rs.getString("Foto"), rs.getString("Descripcion"), rs.getDouble("Precio"),rs.getInt("Stock"));
            }

            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return p;
       
   }
       
}
