/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.xlightweb.IHttpRequest;
import org.xlightweb.MultipartFormDataRequest;
/**
 *
 * @author GRLIMA
 */
@WebServlet(name = "imagenes", urlPatterns = {"/imagenes"})
public class imagenes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
        
        String archivourl = "D:\\Carlos Iván\\Desktop\\CMSProductos\\web\\recursos\\imagenes\\index";
       
        DiskFileItemFactory factory = new DiskFileItemFactory();
        
        factory.setSizeThreshold(1024);
        
        factory.setRepository(new File(archivourl));
        
        ServletFileUpload upload = new ServletFileUpload(factory);
                        String cod = ""; 



        try{

            String nom ="";
            List<FileItem> partes = upload.parseRequest(request);

             
            if(!"carrousel2".equals(cod) && !"carrousel3".equals(cod)){
                nom = "\\c1.jpg";
            }else if("carrousel2".equals(cod)){
                nom = "\\c2.jpg";
            }else if("carrousel3".equals(cod)){
                nom = "\\c3.jpg";
            }
            
            
            
            
            for(FileItem items: partes){
            File file = new File(archivourl,items.getName());
            String ruta = archivourl + "\\"+  items.getName();
            String ruta2 = archivourl + nom;
                if(ruta == null ? ruta2 != null : !ruta.equals(ruta2)){
                File file2 = new File(ruta2);
                file2.delete();
                }
                items.write(file);
                File archivo=new File(ruta);
                archivo.renameTo(new File(ruta2));
             }
        //      response.sendRedirect("Administrador/Paginas/inicio.jsp");
              }catch(Exception e){
            out.print("ERROR "+e.getMessage()+"");
    //response.sendRedirect("Administrador/Paginas/inicio.jsp");
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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(imagenes.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(imagenes.class.getName()).log(Level.SEVERE, null, ex);
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
