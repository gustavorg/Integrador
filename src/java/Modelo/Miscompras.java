package Modelo;
public class Miscompras {
    private String imagen;
    private String nomprod;
    private double precio;
    private int cantidad;
    private double subtotal;
    
    public Miscompras(){
        
    }
    
    public Miscompras(String imagen,String nomprod,double precio,int cantidad,double subtotal){
        this.imagen = imagen;
        this.nomprod = nomprod;
        this.precio = precio;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    /**
     * @return the imagen
     */
    public String getImagen() {
        return imagen;
    }

    /**
     * @param imagen the imagen to set
     */
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    /**
     * @return the nomprod
     */
    public String getNomprod() {
        return nomprod;
    }

    /**
     * @param nomprod the nomprod to set
     */
    public void setNomprod(String nomprod) {
        this.nomprod = nomprod;
    }

    /**
     * @return the precio
     */
    public double getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * @return the subtotal
     */
    public double getSubtotal() {
        return subtotal;
    }

    /**
     * @param subtotal the subtotal to set
     */
    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
}
