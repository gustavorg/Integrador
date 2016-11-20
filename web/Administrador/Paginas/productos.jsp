<%@page import="Modelo.ContenidoWeb"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.HRService"%>
<%@page import="java.io.File"%>
<%@page import="Modelo.Conexion"%>
<%   
   HRService pag = new HRService();
   String categoria = request.getParameter("cat");
   if(request.getParameter("cat") == null){
       categoria = "0";
   }else{
       categoria = request.getParameter("cat");
   }
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Editar Productos</title>
        <link href="../../recursos/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../recursos/css/estilo.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../../recursos/js/bootstrap.min.js"></script>
        <script src="../recursos/js/estilo.js"></script>
    </head>
    
    <body>
        
        <div class="row" style="margin-top:14px;">
            
            
            
            <div class="col-xs-2 col-sm-2">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="../index.jsp">Inicio</a></li>
                    <li role="presentation"><a href="../productos.jsp">Productos</a></li>
                    <li role="presentation"><a href="../ventas.jsp">Ventas</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" role="presentation" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Editar Paginas <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                          <li><a href="inicio.jsp">Inicio</a></li>
                          <li><a href="#">Nosotros</a></li>
                          <li><a href="productos.jsp">Productos</a></li>
                          <li><a href="general.jsp">General</a></li>
                        </ul>
                    </li>
                    <li><a href="../../validacion?accion=logout&pag=">Cerrar Sesion</a></li>
                </ul>
            </div>
            
            
            
            
            
                
            <div class="col-xs-2 col-sm-2">
                <h1>Categorias</h1>
                <div class="list-group">
                     <% HRService c = new HRService(); 
                for(Modelo.Categoria cat: c.Categorias()){ %> 
                <a href="productos.jsp?cat=<%=cat.getId()%>" class="list-group-item"><%=cat.getNom()%></a>
                <% } %>
              </div>
            </div>
              
              
              
            <div class="col-xs-20 col-sm-8">
                 <% HRService b = new HRService();
    
                for(Clases.Producto pro: b.Productos(categoria)){ %> 
                <div class="col-sm-6 col-md-3">
                    <div class="row">
                <div class="thumbnail">
                    <img src="../../recursos/imagenes/productos/<%=pro.getImagen()%>" alt="..." width="200"  height="200">
                  <div class="caption">
                    <h3><%=pro.getNom_modelo()%></h3>

                    <p>S/<%=pro.getPrecio()%><a href="producto_detalle.jsp?mod=<%=pro.getNom_modelo()%>" class="btn btn-primary" role="button" style="margin-left: 30% !important;margin-top: 6px !important;   ">Ver Producto</a></p>
                  </div>
                </div>
                </div> </div>       <%  }  %>
                   </div>
            
            
             </div>
    </body>
</html>
