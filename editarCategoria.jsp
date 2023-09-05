<%@page import="modelo.dao.CategoriaDAO"%>
<%@page import="modelo.entidades.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    Categoria categoria = new Categoria();
    CategoriaDAO cDAO = new CategoriaDAO();
%>
<%
    try {

        int id = Integer.parseInt(request.getParameter("id"));
        //  out.print("<script>alert("+codigo+");</script>");
        categoria = cDAO.buscarCategoria(id);

    } catch (Exception e) {
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Controlador?menu=Categoria" method="post">            
            <div class="form-group">
                <label>Nombre:</label>
                <input type="hidden" name="txtId" value="<%=categoria.getIdCategoria()%>" class="form-control">
                <input type="text" name="txtNombreE" value="<%=categoria.getNombre()%>" class="form-control">
            </div>
            <div class="form-group">
                <label>Descripción</label>
                <input type="text" name="txtDescripcionE" value="<%=categoria.getDescripcion()%>" class="form-control">
            </div>            
            <div class="modal-footer">
                <input type="submit" name="accion" value="Actualizar" class="btn btn-info">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
            </div>
        </form>
    </body>
</html>
