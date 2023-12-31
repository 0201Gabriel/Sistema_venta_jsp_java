
package modelo.bean;

public class Detalle {
   private int id;
   private int idproducto;
   private int idcompra; 
   private int cantidad;
   private double precioCompra;
 

    public Detalle() {
    }

    public Detalle(int id, int idproducto, int idcompra, int cantidad, double precioCompra, Producto producto) {
        this.id = id;
        this.idproducto = idproducto;
        this.idcompra = idcompra;
        this.cantidad = cantidad;
        this.precioCompra = precioCompra;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public int getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(int idcompra) {
        this.idcompra = idcompra;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

   
   
   
}
