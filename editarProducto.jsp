<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.dao.*"%>
<%@page import="modelo.entidades.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    Producto producto = new Producto();
    ProductoDAO prodDAO = new ProductoDAO();
%>
<%
    try {

        int id = Integer.parseInt(request.getParameter("id"));
        //  out.print("<script>alert("+codigo+");</script>");
        producto = prodDAO.buscarProducto(id);

    } catch (Exception e) {
    }

    CategoriaDAO cdao = new CategoriaDAO();
    List<Categoria> lista = cdao.listarSelect();
    Iterator<Categoria> itCategoria = lista.iterator();

    ProveedorDAO provdao = new ProveedorDAO();
    List<Proveedor> listap = provdao.listarSelect();
    Iterator<Proveedor> itProveedor = listap.iterator();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Controlador?menu=Producto" method="post">
            <div class="one-half">
                <label>Nombre:</label>
                <input type="hidden" name="txtId" value="<%=producto.getIdProducto()%>" class="form-control">
                <input type="text" name="txtNombreE" value="<%=producto.getNombre()%>" class="form-control"> 
            </div>                            
            <div class="one-half last">
                <label>Categoria:</label>
                <select class="form-control" name="txtCategoriaE">
                    <option value="<%=producto.getCategoria().getIdCategoria()%>"><%=producto.getCategoria()%></option>
                    <%while (itCategoria.hasNext()) {
                            Categoria categoria = itCategoria.next();%> %>
                    <option value="<%=categoria.getIdCategoria()%>"><%=categoria.getNombre()%></option>
                    <% }%>                             
                </select>
            </div>
            <div class="one-half">
                <label>Proveedor:</label>
                <select class="form-control" name="txtProveedorE">
                    <option value="<%=producto.getProveedor().getIdProveedor()%>"><%=producto.getProveedor()%></option>
                    <%while (itProveedor.hasNext()) {
                            Proveedor producto = itProveedor.next();%> %>
                    <option value="<%=producto.getIdProveedor()%>"><%=producto.getNombre()%></option>
                    <% }%>                             
                </select>
            </div>
            <div class="one-half last">
                <label>Precio:</label>
                <input type="text" name="txtPrecioE" value="<%=producto.getPrecio()%>" class="form-control">
            </div>
            <div class="form-group">
                <label>Stock:</label>
                <input type="text" name="txtStockE" value="<%=producto.getStock()%>" class="form-control">
            </div>
            <div align="right">
                <input type="submit" name="accion" value="Actualizar" class="btn btn-info">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
            </div>
    </body>
</html>
