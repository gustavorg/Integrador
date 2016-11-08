/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Conexion;
import Modelo.HRService;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GRLIMA
 */
@WebServlet(name = "validacion", urlPatterns = {"/validacion"})
public class validacion extends HttpServlet {

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
            
            if(accion.equals("login")){
                Login(request, response); 
            }
            if(accion.equals("logout")){
                Logout(request, response); 
            }
        }
    }
       
       private void Login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
            
        String usuario = request.getParameter("user");
        String clave = request.getParameter("pwd");
        String pag = request.getParameter("pag");
            out.print(usuario); 
            out.print(clave); 
        try{
            HRService hr= new HRService();
            Usuario usu = hr.VerificarUsuario(usuario);
            if(usuario.equals(usu.getUsuario())){
                if(clave.equals(usu.getPwd())){
                    if("2".equals(usu.getTipo())){
                        request.getSession().setAttribute("user", usu.getUsuario());
                        if(pag.equals("inicio")){
                           response.sendRedirect("inicio.jsp");
                        }else if(pag.equals("productos")){
                            response.sendRedirect("productos.jsp");
                        }else if(pag.equals("nosotros")){
                            response.sendRedirect("nosotros.jsp");
                        }else if(pag.equals("detalle")){
                            response.sendRedirect("producto_detalle.jsp?mod=" + request.getParameter("modelo"));
                        }
                    }else{
                        request.getSession().setAttribute("user", usu.getUsuario());
                        response.sendRedirect("Administrador/index.jsp");
                    }
                }else{
                    out.print("Su clave es incorrecto"); 
                }
            }else{
                out.print("Su Usuario es incorrecto"); ; 
            }
            
        }catch(Exception ex){out.println(ex);}
    }      
             
             
       private void Logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        String pag = request.getParameter("pag");
        if(pag.equals("inicio")){
            response.sendRedirect("inicio.jsp");
        }else if(pag.equals("productos")){
            response.sendRedirect("productos.jsp");
        }else if(pag.equals("nosotros")){
            response.sendRedirect("nosotros.jsp");
        }else if(pag.equals("detalle")){
            response.sendRedirect("producto_detalle.jsp?mod=" + request.getParameter("modelo"));
        }else if(pag.equals(""))
            response.sendRedirect("inicio.jsp");
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
