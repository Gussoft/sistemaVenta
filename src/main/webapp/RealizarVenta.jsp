<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Ventas</title>
        <style>
            @media print{
                .part01, .btn, .accionB{
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <div class="container-fluid mt-1">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-5 part01">
                    <div class="card">
                        <form action="Controlador?menu=NuevaVenta" method="POST">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="">Datos del Cliente</label>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 col-md-4 col-lg-6 d-flex">
                                    <input type="text" name="codcliente" value="${c.getDni()}" class="form-control" placeholder="Id Cliente">
                                    <button type="submit" name="accion" value="BuscarCliente" class="btn btn-primary ml-1">Buscar</button>
                                </div>
                                <div class="col-sm-6 col-md-4 col-lg-6">
                                    <input type="text" name="nomcliente" value="${c.getNom()}" class="form-control" placeholder="Datos del Cliente"> 
                                </div>                        
                            </div>
                            <div class="form-group">
                                <label for="">Datos del Producto</label>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 col-md-4 col-lg-6 d-flex">
                                    <input type="text" name="codproducto" value="${pro.getIdp()}" class="form-control" placeholder="Id Producto">
                                    <button type="submit" name="accion" value="BuscarProducto" class="btn btn-primary ml-1">Buscar</button>
                                </div>
                                <div class="col-sm-6 col-md-4 col-lg-6">
                                    <input type="text" name="nomproducto" value="${pro.getNop()}" class="form-control" placeholder="Datos del Producto"> 
                                </div>  
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 col-md-4 col-lg-6 d-flex">
                                    <input type="text" name="precio" value="${pro.getPre()}" class="form-control" placeholder="S/ 0.00">
                                </div>
                                <div class="col-sm-3 col-md-2 col-lg-3">
                                    <input type="number" name="cant" value="1" class="form-control">
                                </div>
                                <div class="col-sm-3 col-md-2 col-lg-3">
                                    <input type="text" name="stock" value="${pro.getStock()}" placeholder="Stock" class="form-control">
                                </div>
                            </div>
                            <!--AGREGAR REGISTRO-->
                            <div class="form-group ">
                                <button type="submit" name="accion" value="AgregarProducto" class="btn btn-info">Agregar</button>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-7">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex col-sm-5 ml-auto">
                                <label for="">Nro. Serie:</label>
                                <input type="text" name="NroSerie" value="${nserie}" class="form-control text-center">
                            </div>
                            <div class="table-responsive">
                            <table class="table table-sm table-dark table- mt-1">
                                <thead>
                                    <tr>
                                        <th>Nro</th>
                                        <th>Codigo</th>
                                        <th>Descripcion</th>
                                        <th>Precio</th>
                                        <th>Cantidad</th>
                                        <th>SubTotal</th>
                                        <th class="accionB">Accion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="lis" items="${lista}">
                                    <tr>
                                        <td>${lis.getItem()}</td>
                                        <td>${lis.getIdproducto()}</td>
                                        <td>${lis.getDescripcion()}</td>
                                        <td>${lis.getPrecio()}</td>
                                        <td>${lis.getCantidad()}</td>
                                        <td>${lis.getSubtotal()}</td>
                                        <td>
                                            <a class="btn btn-success btn-sm">Editar</a>
                                            <a class="btn btn-danger btn-sm">Delete</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        </div>
                        <div class="card-footer d-flex">
                            <div class="col-sm-6">
                                <a href="Controlador?menu=NuevaVenta&accion=GenerarVenta" class="btn btn-success" onclick="print()">Generar Venta</a>
                                
                                <input type="submit" value="Cancelar" name="accion" class="btn btn-danger">
                            </div>
                            <div class="col-sm-3 ml-auto">
                                <input type="text" name="txtTotal" value="S/  ${totalpagar}0" class="form-control text-center">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>