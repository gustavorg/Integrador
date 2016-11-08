<%@page import="Modelo.ContenidoWeb"%>
<%@page import="Modelo.HRService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Editar Inicio</title>
        <link href="../../recursos/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../recursos/css/estilo.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../../recursos/js/bootstrap.min.js"></script>
        <script src="../../recursos/js/estilo.js"></script>
    </head>
    <body>
        <div class="row">
            <div class="col-md-4">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="index.jsp">Inicio</a></li>
                    <li role="presentation"><a href="productos.jsp">Productos</a></li>
                    <li role="presentation"><a href="ventas.jsp">Ventas</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" role="presentation" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Editar Paginas <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                          <li><a href="Paginas/inicio.jsp">Inicio</a></li>
                          <li><a href="Paginas/productos.jsp">Productos</a></li>
                          <li><a href="Paginas/nosotros.jsp">Nosotros</a></li>
                        </ul>
                    </li>
                   <li><a href="../validacion?accion=logout&pag=">Cerrar Sesion</a></li>
                </ul>
            </div>
            <div class="col-md-8">
                <h4> Carrousel </h4>
              
                <form action="guardarimagen">
                        <% 
                                    HRService h = new HRService();
                              for(ContenidoWeb w: h.MostrarCarrousel("inicio")){ %>
                <tr>
                    <td class="primeraColumna">
                        Imagen w.getId():
                    </td>
                    <td>
                        <dd> <input type="file" name="txtImagen" size="30" id="txtImagen" class="textBox"> </dd>
                    </td>
                </tr>
                <% } %>
                <tr>
                    <td colspan="2" class="Botones">
                        <br>
                        <input type="button" name="btnCancelar" id="btnCancelar" class="button" value="Cancelar">
                        <input type="button" name="btnRegistrar" id="btnRegistrar" class="button" value="Registrar">
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>
                
            </table>
                    
                </form>    
                    <h5>Vista Previa</h5>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                  <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                </ol>
                                <!-- Wrapper for slides -->

                                <div class="carousel-inner" role="listbox">
                                  <div class="item active">
                                    <img src="../../recursos/imagenes/index/c1.jpg" alt="..." style="
                  width: 58%;
                  margin-left: 22%;
              ">
                                  </div>
                                <% 
                                    HRService hr = new HRService();
                              for(ContenidoWeb web: hr.MostrarCarrousel("inicio")){ %>
                                  <div class="item">
                                    <img src="../../recursos/imagenes/index/<%= web.getContenido() %>" alt="..." style="
                  width: 58%;
                  margin-left: 22%;
              ">
                                  </div>
              <% } %>
                                <!-- Controls -->
                                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                  <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                  <span class="sr-only">Next</span>
                                </a>
                              </div>
              </div>
            </div>
        </div>
       
    </body>
</html>
