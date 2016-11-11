<%@page import="Controlador.ProductoCar"%>
<%@page import="Clases.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     HttpSession sesion = request.getSession(true);
     ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Carrito</title>
        <link href="recursos/css/bootstrap.min.css" rel="stylesheet">
        <link href="recursos/css/estilo.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="recursos/js/bootstrap.min.js"></script>
        <script src="recursos/js/estilo.js"></script>
        <script src="recursos/js/carrito.js"></script>
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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="
    margin-right: -21px !important;
"><button type="button" class="btn btn-primary btn-lg"  id="usera"><span class="glyphicon glyphicon-user"></span></button></a>
                                    <ul class="dropdown-menu">
                                      <li><a href="#">Mi Perfil</a></li>
                                      <li><a href="#">Mis Compras</a></li>
                                      <li><a href="validacion?accion=logout&pag=carrito">Cerrar Sesion</a></li>
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
                            <li id="carrito"><button class="btn btn-primary btn-lg" id="btncarrito"><span class="glyphicon glyphicon-shopping-cart" ></span></button></a></li>
                        </ul>
                    </div>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>
        </header>
        <section id="cart_items">
		<div class="container">
			<div class="table-responsive cart_info" id="cart-container">
                            <table class="table table-condensed" id="shop-table" style="margin-top: 13px;">
                                <form method="POST" action="Venta">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Costo</td>
							<td class="quantity">Cantidad</td>
							<td class="total">Sub Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
                                            <button type="button" class="btn btn-primary"><a href="javascript:window.history.go(-2);" style="color: white;text-decoration: none;">Seguir Comprando</a></button>
                                                                                             <input type="submit" class="btn btn-success" value="Comprar" style="margin-left: 33px;">
                                                <%
                                                    ProductoCar pro= new ProductoCar();
                                                    double total = 0;
                                                    HRService h = new HRService();
                                                     String id = h.IdVenta();
                                                     int i = Integer.parseInt(id) + 1;
                                                     
                                                    if(articulos != null){
                                                    for(Articulo a: articulos){
                                                        Producto producto = pro.getProducto(a.getIdProducto());
                                                        total += a.getCantidad() * producto.getPrecio();  
                                                   

                                                %>
                                                
						<tr>
							<td class="cart_product">
                                                            <a href=""><img src="recursos/imagenes/productos/<%= producto.getImagen()%>" alt="" width="120"></a>
							</td>
							<td class="cart_description">
								<h4><%= producto.getNombre()%></h4>
                                                                <input type="hidden" name="IdProd" value=<%= producto.getId()%>>
								<p>Web ID: <%= producto.getId()%></p>
							</td>
							<td class="cart_price">
                                                            <input type="hidden" name="precio" value=<%= producto.getPrecio()%>>
								<p>S/<%= producto.getPrecio()%></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
                                                                        <input class="cart_quantity_input" type="text" name="quantity" value="<%= a.getCantidad()%>" autocomplete="off" size="2">
                                                                        <a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
                                                                <input type="hidden" name="subtotal" value=<%= Math.round(producto.getPrecio()*a.getCantidad()*100.0) / 100.0%>>
								<p class="cart_total_price">S/<%= Math.round(producto.getPrecio()*a.getCantidad()*100.0) / 100.0%></p>
							</td>
							<td class="cart_delete">
                                                            <span id="idarticulo" style="display:none;"><%= producto.getId_modelo()%></span>
                                                            <a class="cart_quantity_delete" href="" id="deleteitem"><span class="glyphicon glyphicon-remove"></span></a>
							</td>
						</tr>
                                                <tr>
                                                </tr>
                                                <input type="hidden" name="IdVenta" value=<%=i %>>
                                                <input type="hidden" name="user" value=${sessionScope.user} >
                                                <%}}%>
					</tbody>
                                        
                                             <input type="hidden" name="total" value=<%= Math.round(total*100.0)/100.0%> >
                                              <input type="hidden" name="accion" value="RegistrarVenta">
                                              
                                             <td></td><td></td><td></td><td></td><td><h4>TOTAL</h4>
                                                 <span id="txt-subtotal">S/<%= Math.round(total*100.0)/100.0%></span>
                                             </td>
                                                                            
                                             
                                </form>
                            </table>        
				
                                         <div class="total_area" >                                          
                                             

                                         </div>
			</div> 
                                <% if (articulos == null){%>
                                <h4>No hay Articulos en el carro</h4>
                                <%}%>
                                                
		</div>
	</section> <!--/#cart_items-->
    </body>
</html>
