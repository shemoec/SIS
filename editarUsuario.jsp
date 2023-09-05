<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.dao.*"%>
<%@page import="modelo.entidades.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    Usuario usuario = new Usuario();
    UsuarioDAO uDAO = new UsuarioDAO();
%>
<%
    try {

        int id = Integer.parseInt(request.getParameter("id"));
        //  out.print("<script>alert("+codigo+");</script>");
        usuario = uDAO.buscarUsuario(id);

    } catch (Exception e) {
    }

    RolDAO rdao = new RolDAO();
    List<Rol> lista = rdao.listarSelect();
    Iterator<Rol> itRol = lista.iterator();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Controlador?menu=Usuario" method="post">            
            <div class="one-half">
                <input type="hidden" name="txtId" value="<%=usuario.getIdUsuario()%>" class="form-control">
                <label>Cédula:</label>
                <input type="text" name="txtCedulaE" value="<%=usuario.getCedula()%>" class="form-control"> 
            </div>
            <div class="one-half last">
                <label>Nombre:</label>
                <input type="text" name="txtNombreE" value="<%=usuario.getNombre()%>" class="form-control">
            </div>
            <div class="one-half">
                <label>Rol:</label>
                <select class="form-control" name="txtRolE" >
                    <option value="<%=usuario.getRol().getIdRol()%>"><%=usuario.getRol()%></option>
                    <%while (itRol.hasNext()) {
                                        Rol rol = itRol.next();%> %>
                    <option value="<%=rol.getIdRol()%>"><%=rol.getNombre()%></option>
                    <% }%>                             
                </select>
            </div>
            <div class="one-half last">
                <label>Teléfono:</label>
                <input type="text" name="txtTelefonoE" value="<%=usuario.getTelefono()%>" class="form-control">
            </div>
            <div class="one-half">
                <label>Dirección:</label>
                <input type="text" name="txtDireccionE" value="<%=usuario.getDireccion()%>" class="form-control">
            </div>
            <div class="one-half last">
                <label>Correo:</label>
                <input type="text" name="txtCorreoE" value="<%=usuario.getCorreo()%>" class="form-control">
            </div>
            <div class="modal-footer">
                <input type="submit" name="accion" value="Actualizar" class="btn btn-info">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
            </div>
        </form>
</body>
</html>
