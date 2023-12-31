
package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.bean.Cliente;
import tienda.conexion.Conexion;

public class ClienteDAO {
     public static Cliente login(String dni, String contraseña) {
         Cliente cli=null;
        String sql = "SELECT * FROM CLIENTE WHERE Dni=? and Password=?";
        //Conexiin
        Connection cn = Conexion.abrir();
        try {
            //ejecuar instruccion sql
            PreparedStatement ps = cn.prepareStatement(sql);
            //asiganar valor a  los parametros ?,?
            ps.setString(1, dni);
            ps.setString(2, contraseña);
            //ejecuar
            ResultSet rs = ps.executeQuery();      
            if (rs.next()) {
                //se encapsula los valores del registro de la tabla usiario
                //en el obejto usuario user
                cli = new Cliente(rs.getInt("idCliente"),rs.getString("Dni"), rs.getString("Nombres"),
                        rs.getString("Direccion"), rs.getString("Email"), rs.getString("Password"));
            }
        } catch (SQLException ex) {
            return null;
        }

        return cli;
    }
     
     //-----------------------------------
      public static void agregar(Cliente cliente) {
        String sql = "insert into cliente(Dni,Nombres,Direccion,Email,Password)values(?,?,?,?,?)";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps=cn.prepareStatement(sql);
            //asignar valor a los parametros ?,?,?,?
            ps.setString(1, cliente.getDni());
            ps.setString(2, cliente.getNombre());
            ps.setString(3, cliente.getDireccion());
            ps.setString(4, cliente.getCorreo());
            ps.setString(5, cliente.getPassword());
            //ejecutar
            ps.executeUpdate();
            
            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      
      public static Cliente buscarId(int cod) {
        Cliente cli = null;
        String sql = "SELECT*FROM CLIENTE WHERE idCliente=?";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, cod);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cli = new Cliente(rs.getInt("idCliente"),rs.getString("Dni"), rs.getString("Nombres"),
                        rs.getString("Direccion"), rs.getString("Email"), rs.getString("Password"));
            }

            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cli;
    }
     
     
}
