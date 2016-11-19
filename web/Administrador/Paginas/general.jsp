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
        <title>General</title>
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
                    <li role="presentation"><a href="../index.jsp">Inicio</a></li>
                    <li role="presentation"><a href="../productos.jsp">Productos</a></li>
                    <li role="presentation"><a href="../ventas.jsp">Ventas</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" role="presentation" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Editar Paginas <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                          <li><a href="inicio.jsp">Inicio</a></li>
                          <li><a href="nosotros.jsp">Nosotros</a></li>
                          <li><a href="productos.jsp">Productos</a></li>
                          <li><a href="#">General</a></li>
                        </ul>
                    </li>
                   <li><a href="../../validacion?accion=logout&pag=">Cerrar Sesion</a></li>
                </ul>
            </div>
            <div class="col-md-8">
                <div class="panel panel-default">
                    <h2 style="margin-left: 19px;">General <span class="glyphicon glyphicon-wrench"></span></h2>
                    <hr>
                    <div class="row">
                        <form method="POST" action="../../updategeneral">
                            <div class="panel-body">
                                <div class="col-md-6">
                                    <div class="form-group" style="margin-top: -5%;text-align: center;" >
                                        <h3><span class="label label-default">Color de fondo</span></h3>
                                        <input name="colorfondo" type="color"  class="form-control" value="#f8f8f8" style="width: 20%;margin-left: 39%;"/>
                                    </div>
                                    <div class="form-group" style="margin-top: -1%;text-align: center;" >
                                        <h3><span class="label label-default">Color de letra</span></h3>
                                        <input name="letracolor" type="color"  class="form-control" style="width: 20%;margin-left: 39%;"/>
                                    </div>
                                    <div class="form-group" style="margin-top: -1%;text-align: center;" >
                                        <h3><span class="label label-default">Color Fondo Menu</span></h3>
                                        <input name="menufcolor" type="color"  class="form-control" style="width: 20%;margin-left: 39%;"/>
                                    </div>
                                    <div class="form-group" style="margin-top: -1%;text-align: center;" >
                                        <h3><span class="label label-default">Color Letra Menu</span></h3>
                                        <input name="menulcolor" type="color"  class="form-control" style="width: 20%;margin-left: 39%;"/>
                                    </div>                                    
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group" style="margin-top: -5%;text-align: center;" >
                                        <h3><span class="label label-default">Tipo de letra</span></h3>
                                        <select name="tipoletra" class="form-control" style="width: 49%;margin-left: 25%;" >
                                            <option value="Times New Roman">Times New Roman</option>
                                            <option value="Garamond">Garamond</option>
                                            <option value="Georgia">Georgia</option>
                                            <option value="Trebuche">Trebuchet</option>
                                            <option value="Arial">Arial</option>
                                            <option value="Verdana" selected="Verdana">Verdana</option>
                                            <option value="Courier">Courier</option>
                                            <option value="Courier New">Courier New</option>
                                            <option value="Andele Mono">Andele Mono</option>
                                        </select>
                                    </div>
                                    <div class="form-group" style="margin-top: -1%;text-align: center;" >
                                        <h3><span class="label label-default">Tamaño de letra</span></h3>
                                        <input name="tamanoletra" type="number" min="1" value="14" class="form-control" style="width: 20%;margin-left: 39%;"/>
                                    </div>
                                </div>  
                                <input type="hidden" name="nompag" value="general">
                                <input type="submit" value="Guardar Cambios" class="btn btn-success" style="margin-left: 81%;margin-top: 8px;">
                            </div>
                        </form>
                    </div>    
                </div>
            </div> 
    </body>
</html>
