<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="tables/datatables.min.css">
        <link rel="stylesheet" type="text/css" href="tables/css/dataTables.bootstrap4.min.css">
        <title>Empleados</title>
    </head>
    <body>
        <div class="container-fluid mt-1">
            <div class="row">
                <div class="card col-sm-12 col-md-12 col-lg-4">
                    <div class="card-body">
                        <h3>Empleados</h3>
                        <form action="Controlador?menu=Empleado" method="POST">
                            <div class="form-group">
                                <label for="">Dni</label>
                                <input type="text" name="txtdni" value="${empleado.getDni()}" class="form-control" placeholder="DNI">
                            </div>
                            <div class="form-group">
                                <label for="">Nombres</label>
                                <input type="text" name="txtnombre"  value="${empleado.getNom()}" class="form-control" placeholder="Nombres">
                            </div>
                            <div class="form-group">
                                <label for="">Telefono</label>
                                <input type="text" name="txtcel"  value="${empleado.getTel()}" class="form-control" placeholder="Telefono">
                            </div>
                            <div class="form-group">
                                <label for="">Estado</label>
                                <input type="text" name="txtestado" value="${empleado.getEstado()}" class="form-control" placeholder="Estado">
                            </div>
                            <div class="form-group">
                                <label for="">Usuario</label>
                                <input type="text" name="txtuser"  value="${empleado.getUser()}" class="form-control" placeholder="Usuario">
                            </div>
                            <input type="submit" value="Agregar" name="accion" class="btn btn-info">
                            <input type="submit" value="Actualizar" name="accion" class="btn btn-success">
                        </form>
                    </div>
                </div>
                <div class="card col-sm-12 col-md-12 col-lg-8">
                    <div class="table-responsive mt-1">
                        <table id="example" class="table table-dark table-sm table-hover mt-1 rounded" style="width:100%">
    
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Dni</th>
                                <th>Nombres</th>
                                <th>Telefono</th>
                                <th>Estado</th>
                                <th>Usuario</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="em" items="${empleados}">
                            <tr>
                                <td>${em.getId()}</td>
                                <td>${em.getDni()}</td>
                                <td>${em.getNom()}</td>
                                <td>${em.getTel()}</td>
                                <td>${em.getEstado()}</td>
                                <td>${em.getUser()}</td>
                                <td>
                                    <a class="btn btn-success btn-sm" href="Controlador?menu=Empleado&accion=Editar&id=${em.getId()}">Edit</a>
                                    <a class="btn btn-danger btn-sm" href="Controlador?menu=Empleado&accion=Delete&id=${em.getId()}">Delete</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" charset="utf8" src="tables/datatables.min.js"></script>
        <script type="text/javascript" src="js/start.js"></script>
    </body>
</html>