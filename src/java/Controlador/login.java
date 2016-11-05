/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LAB-USR-AQ265-A0108
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {
 ResultSet rs;
          PreparedStatement pr;
         CallableStatement cst ;
         Conexion cn = new Conexion();
         Connection conex = cn.MySQLConnect();

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
        HttpSession sesion = request.getSession();
        sesion.invalidate();
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   HttpSession sesion = request.getSession();
           String usuario=request.getParameter("u");
           String pwd= request.getParameter("pwd");
         String sql="SELECT Usuario,Password,Tipo FROM usuario WHERE Usuario = ? AND Password = ? ";
        String a = "";
             try{
            pr=conex.prepareStatement(sql);
            pr.setString(1, usuario);
            pr.setString(2, pwd);
            rs=pr.executeQuery();
            while(rs.next()){
                 if(usuario.equals(rs.getString(1)) && pwd.equals(rs.getString(2)) && sesion.getAttribute("usuario") == null){
                     
                    if(rs.getString(3) == "2"){
                        sesion.setAttribute("usuario", usuario);
                     response.sendRedirect("inicio.jsp");
                    }else{
                        sesion.setAttribute("usuario", usuario);
                        response.sendRedirect("Administrador/index.jsp");
                    }
                     
                 }
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                conex.close();
            }catch(Exception ex){

            }
        } 
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
