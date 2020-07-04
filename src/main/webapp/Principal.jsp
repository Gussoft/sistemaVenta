<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Dashboard : ${usuario.getNom()}</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand"> Sistema de ventas</a>
            <button class="navbar-toggler navbar-toggler-right collapsed" type="button" data-toggle="collapse" data-target="#navb" aria-expanded="false">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse collapse" id="navb">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-secondary border-0" href="Controlador?menu=Home" target="myFrame">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-secondary border-0" href="Controlador?menu=Producto&accion=Listar" target="myFrame">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-secondary border-0" href="Controlador?menu=Empleado&accion=Listar" target="myFrame">Empleados</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-secondary border-0" href="Controlador?menu=Cliente&accion=Listar" target="myFrame">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-secondary border-0" href="Controlador?menu=NuevaVenta&accion=default" target="myFrame">Nueva Venta</a>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0 mr-2">
                    <input class="form-control mr-sm-2" type="text" placeholder="Buscar">
                    <button class="btn btn-success my-2 my-sm-0" type="button"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar</font></font></button>
                </form> 
                <div class="dropdown mr-5">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${usuario.getNom()}
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item text-center" href="#">
                            <img src="img/echi.jpg" alt="60" width="60" class="rounded-circle">
                        </a>
                        <a class="dropdown-item" href="#">${usuario.getUser()}</a>
                        <a class="dropdown-item" href="#">Example@gmail.com</a>
                        <div class="dropdown-divider"></div>
                        <form action="Validar" method="post">
                            <button name="accion" value="Salir" class="dropdown-item" href="#">Cerrar Session</button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        
        <div class="container-fluid">
            <div class="" style="height: 650px;">
                <iframe class="" name="myFrame" style="height: 100%; width: 100%; border: none;"></iframe>
            </div>
        </div>
        <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
