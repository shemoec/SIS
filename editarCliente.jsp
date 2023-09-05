<%@page import="modelo.dao.ClienteDAO"%>
<%@page import="modelo.entidades.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    Cliente cliente = new Cliente();
    ClienteDAO cDAO = new ClienteDAO();
%>
<%
    try {

        int id = Integer.parseInt(request.getParameter("id"));
        //  out.print("<script>alert("+codigo+");</script>");
        cliente = cDAO.buscarCliente(id);

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
        <form action="Controlador?menu=Cliente" method="post">
            <div class="one-half">
                <label>Cédula:</label>
                <input type="hidden" name="txtId" value="<%=cliente.getIdCliente()%>" class="form-control">
                <input type="text" name="txtCedulaE" value="<%=cliente.getCedula()%>" class="form-control">
            </div>
            <div class="one-half last">
                <label>Nombre:</label>
                <input type="text" name="txtNombreE" value="<%=cliente.getNombre()%>" class="form-control">
            </div>
            <div class="one-half">
                <label>Dirección:</label>
                <input type="text" name="txtDireccionE" value="<%=cliente.getDireccion()%>"class="form-control">
            </div>
            <div class="one-half last">
                <label>Teléfono:</label>
                <input type="text" name="txtTelefonoE" value="<%=cliente.getTelefono()%>" class="form-control">
            </div>
            <div class="form-group">
                <label>Correo:</label>
                <input type="text" name="txtCorreoE" value="<%=cliente.getCorreo()%>" class="form-control">
            </div>
            <div align="right">
                <input type="submit" name="accion" value="Actualizar" class="btn btn-info">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
            </div>
        </form>
    </body>
</html>
