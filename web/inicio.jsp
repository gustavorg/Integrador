<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.HRService"%>
<%@page import="java.io.File"%>
<%@page import="Modelo.Conexion"%>
<%   
   HRService pag = new HRService();
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
                            <li><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="btnuser"><span class="glyphicon glyphicon-user"></span></button></li>
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Login</h4>
                                      </div>
                                      <div class="modal-body">
                                        ...
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-primary">Ingresar</button>
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
            <section>
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
                      <img src="recursos/imagenes/index/c1.jpg" alt="..." style="
    width: 58%;
    margin-left: 22%;
">
                      <div class="carousel-caption">
                        ...
                      </div>
                    </div>
                    <div class="item">
                      <img src="recursos/imagenes/index/c1.jpg" alt="..." style="
    width: 58%;
    margin-left: 22%;
">
                      <div class="carousel-caption">
                        ...
                      </div>
                    </div>
                    ...
                  </div>

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
	<!--<form action=up.jsp method=post enctype=multipart/form-data>
		<table>
			<tr>
			<td>Imagen</td>
			<td><input type=file name=fichero></td>
			</tr>
			<tr><td colspan=2><input type=submit value=enviar name=enviar>
			</td>
			</tr>
		</table>
	</form>-->
        <div class="row">
            <% HRService pr = new HRService();
                for(Modelo.Categoria cat: pr.Categoria1()){ %>
            <h1>
                <%=cat.getNom()%>
            </h1>
                <% }%>
            <% HRService p = new HRService();
                for(Modelo.Producto pro: p.Producto1()){ %> 
            <div class="col-sm-6 col-md-4">
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
            
                      <% HRService a = new HRService();
                for(Modelo.Categoria cat: a.Categoria2()){ %>
            <h1>
                <%=cat.getNom()%>
            </h1>
                <% }%>
                 <% HRService b = new HRService();
                for(Modelo.Producto pro: b.Producto2()){ %> 
            <div class="col-sm-6 col-md-4">
 
              <div class="thumbnail">
                <img src="recursos/imagenes/productos/<%=pro.getImagen()%>" alt="...">
                <div class="caption">
                  <h3><%=pro.getNom_modelo()%></h3>
                  <p><%=pro.getDescripcion()%></p>
                  <p><%=pro.getPrecio()%></p>
                </div>
              </div>
      
            </div>        <%  }  %>
            
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
