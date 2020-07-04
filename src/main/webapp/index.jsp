<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Iniciar Session</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card mt-5">
                <div class="card-body">
                    <form action="Validar" method="POST">
                        <div class="form-group text-center">
                            <h3>Login</h3>
                            <img src="img/echi.jpg" alt="70" width="170" class="rounded-circle"><br>
                            <label for="">Bienvenidos al Sistema</label>
                        </div>
                        <div class="form-group">
                            <label for="">Usuario :</label>
                            <input type="text" name="txtuser" class="form-control" placeholder="Ingrese su Usuario">
                        </div>
                        <div class="form-group">
                            <label for="">Password :</label>
                            <input type="password" name="txtpass" class="form-control" placeholder="Ingrese su Contraseña">
                        </div>
                        <input type="submit" name="accion" value="Ingresar" class="btn btn-success btn-block">
                    </form>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
