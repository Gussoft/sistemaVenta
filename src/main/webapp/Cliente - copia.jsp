<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
        <title>Clientes</title>
    </head>
    <body>
        <div class="container-fluid mt-1">
            <div class="row">
                <div class="card col-sm-12 col-md-12 col-lg-4">
                    <div class="card-body">
                        <h3>Clientes</h3>
                        <form action="Controlador?menu=Cliente" method="POST">
                            <div class="form-group">
                                <label for="">Dni</label>
                                <input type="text" name="txtdnic" value="${cliente.getId()}" class="form-control" placeholder="DNI">
                            </div>
                            <div class="form-group">
                                <label for="">Nombres</label>
                                <input type="text" name="txtnombrec" value="${cliente.getNom()}" class="form-control" placeholder="Nombres">
                            </div>
                            <div class="form-group">
                                <label for="">Direccion</label>
                                <input type="text" name="txtdirec" value="${cliente.getDirec()}" class="form-control" placeholder="Direccion">
                            </div>
                            <div class="form-group">
                                <label for="">Estado</label>
                                <input type="text" name="txtestac" value="${cliente.getEstado()}" class="form-control" placeholder="Estado">
                            </div>
                           
                            <input type="submit" value="Agregar" name="accion" class="btn btn-info">
                            <input type="submit" value="Actualizar" name="accion" class="btn btn-success">
                        </form>
                    </div>
                </div>
                <div class="card col-sm-12 col-md-12 col-lg-8">
                    
                    <table class="table table-dark table-sm table-hover mt-1 rounded" id="example">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Dni</th>
                                <th>Nombres</th>
                                <th>Direccion</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cl" items="${clientes}">
                            <tr>
                                <td>${cl.getId()}</td>
                                <td>${cl.getDni()}</td>
                                <td>${cl.getNom()}</td>
                                <td>${cl.getDirec()}</td>
                                <td>${cl.getEstado()}</td>
                               
                                <td>
                                    <a class="btn btn-success btn-sm" href="Controlador?menu=Cliente&accion=Editar&id=${cl.getId()}">Edit</a>
                                    <a class="btn btn-danger btn-sm" href="Controlador?menu=Cliente&accion=Delete&id=${cl.getId()}">Delete</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                </div>
            </div>
        </div>
        <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
        <script src="js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function() {
                $('#example').DataTable();
            } );
        </script>
    </body>
</html>