/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Conexion;
import Modelo.HRService;
import Modelo.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GRLIMA
 */
@WebServlet(name = "Venta", urlPatterns = {"/Venta"})
public class Ventas extends HttpServlet {

    Statement stm;
         ResultSet rs;
         PreparedStatement pr;
         CallableStatement cst ;
         Conexion cn = new Conexion();
         Connection conex = cn.MySQLConnect();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String accion = request.getParameter("accion");
            
            if(accion.equals("RegistrarVenta")){
                this.RegistrarVenta(request, response); 
            }
            
        }
    }
private void RegistrarVenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        ArrayList lista = (ArrayList)session.getAttribute("carrito");
        
        DecimalFormat df = new DecimalFormat("0.00");
        DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
        dfs.setDecimalSeparator('.');
        df.setDecimalFormatSymbols(dfs);
         
        Modelo.Venta v = new Venta();
        v.setUsuario(request.getParameter("user")); 
        v.setTotal(Double.parseDouble(request.getParameter("total")));
      
        HRService hr = new HRService();
        boolean resp = hr.insertarVenta(v);
        
         
        if(resp){
            // Regostrar detalle vemta
            String IdProducto[] = request.getParameterValues("IdProd");
            String PrecioProducto[] = request.getParameterValues("precio");
            String CantidadProducto[] = request.getParameterValues("quantity");
            String SubTotalProducto[] = request.getParameterValues("subtotal");
            String Usuario[] = request.getParameterValues("user");
            String id[] = request.getParameterValues("IdVenta");

      
            for(int i=0; i<IdProducto.length;i++){
                try{
                    cst = conex.prepareCall("CALL REGISTRAR_DETALLE_VENTA (?,?,?,?,?,?)");
                    cst.setString(1, IdProducto[i]);
                    cst.setString(2, PrecioProducto[i]);
                    cst.setString(3, CantidadProducto[i]);
                    cst.setString(4, SubTotalProducto[i]);
                    cst.setString(5, Usuario[i]);
                    cst.setString(6, id[i]);
                    int j = cst.executeUpdate();
                    if(j==1){
                        out.print("Registro Satisfactorio"); 
                        response.sendRedirect("productos.jsp");
                        lista.clear();
                    }else{
                         
                    }
                }catch(Exception e){System.out.println(e);}
            }
        }else{
            out.print(request.getParameter("user") + " "+ request.getParameter("total") + " " + resp);
            System.out.println();
                            System.out.println(request.getParameter("Error al registrar su compra GENERAL"));
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
