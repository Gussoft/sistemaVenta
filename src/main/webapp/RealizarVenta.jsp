<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="tables/datatables.min.css">
        <link rel="stylesheet" type="text/css" href="tables/css/dataTables.bootstrap4.min.css">
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
                                    <div class="col-sm-6 col-md-4 col-lg-6">
                                        <input type="text" name="codcliente" id="code1" value="${c.getDni()}" class="form-control" placeholder="Id Cliente">
                                        <!--<button type="submit" name="accion" value="BuscarCliente" class="btn btn-primary ml-1">Buscar</button> /buton submin buscar-->
                                        <div>
                                        <a class="btn btn-success btn-sm mt-1" href="Controlador?menu=NuevaVenta&accion=ListarC">...</a>
                                        <button type="button" class="btn btn-primary  btn-sm mt-1" data-toggle="modal" data-target="#exampleModalCenter">Elejir</button>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-6">
                                        <input type="text" name="nomcliente" value="${c.getNom()}" class="form-control" placeholder="Datos del Cliente"> 
                                        <button type="submit" name="accion" value="BuscarCliente" class="btn btn-primary btn-sm mt-1">Buscar</button>
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
        <!--AGREGAR Cliente Modal-->
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Buscar Cliente</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table id="example" class="table table-sm table-hover mt-1 rounded" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Dni</th>
                                    <th>Nombres</th>
                                    <th>Direccion</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cl" items="${clientes}">
                                    <tr>
                                        <td>
                                            <input type="hidden" id="${cl.getDni()}" name= "codcliente" value="${cl.getDni()}">
                                            ${cl.getDni()}
                                        </td>
                                        <td>${cl.getNom()}</td>
                                        <td>${cl.getDirec()}</td>
                                        <td>
                                            <input type="button" id="btn" class="btn btn-success btn-sm" value="Elejir" onclick="enviar(${cl.getDni()})"/>
                                            <!--button type="button" id="btnok" class="btn btn-success btn-sm" data-dni="${cl.getDni()}">Ok</button-->
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>
                    </div>
                    <div class="modal-footer">
                        <input type="text" id="mode" class="form-control" />

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary ml-1" onclick="enviare()" data-dismiss="modal">Buscar</button>
                    </div>
                </div>
            </div>
        </div>


        <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" charset="utf8" src="tables/datatables.min.js"></script>
        <script type="text/javascript" src="js/start.js"></script>
        <script>
                                                $(document).ready(function () {
                                                    $("#btnok").click(function () {
                                                        var dni = $(this).data('dni');
                                                        $("#cocli").val(dni);
                                                    });
                                                });
                                                function enviar(x) {
                                                    var texto = document.getElementById(x).value;
                                                    document.getElementById("mode").value = texto;
                                                    console.log("Hola " + texto);
                                                }
                                                function enviare() {
                                                    var texto = document.getElementById("mode").value;
                                                    document.getElementById("code1").value = texto;
                                                    console.log("Hola 2 " + texto);
                                                }
        </script>
    </body>
</html>