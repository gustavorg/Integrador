<%@page import="Modelo.DetalleVenta"%>
<%@page import="Modelo.Venta"%>
<%@page import="Modelo.HRService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administrador</title>
        <link href="../recursos/css/bootstrap.min.css" rel="stylesheet">
        <link href="../recursos/css/estilo.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../recursos/js/bootstrap.min.js"></script>
        <script src="../recursos/js/estilo.js"></script>
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
                 <div class="table-responsive cart_info" id="cart-container">
                            <table class="table table-condensed" id="shop-table" style="margin-top: 13px;">
                                <form method="POST" action="Venta">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="price">Usuario</td>
							<td class="quantity">Fecha</td>
							<td class="total">Total</td>
                                                        <td class="total"></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
                                                <% int i=1;
                                                    String id = request.getParameter("comp");
                                                    HRService hr= new HRService();
                                                    for(DetalleVenta comp: hr.DetalleVenta(id) ){
                                                %>
						<tr>
							<td class="cart_description">
								<h4><%=i %></h4>
							</td>
							<td class="cart_product">
                                                            <a href=""><img src="../recursos/imagenes/productos/<%= comp.getImagen()%>" alt="" width="120"></a>
							</td>
							<td class="cart_description">
								<h4><%= comp.getNomprod() %></h4>
							</td>
							<td class="cart_price">
								<p>S/<%= comp.getPrecio()%></p>
							</td>
							<td class="cart_quantity">
                                                                <p><%= comp.getCant()%></p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">S/<%= comp.getSubtotal() %></p>
							</td>
                                                </tr>
                                                <tr>
                                                </tr>
                                                
                                                <%i++;}%>
					</tbody>                 
                                </form>
                            </table> 
            </div>
        </div>
       
    </body>
</html>
