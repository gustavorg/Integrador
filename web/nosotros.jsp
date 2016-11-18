<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Nosotros</title>
        <link href="recursos/css/bootstrap.min.css" rel="stylesheet">
        <link href="recursos/css/estilo.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="recursos/js/bootstrap.min.js"></script>
        <script src="recursos/js/estilo.js"></script>
        <script>
            window.onload = function(){
                $('#useractive').hide();
                if($('#user').data('id') != ""){
                    $('#useractive').show();
                    $('#user').hide();
               }
             };
        </script>
    </head>
        <% HRService ñ = new HRService(); String fondo = ñ.general("colorfondo");
       HRService c = new HRService(); String tipol = c.general("tipoletra");
       HRService u = new HRService(); String sizel = u.general("tamañoletra");
       HRService z = new HRService(); String colorl = z.general("colorletra");
    %>
    <style>
        body{
            background-color:"<%=fondo%> !important";
            font-family: "<%=tipol%>", Helvetica, Arial, sans-serif;
            font-size: "<%=sizel%>px";
            color: "<%=colorl%>";
        }
    </style>
    <body>
        <header>
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <div class="container">
                        <ul class="nav navbar-nav">
                            <%
                                HRService pag = new HRService();
                                for(ContenidoWeb cw: pag.MostrarContenido("inicion","lizardo2016")){ 
                            %>
                            <li><a href="<%=cw.getId()%>.jsp"><%=cw.getContenido()%></a></li>
                            <%  }
                            %>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                          <form class="navbar-form navbar-left">
                            <div class="form-group">
                              <input type="text" class="form-control" placeholder="Search">
                            </div>
                            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                          </form>
                            <li class="dropdown" id="useractive">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="margin-right: -21px !important;"><button type="button" class="btn btn-primary btn-lg"  id="usera"><span class="glyphicon glyphicon-user"></span></button></a>
                                    <ul class="dropdown-menu">
                                      <li><a href="perfil.jsp">Mi Perfil</a></li>
                                      <li><a href="miscompras.jsp">Mis Compras</a></li>
                                      <li><a href="validacion?accion=logout&pag=nosotros">Cerrar Sesion</a></li>
                                    </ul>
                            </li>
                            <li id="user" data-id="${sessionScope.user}"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="btnuser"><span class="glyphicon glyphicon-user"></span></button></li>
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content" id="login">
                                      <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Login</h4>
                                      </div>   
                                      <div class="modal-body">
                                          <form class="form-horizontal" method="POST" action="validacion">
                                            <div class="form-group">
                                              <label for="user" class="col-sm-2 control-label">Usuario</label>
                                              <div class="col-sm-10">
                                                <input type="text" class="form-control" id="inputEmail3" name="user" style="width: 60%;margin-left: 39px;">
                                              </div>
                                            </div>
                                            <div class="form-group">
                                              <label for="pwd" class="col-sm-2 control-label">Password</label>
                                              <div class="col-sm-10">
                                                <input type="password" class="form-control" id="inputPassword3" name="pwd" style="width: 60%;margin-left: 39px;">
                                              </div>
                                            </div>
                                               <input type="hidden" name="accion" value="login">
                                               <input type="hidden" name="pag" value="nosotros">
                                               <button type="submit" class="btn btn-primary">Ingresar</button>
                                          </form>
                                      </div>
                                   </div>
                                  </div>
                                </div>
                            <li id="carrito"><a href="carrito.jsp" style="margin-top: -15px;"><button class="btn btn-primary btn-lg" id="btncarrito"><span class="glyphicon glyphicon-shopping-cart" ></span></button></a></li>
                        </ul>
                    </div>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>
        </header>
        <main>
            <p>Bienvenido ${sessionScope.user}</p>
            <% HRService hr = new HRService();
                for(ContenidoWeb web: hr.MostrarNosotros("PORTADA","lizardo2016")){ %>
            <div class="row">
                <img src="recursos/imagenes/nosotros/<%=web.getContenido()%>" class="img-responsive" alt="Responsive image">
            </div>
             <% }
                HRService h = new HRService();
                for(ContenidoWeb web: h.MostrarNosotros("MISION","lizardo2016")){ %>
            <div class="container">
                <div class="panel panel-default" style="margin-top: 18px;">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="recursos/imagenes/nosotros/MISION.jpg" class="img-responsive" alt="Responsive image">
                            </div>
                            <div class="col-md-8">
                                <h1>Mision</h1>
                                <p><%=web.getContenido()%></p>
                            </div> 
                        </div>
                    </div>
                </div>

                <% } 
                    HRService d = new HRService();
                    for(ContenidoWeb web: d.MostrarNosotros("VISION","lizardo2016")){ %>
                <div class="panel panel-default">
                    <div class="panel-body">   
                        <div class="row">
                            <div class="col-md-8">
                                <h1>Vision</h1>
                                <p><%=web.getContenido()%></p>
                            </div>
                            <div class="col-md-4">
                                <img src="recursos/imagenes/nosotros/VISION.jpg" class="img-responsive" alt="Responsive image">
                            </div>
                        </div>
                    </div>
                </div>
                <% }
                    HRService df = new HRService();
                    for(ContenidoWeb web: df.MostrarNosotros("UBICACION","lizardo2016")){ %>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-4">
                                <h1>Ubicanos en..</h1>
                                <img src="recursos/imagenes/nosotros/ubicanos.png" class="img-responsive" alt="Responsive image">
                            </div>
                            <div class="col-md-8">
                                 <%=web.getContenido()%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                 <% } %>
        </main>
    <footer class="footer">
      <div class="container">
        <p class="text-muted">Place sticky footer content here.</p>
      </div>
    </footer>
    </body>
</html>

