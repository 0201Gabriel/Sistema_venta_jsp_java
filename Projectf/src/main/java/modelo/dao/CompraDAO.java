
package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.bean.Carrito;
import modelo.bean.Compra;
import modelo.bean.Detalle;
import tienda.conexion.Conexion;

public class CompraDAO {
    ResultSet rs;   
     public void agregarCompras(Compra compra) {
        String sql = "insert into compras(idCliente,idPago,FechaCompras,Monto,Estado)values(?,?,?,?,?)";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps=cn.prepareStatement(sql);
            //asignar valor a los parametros ?,?,?,?
            ps.setInt(1, compra.getCliente().getId());   
            ps.setInt(2, compra.getIdpago());
            ps.setString(3, compra.getFecha());
            ps.setDouble(4, compra.getMonto());
            ps.setString(5, compra.getEstado());
            //ejecutar
            ps.executeUpdate();
            
            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
    public void agregarDetalle(Detalle detalle) {
        String sql="insert into detalle_compras(idProducto,idCompras,Cantidad,PrecioCompra)values(?,?,?,?)";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps=cn.prepareStatement(sql);
            //asignar valor a los parametros ?,?,?,?
            ps=cn.prepareStatement(sql);
                ps.setInt(1, detalle.getIdproducto());
                ps.setInt(2, detalle.getIdcompra());
                ps.setInt(3, detalle.getCantidad());
                ps.setDouble(4, detalle.getPrecioCompra());
            //ejecutar
            ps.executeUpdate();
            
            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int IdCompra() {
        int idc = 0;
        String sql = "select max(idCompras) from compras";
        try {
            Connection cn = Conexion.abrir();
            PreparedStatement ps=cn.prepareStatement(sql);
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idc = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return idc;
    }
    
    
}
