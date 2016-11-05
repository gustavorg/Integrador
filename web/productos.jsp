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
        <title>Productos</title>
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
                                for(Modelo.Pagina info: pag.InfoPag()){ 
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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="margin-right: -21px !important;"><button type="button" class="btn btn-primary btn-lg"  id="usera"><span class="glyphicon glyphicon-user"></span></button></a>
                                    <ul class="dropdown-menu">
                                      <li><a href="#">Mi Perfil</a></li>
                                      <li><a href="#">Mis Compras</a></li>
                                      <li><a href="login">Cerrar Sesion</a></li>
                                    </ul>
                            </li>
                            <li id="user" data-id="${sessionScope.usuario}"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="btnuser"><span class="glyphicon glyphicon-user"></span></button></li>
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Login</h4>
                                      </div>
                                      <div class="modal-body">
                                          <form class="form-horizontal" method="POST" action="login">
                                            <div class="form-group">
                                              <label for="inputEmail3" class="col-sm-2 control-label">Usuario</label>
                                              <div class="col-sm-10">
                                                <input type="text" class="form-control" id="inputEmail3" name="u" style="width: 60%;margin-left: 39px;">
                                              </div>
                                            </div>
                                            <div class="form-group">
                                              <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                                              <div class="col-sm-10">
                                                <input type="password" class="form-control" id="inputPassword3" name="pwd" style="width: 60%;margin-left: 39px;">
                                              </div>
                                            </div>
                                               <button type="submit" class="btn btn-primary">Ingresar</button>
                                          </form>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                            <li id="carrito"><button class="btn btn-primary btn-lg" id="btncarrito"><span class="glyphicon glyphicon-shopping-cart" ></span></button></a></li>
                        </ul>
                    </div>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>
        </header>
        <main>
             <p>Bienvenido ${sessionScope.usuario}</p>
            <section>
        <div class="row">
            <div class="col-md-3">
                <h1>Categorias</h1>
                <div class="list-group">
                     <% HRService c = new HRService();
                for(Modelo.Categoria cat: c.Categorias()){ %> 
                <a href="productos.jsp?cat=<%=cat.getId()%>" class="list-group-item"><%=cat.getNom()%></a>
                <% } %>
              </div>
            </div>
                   <div class="col-md-9">
                 <% HRService b = new HRService();
    
                for(Modelo.Producto pro: b.Productos(categoria)){ %> 
                <div class="col-sm-6 col-md-3">
                <div class="thumbnail">
                    <img src="recursos/imagenes/productos/<%=pro.getImagen()%>" alt="..." width="200" >
                  <div class="caption">
                    <h3><%=pro.getNom_modelo()%></h3>
                    <p><%=pro.getDescripcion()%></p>
                    <p><%=pro.getPrecio()%><a href="producto_detalle.jsp?mod=<%=pro.getNom_modelo()%>" class="btn btn-primary" role="button" style="margin-left: 42% !important;">Ver Producto</a></p>
                  </div>
                </div>
                </div>        <%  }  %>
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

