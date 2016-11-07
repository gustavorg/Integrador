<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="java.io.File"%>
<%   
   HRService x = new HRService();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inicio</title>
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
    <body>
        <header>
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                </div>
                
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <div class="container">
                        <ul class="nav navbar-nav">
                            <%
                                HRService pag = new HRService();
                                for(Pagina info: pag.InfoPag()){ 
                            %>
                            <li><a href="<%=info.getNompagina()%>.jsp"><%=info.getTitulo()%></a></li>
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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="
    margin-right: -21px !important;
"><button type="button" class="btn btn-primary btn-lg"  id="usera"><span class="glyphicon glyphicon-user"></span></button></a>
                                    <ul class="dropdown-menu">
                                      <li><a href="#">Mi Perfil</a></li>
                                      <li><a href="#">Mis Compras</a></li>
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
<li id="carrito"><a href="carrito.jsp" style="
    margin-top: -15px;
"><button class="btn btn-primary btn-lg" id="btncarrito"><span class="glyphicon glyphicon-shopping-cart" ></span></button></a></li>
                        </ul>
                    </div>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>
        </header>
        <main>
            <p>Bienvenido ${sessionScope.user}</p>
            <% HRService hr = new HRService();
                for(ContenidoWeb web: hr.MostrarContenido("PORTADA")){ %>
            <div class="row">
                <img src="recursos/imagenes/nosotros/<%=web.getContenido()%>" class="img-responsive" alt="Responsive image">
            </div><br>
             <% }
                HRService h = new HRService();
                for(ContenidoWeb web: h.MostrarContenido("MISION")){ %>
            <div class="row">
                <div class="col-md-4">
                    <img src="recursos/imagenes/nosotros/MISION.jpg" class="img-responsive" alt="Responsive image">
                </div>
                <div class="col-md-8">
                    <h1>Mision</h1>
                    <p><%=web.getContenido()%></p>
                </div> 
            </div>
            <% } 
                HRService d = new HRService();
                for(ContenidoWeb web: d.MostrarContenido("VISION")){ %>
                <div class="row">
                <div class="col-md-8">
                    <h1>Vision</h1>
                    <p><%=web.getContenido()%></p>
                </div>
                <div class="col-md-4">
                    <img src="recursos/imagenes/nosotros/VISION.jpg" class="img-responsive" alt="Responsive image">
                </div>
            </div>
                 <% } %>
            <div class="row">
                <div class="container">
                    <h3>Ubicanos</h3>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d975.4213750774521!2d-77.036809038414!3d-12.06514662281234!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2spe!4v1478493689788" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div></div>
           
        </main>
    <footer class="footer">
      <div class="container">
        <p class="text-muted">Place sticky footer content here.</p>
      </div>
    </footer>
    </body>
</html>

