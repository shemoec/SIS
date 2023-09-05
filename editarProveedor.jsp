<%@page import="modelo.dao.ProveedorDAO"%>
<%@page import="modelo.entidades.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    Proveedor proveedor = new Proveedor();
    ProveedorDAO pDAO = new ProveedorDAO();
%>
<%
    try {

        int id = Integer.parseInt(request.getParameter("id"));
        //  out.print("<script>alert("+codigo+");</script>");
        proveedor = pDAO.buscarProveedor(id);

    } catch (Exception e) {
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Controlador?menu=Proveedor" method="post">
            <div class="one-half">
                <label>Ruc:</label>
                <input type="hidden" name="txtId" value="<%=proveedor.getIdProveedor()%>" class="form-control">
                <input type="text" name="txtRucE" value="<%=proveedor.getRuc()%>" class="form-control">
            </div>
            <div class="one-half last">
                <label>Nombre:</label>
                <input type="text" name="txtNombreE" value="<%=proveedor.getNombre()%>" class="form-control">
            </div>
            <div class="one-half">
                <label>Dirección:</label>
                <input type="text" name="txtDireccionE" value="<%=proveedor.getDireccion()%>"class="form-control">
            </div>
            <div class="one-half last">
                <label>Teléfono:</label>
                <input type="text" name="txtTelefonoE" value="<%=proveedor.getTelefono()%>" class="form-control">
            </div>
            <div class="form-group">
                <label>Correo:</label>
                <input type="text" name="txtCorreoE" value="<%=proveedor.getCorreo()%>" class="form-control">
            </div>
            <div align="right">
                <input type="submit" name="accion" value="Actualizar" class="btn btn-info">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
            </div>
        </form>
    </body>
</html>
