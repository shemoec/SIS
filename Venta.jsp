<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.dao.*"%>
<%@page import="modelo.entidades.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>Venta Egresos</title>
    <script>
        function validarStock() {
            var stockDisponible = parseInt(document.getElementById("stock").value);
            var cantCompra = parseInt(document.getElementById("cant").value);
            
            if (cantCompra > stockDisponible) {
                alert("No hay suficiente stock disponible.");
                return false;
            }
            return true;
        }
        
        function eliminarProducto(item) {
            // Encuentra la fila en la tabla con el ítem dado
            var row = document.getElementById("row-" + item);
            // Elimina la fila de la tabla
            row.parentNode.removeChild(row);
            // Vuelve a calcular el precio total
            recalcularTotal();
        }

        function recalcularTotal() {
            var subtotalElements = document.querySelectorAll("[data-subtotal]");
            var total = 0;
            subtotalElements.forEach(function(element) {
                total += parseFloat(element.textContent);
            });
            document.querySelector("[name='txtSubTotalV']").value = "$/. " + total.toFixed(2);
            var iva = (12 * total) / 100;
            document.querySelector("[name='txtIVA']").value = "$/. " + iva.toFixed(2);
            var totalFinal = total + iva;
            document.querySelector("[name='txtTotal']").value = "$/. " + totalFinal.toFixed(2);
        }

    </script>
</head>
<body>
    <br>
    <div class="d-flex">
        <div class="col-sm-12">
            <div class="card">
                <form action="Controlador?menu=Venta" method="post">
                    <div class="card-body">
                        <div class="form-group">
                            <label>Nombre del Responsable dsd</label>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="codigocliente" value="${cli.getCedula()}" class="form-control" placeholder="Cédula">
                                <input type="submit" name="accion" value="BuscarResponsable" class="btn btn-outline-info">
                            </div>                             
                            <div class="col-sm-6">
                                <input type="text" name="nombrescliente" value="${cli.getNombre()}" class="form-control" placeholder="Nombre Cliente" readonly>
                            </div>                         
                        </div>
                        <div class="form-group">
                            <label>Datos Producto</label>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="number" id="codigoproducto" name="codigoproducto" value="${prod.getIdProducto()}" class="form-control" placeholder="Codigo">
                                <input type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-info">
                            </div>                             
                            <div class="col-sm-6">
                                <input type="text" name="nombreproducto" value="${prod.getNombre()}" class="form-control" placeholder="Nombre Producto" readonly>
                            </div>     
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="precio" value="${prod.getPrecio()}" class="form-control" placeholder="$/.0.00">
                            </div>                             
                            <div class="col-sm-3">
                                <input type="number" id="cant" name="cant" value="1" class="form-control" placeholder="Cant">
                            </div>
                            <div class="col-sm-3">
                                <input type="text" id="stock" name="stock" value="${prod.getStock()}" class="form-control" placeholder="Stock" readonly>
                            </div>  
                        </div>
                        <div class="form-group">
                            <div class="col-sm">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-outline-primary" onclick="return validarStock();">                            
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <div class="d-flex col-sm-5 ml-auto">
                    <label>N°Serie:&nbsp;</label>
                    <input type="text" value="${nserie}" name="NroSerie" class="form-control" readonly>
                </div>
                <br>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Nro</th>
                            <th>Código</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Subtotal</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${lista}">
                            <tr id="row-${list.getItem()}">
                                <td>${list.getItem()}</td>
                                <td>${list.getProducto().getIdProducto()}</td>
                                <td>${list.getDescripcionP()}</td>
                                <td>${list.getPrecio()}</td>                                        
                                <td>${list.getCantidad()}</td>
                                <td data-subtotal>${list.getSubTotal()}</td>
                                <td class="d-flex">
                                    <a href="#" class="btn btn-danger" style="margin-left: 10px" onclick="eliminarProducto(${list.getItem()})">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>                        
            </div>     
            <div class="card-footer d-flex">
                <div class="col-sm-6">
                    <a href="Controlador?menu=Venta&accion=GenerarVenta" class="btn btn-success">Generar</a>
                    <a href="Controlador?menu=Venta&accion=Cancelar" class="btn btn-danger">Cancelar</a>
                </div>
                <div class="col-sm-4 ml-auto" align="right">
                    <input type="text" name="txtSubTotalV" value="$/. ${subTotalV}0" class="form-control" style="width: 50%" readonly>
                    <input type="text" name="txtIVA"  value="$/. ${totalC}0" class="form-control" style="width: 50%" readonly>
                    <input type="text" name="txtTotal" value="$/. ${total}0" class="form-control" style="width: 50%" readonly>
                </div>
            </div>
        </div>                    
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
