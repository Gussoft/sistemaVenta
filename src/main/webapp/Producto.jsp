<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="tables/datatables.min.css">
        <link rel="stylesheet" type="text/css" href="tables/css/dataTables.bootstrap4.min.css">
        <title>Productos</title>
    </head>
    <body>
        <div class="container-fluid mt-1">
            <div class="row">
                <div class="card col-sm-12 col-md-12 col-lg-4">
                    <div class="card-body">
                        <h3>Productos</h3>
                        <form action="Controlador?menu=Producto" method="POST">
                            <div class="form-group">
                                <label for="">Descripcion</label>
                                <input type="text" name="txtdes" value="${producto.getNop()}" class="form-control" placeholder="Descripcion del Producto">
                            </div>
                            <div class="form-group">
                                <label for="">Precio</label>
                                <input type="number" step=0.01 name="txtpre"  value="${producto.getPre()}" class="form-control" placeholder="Precio">
                            </div>
                            <div class="form-group">
                                <label for="">Stock</label>
                                <input type="number" name="txtstock"  value="${producto.getStock()}" class="form-control" placeholder="Stock">
                            </div>
                            <div class="form-group">
                                <label for="">Estado</label>
                                <input type="text" name="txtestado" value="${producto.getEsta()}" class="form-control" placeholder="Estado">
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
                                <th>Descripcion</th>
                                <th>Precio</th>
                                <th>Stock</th>
                                <th>Estado</th>
                               
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="pr" items="productos">
                            <tr>
                                <td>${pr.getIdp()}</td>
                                <td>${pr.getNop()}</td>
                                <td>${pr.getPre()}</td>
                                <td>${pr.getStock()}</td>
                                <td>${pr.getEsta()}</td>
                                
                                <td>
                                    <a class="btn btn-success btn-sm" href="Controlador?menu=Producto&accion=Editar&id=${pr.getIdp()}">Edit</a>
                                    <a class="btn btn-danger btn-sm" href="Controlador?menu=Producto&accion=Delete&id=${pr.getIdp()}">Delete</a>
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