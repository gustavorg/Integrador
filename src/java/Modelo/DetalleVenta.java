/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Producto;

/**
 *
 * @author Daniel
 */
public class DetalleVenta {
    private String imagen;
    private String nomprod;
    private double precio;
    private int cant;
    private double subtotal;
    public DetalleVenta(){
        
    }
    public DetalleVenta(String imagen,String nomprod,double precio,int cant,double subtotal){
        this.imagen = imagen;
        this.nomprod = nomprod;
        this.precio = precio;
        this.cant = cant;
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
     * @return the cant
     */
    public int getCant() {
        return cant;
    }

    /**
     * @param cant the cant to set
     */
    public void setCant(int cant) {
        this.cant = cant;
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
