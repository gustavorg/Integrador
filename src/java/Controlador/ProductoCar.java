
package Controlador;

import Modelo.HRService;

public class ProductoCar {
        public Clases.Producto getProducto(String m){
        return new HRService().ProCarrito(m);
    }
}
