
package Modelo;
public class Venta {
    private String usuario;
    private Double total;

    public Venta(){
        
    }
    
    public Venta(String usuario,Double total){
        this.usuario = usuario;
        this.total = total;
    }
    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the total
     */
    public Double getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(Double total) {
        this.total = total;
    }
}
