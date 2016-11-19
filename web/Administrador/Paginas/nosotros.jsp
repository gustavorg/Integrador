<%-- 
    Document   : index.jsp
    Created on : 01-nov-2016, 23:19:37
    Author     : GRLIMA
--%>

<%@page import="Modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Editar Nosotros</title>
        <link href="../../recursos/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../recursos/css/estilo.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../../recursos/js/bootstrap.min.js"></script>
        <script src="../recursos/js/estilo.js"></script>
    </head>
    <body>
        <div class="row">
            <div class="col-md-4">
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
            <div class="col-md-8">
                <form action="../../imagenes" method="POST" enctype="multipart/form-data" style="margin-top: 23px;">
                    <table>
                        <tr>
                                <label>Imagen de Portada</label>
                                <p>Recomendacion Subir Imagen de (1360x300) pixeles </p>
                            <td>
                                <input type="file" name="txtImagenn" size="30" id="txtImagenn" >
                            </td>
                            <br>
                            <td>      
                                <input type="submit" class="btn btn-primary" value="Guardar" style="margin-left: 22px;">
                            </td>
                        </tr>
                    </table>
                </form>    
             <%
                HRService h = new HRService();
                for(ContenidoWeb web: h.MostrarNosotros("MISIÓN","lizardo2016")){ %>
            <div class="row">
                    <h1>Mision</h1>
                    <form method="POST" action="../../updateno">
                    <textarea style="margin: 0px; width: 826px; height: 94px;" name="mision"><%=web.getContenido()%></textarea>
                    <input type="hidden" name="usuario" value="lizardo2016">
                    <input type="hidden" name="id" value="MISION">
                    <input type="submit" value="Actualizar" style="MARGIN-LEFT:85% ">
                    </form>
            </div>
            <% } 
                HRService d = new HRService();
                for(ContenidoWeb web: d.MostrarNosotros("VISIÓN","lizardo2016")){ %>
            <div class="row">
                    <h1>Vision</h1>
                    <form method="POST" action="../../updateno">
                    <textarea style="margin: 0px; width: 826px; height: 94px;" name="mision"><%=web.getContenido()%></textarea>
                    <input type="hidden" name="usuario" value="lizardo2016">
                    <input type="hidden" name="id" value="VISION">
                    <input type="submit" value="Actualizar" style="MARGIN-LEFT:85% ">
                    </form>
            </div>
                 <% } %>
                   
                </div>
            </div>
        </div>
       
    </body>
</html>
