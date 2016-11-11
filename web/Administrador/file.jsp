<%-- 
    Document   : file
    Created on : 07-nov-2016, 22:26:41
    Author     : GRLIMA
--%>

<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
        
       
        String archivourl = "D:\\Carlos Iván\\Desktop\\CMSProductos\\web\\recursos\\imagenes\\index";
       
        DiskFileItemFactory factory = new DiskFileItemFactory();
        
        factory.setSizeThreshold(1024);
        
        factory.setRepository(new File(archivourl));
        
        ServletFileUpload upload = new ServletFileUpload(factory);
        
            String cod = request.getParameter("cod"); 
            out.print(cod);
        try{

            List<FileItem> partes = upload.parseRequest(request);
            for(FileItem items: partes){
            File file = new File(archivourl,items.getName());
            String ruta = archivourl + "\\"+  items.getName();
            String ruta2 = archivourl + "\\carrousel1.jpg";
                if(ruta != ruta2){
                File file2 = new File(ruta2);
                file2.delete();
                }
                items.write(file);
                File archivo=new File(ruta);
                archivo.renameTo(new File(ruta2));
             }
       response.sendRedirect("Paginas/inicio.jsp");
              }catch(Exception e){
            out.print("ERROR "+e.getMessage()+"");
    response.sendRedirect("Paginas/inicio.jsp");
        }
        
        
        %>
    </body>
</html>
