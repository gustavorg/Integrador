<%@page import="Clases.Producto"%>
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
    <% HRService ñ = new HRService(); String fondo = ñ.general("colorfondo");
       HRService c = new HRService(); String tipol = c.general("tipoletra");
       HRService u = new HRService(); String sizel = u.general("tamañoletra");
       HRService z = new HRService(); String colorl = z.general("colorletra");
       HRService qw = new HRService(); String cfmenu = qw.general("colorfmenu");
       HRService ee = new HRService(); String clmenu = ee.general("colorlmenu");
    %>
    <style>
        body{
            background-color:<%=fondo%> !important;
            font-family: <%=tipol%>, Helvetica, Arial, sans-serif;
            font-size: <%=sizel%>px;
            color: <%=colorl%>;
        }
        .navbar-default{
            background-color: <%=cfmenu%> !important;
            border-color: <%=cfmenu%> !important;
        }
        .navbar-default .navbar-nav>li>a {
            color: <%=clmenu%> !important;
        }
    </style>
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
                                for(ContenidoWeb cw: pag.MostrarContenido("inicion","lizardo2016")){ 
                            %>
                            <li><a href="<%=cw.getId()%>.jsp"><%=cw.getContenido()%></a></li>
                            <%  }
                            %>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                          <form class="navbar-form navbar-left" method="POST" action="Busqueda">
                            <div class="form-group">
                              <input type="text" class="form-control" placeholder="Search" name="search">
                            </div>
                            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                          </form>
                            <li class="dropdown" id="useractive">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="margin-right: -21px !important;"><button type="button" class="btn btn-primary btn-lg"  id="usera"><span class="glyphicon glyphicon-user"></span></button></a>
                                    <ul class="dropdown-menu">
                                      <li><a href="perfil.jsp">Mi Perfil</a></li>
                                      <li><a href="miscompras.jsp">Mis Compras</a></li>
                                      <li><a href="validacion?accion=logout&pag=inicio">Cerrar Sesion</a></li>
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
                                                <input type="text" class="form-control" id="inputEmail3" autocomplete="off" name="user" style="width: 60%;margin-left: 39px;">
                                              </div>
                                            </div>
                                            <div class="form-group">
                                              <label for="pwd" class="col-sm-2 control-label">Password</label>
                                              <div class="col-sm-10">
                                                <input type="password" class="form-control" autocomplete="off" id="inputPassword3" name="pwd" style="width: 60%;margin-left: 39px;">
                                              </div>
                                            </div>
                                              <input type="hidden" name="accion" value="login">
                                              <input type="hidden" name="pag" value="inicio">
                                               <button type="submit" class="btn btn-primary">Ingresar</button>
                                          </form>
                                            <a href="registro.jsp" style="margin-left: 47%;"><button class="btn btn-primary" style="margin-top: -26%;">Registrarse</button></a>
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
           <!-- <p>Bienvenido ${sessionScope.user}</p>-->
            <section>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top:-21px;">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                  </ol>
                  <!-- Wrapper for slides -->

                  <div class="carousel-inner" role="listbox">
                    <div class="item active">
                      <img src="recursos/imagenes/index/c1.jpg" alt="..." style="width: 58%;margin-left: 22%;">
                    </div>
                  <% 
                      HRService hr = new HRService();
                for(ContenidoWeb web: hr.MostrarCarrousel("inicio")){ %>
                    <div class="item">
                      <img src="recursos/imagenes/index/<%= web.getContenido() %>" alt="..." style="width: 58%;margin-left: 22%;">
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
                  <div class="container">
        <div class="row">
            <% HRService pr = new HRService();
                for(Categoria cat: pr.CategoriaNom(1)){ %>
            <h1>
                <%=cat.getNom()%>
            </h1>
                <% }%>
                <div class="row">
                    <% HRService p = new HRService();
                        for(Producto pro: p.ProductoMasVendidos(1)){ %> 
                    <div class="col-sm-6 col-md-3">
                      <div class="thumbnail">
                        <img src="recursos/imagenes/productos/<%=pro.getImagen()%>" alt="...">
                        <div class="caption">
                          <h3><%=pro.getNom_modelo()%></h3>
                          <p><%=pro.getDescripcion()%></p>
                          <p><%=pro.getPrecio()%></p>
                        </div>
                      </div>
                    </div>        
                    <%  }  %>
                </div>
            <% HRService a = new HRService();
                for(Categoria cat: a.CategoriaNom(2)){ %>
            <h1>
                <%=cat.getNom()%>
            </h1>
                <% }%>
                <div class="row">
                 <% HRService b = new HRService();
                for(Producto pro: b.ProductoMasVendidos(2)){ %> 
            <div class="col-sm-6 col-md-3">
 
              <div class="thumbnail">
                <img src="recursos/imagenes/productos/<%=pro.getImagen()%>" alt="..." >
                <div class="caption">
                  <h3><%=pro.getNom_modelo()%></h3>
                  <p><%=pro.getDescripcion()%></p>
                  <p><%=pro.getPrecio()%></p>
                </div>
              </div>
      
            </div>        <%  }  %></div>
             <% HRService k = new HRService();
                for(Categoria cat: k.CategoriaNom(3)){ %>
            <h1>
                <%=cat.getNom()%>
            </h1>
                <% }%>
                <div class="row">
                 <% HRService v = new HRService();
                for(Producto pro: v.ProductoMasVendidos(3)){ %> 
            <div class="col-sm-6 col-md-3">
 
              <div class="thumbnail">
                <img src="recursos/imagenes/productos/<%=pro.getImagen()%>" alt="...">
                <div class="caption">
                  <h3><%=pro.getNom_modelo()%></h3>
                  <p><%=pro.getDescripcion()%></p>
                  <p><%=pro.getPrecio()%></p>
                </div>
              </div>
      
            </div>        <%  }  %></div>
             <% HRService m = new HRService();
                for(Categoria cat: m.CategoriaNom(4)){ %>
            <h1>
                <%=cat.getNom()%>
            </h1>
                <% }%>
                <div class="row">
                 <% HRService y = new HRService();
                for(Producto pro: y.ProductoMasVendidos(4)){ %> 
            <div class="col-sm-6 col-md-3">
 
              <div class="thumbnail">
                <img src="recursos/imagenes/productos/<%=pro.getImagen()%>" alt="...">
                <div class="caption">
                  <h3><%=pro.getNom_modelo()%></h3>
                  <p><%=pro.getDescripcion()%></p>
                  <p><%=pro.getPrecio()%></p>
                </div>
              </div>
      
            </div>        <%  }  %></div>
             <% HRService j = new HRService();
                for(Categoria cat: j.CategoriaNom(5)){ %>
            <h1>
                <%=cat.getNom()%>
            </h1>
                <% }%>
                <div class="row">
                 <% HRService d = new HRService();
                for(Producto pro: d.ProductoMasVendidos(5)){ %> 
            <div class="col-sm-6 col-md-3">
 
              <div class="thumbnail">
                <img src="recursos/imagenes/productos/<%=pro.getImagen()%>" alt="...">
                <div class="caption">
                  <h3><%=pro.getNom_modelo()%></h3>
                  <p><%=pro.getDescripcion()%></p>
                  <p><%=pro.getPrecio()%></p>
                </div>
              </div>
      
            </div>        <%  }  %></div>
             <% HRService g = new HRService();
                for(Categoria cat: g.CategoriaNom(6)){ %>
            <h1>
                <%=cat.getNom()%>
            </h1>
                <% }%>
                <div class="row">
                 <% HRService h = new HRService();
                for(Producto pro: h.ProductoMasVendidos(6)){ %> 
            <div class="col-sm-6 col-md-3">
 
              <div class="thumbnail">
                <img src="recursos/imagenes/productos/<%=pro.getImagen()%>" alt="...">
                <div class="caption">
                  <h3><%=pro.getNom_modelo()%></h3>
                  <p><%=pro.getDescripcion()%></p>
                  <p><%=pro.getPrecio()%></p>
                </div>
              </div>
      
            </div>        <%  }  %></div>
             <% HRService e = new HRService();
                for(Categoria cat: e.CategoriaNom(7)){ %>
            <h1>
                <%=cat.getNom()%>
            </h1>
                <% }%>
                <div class="row">
                 <% HRService f = new HRService();
                for(Producto pro: f.ProductoMasVendidos(7)){ %> 
            <div class="col-sm-6 col-md-3">
 
              <div class="thumbnail">
                <img src="recursos/imagenes/productos/<%=pro.getImagen()%>" alt="...">
                <div class="caption">
                  <h3><%=pro.getNom_modelo()%></h3>
                  <p><%=pro.getDescripcion()%></p>
                  <p><%=pro.getPrecio()%></p>
                </div>
              </div>
      
            </div>        <%  }  %></div>
          </div>
          </div>
            </section>
        </main>
    <footer class="footer">
      <div class="container">
        <p class="text-muted">Place sticky footer content here.</p>
      </div>
    </footer>
    </body>
</html>

