<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categoria</title>
    </head>
    <link rel="stylesheet" href="plantilla/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plantilla/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="plantilla/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="plantilla/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="plantilla/dist/css/skins/_all-skins.min.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="plantilla/bower_components/morris.js/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="plantilla/bower_components/jvectormap/jquery-jvectormap.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plantilla/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plantilla/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plantilla/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <body>
        
        <div class="d-flex">
            
            <div class="panel-body table-responsive" class="box-body">
                <br>                
                &nbsp;&nbsp;&nbsp;&nbsp;<strong><font size= "+2">Consulta de Compras</font></strong>
                <br><br>
                <form action="Controlador?menu=ConsultaCompra" method="post">
                    <div class="col-lg-6">
                        <label>Fecha Inicio:</label>
                        <input type="date" name="txtFechaInicioCompra" pattern="yyyy-MM-dd">
                        &nbsp;&nbsp;&nbsp;&nbsp;<label>Fecha Fin:</label>
                        <input type="date" name="txtFechaFinCompra" pattern="yyyy-MM-dd">
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="accion" value="Listar" class="btn btn-info">
                    </div>
                </form>
                <br><br>
                <div class="col-sm-12">
                    <table id="tblcompras" class="table table-striped table-bordered table-condensed table-hover" width="100%">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Proveedor</th>
                                <th>Usuario</th>
                                <th># Serie</th>
                                <th>Fecha</th>
                                <th>Total</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="comp" items="${compras}">
                                <tr>
                                    <td>${comp.getIdCompra()}</td>
                                    <td>${comp.getProveedor()}</td>
                                    <td>${comp.getUsuario()}</td>
                                    <td>${comp.getNumSerie()}</td>
                                    <td>${comp.getFecha()}</td>
                                    <td>${comp.getTotal()}</td>
                                    <c:if test="${comp.estado == 1}">
                                        <td><span style='font-size:14px;' class='label label-success'>Pagada</span></td>
                                    </c:if>
                                    <c:if test="${comp.estado == 0}">
                                        <td><span style='font-size:13px;' class='label label-danger'>Canceladalo/<span></td>
                                    </c:if>

                                    <c:if test="${comp.estado == 1}">
                                        <td>
                                            <a class="btn btn-danger" href="Controlador?menu=ConsultaCompra&accion=Anular&id=${comp.getIdCompra()}"><i class="fa fa-ban"></i></a>
                                        </td>
                                    </c:if>
                                                                    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="modal fade" id="ModalEditar" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Editar Categoria</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="ModalNuevo" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Nuevo Categoria</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="Controlador?menu=Categoria" method="post">
                            <div class="form-group">
                                <label>Nombre:</label>
                                <input type="text" name="txtNombre" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Descripción:</label>
                                <input type="text" name="txtDescripcion" class="form-control">
                            </div>
                            <div align="right">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> 
        <script src="plantilla/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="plantilla/bower_components/jquery-ui/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
            $.widget.bridge('uibutton', $.ui.button);
        </script>
        <!-- Bootstrap 3.3.7 -->
        <script src="plantilla/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- Morris.js charts -->
        <script src="plantilla/bower_components/raphael/raphael.min.js"></script>
        <script src="plantilla/bower_components/morris.js/morris.min.js"></script>
        <!-- Sparkline -->
        <script src="plantilla/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
        <!-- jvectormap -->
        <script src="plantilla/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="plantilla/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="plantilla/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
        <!-- daterangepicker -->
        <script src="plantilla/bower_components/moment/min/moment.min.js"></script>
        <script src="plantilla/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- datepicker -->
        <script src="plantilla/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="plantilla/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <!-- Slimscroll -->
        <script src="plantilla/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="plantilla/bower_components/fastclick/lib/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="plantilla/dist/js/adminlte.min.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="plantilla/dist/js/pages/dashboard.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="plantilla/dist/js/demo.js"></script><script src="https://code.jquery.com/jquery-3.3.1.js"></script> 
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
        <script>
                                                function modaleditar(id) {
                                                $('.modal-body').load('editarCategoria.jsp?id=' + id, function () {});
                                                }

                                    <!--Sección datatable-->
                                    $(document).ready(function() {

                                                        var table = $('#tblcompras').DataTable({
                                                lengthChange: false,
                                                        buttons: ['copy', 'excel', 'csv', 'pdf'],
                                                        language: {
                                                        "decimal": "",
                                                                "emptyTable": "No hay información",
                                                                "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                                                                "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                                                                "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                                                                "infoPostFix": "",
                                                                "thousands": ",",
                                                                "lengthMenu": "Mostrar _MENU_ Entradas",
                                                                "loadingRecords": "Cargando...",
                                                                "processing": "Procesando...",
                                                                "search": "Buscar:",
                                                                "zeroRecords": "Sin resultados encontrados",
                                                                "paginate": {
                                                                "first": "Primero",
                                                                        "last": "Ultimo",
                                                                        "next": "Siguiente",
                                                                        "previous": "Anterior"
                        },
                        "buttons": {
                                                                        "copy": "Copiar"
            }}
            
            } );
        
        table.buttons().container()
        .appendTo( '#tblcompras_wrapper .col-md-6:eq(0)' );
        } );
            <!--fin Sección datatable-->
                    <!--Sección alerta-->
  window.setTimeout(function() {
$(".alert").fadeTo(500, 0).slideUp(500, function(){
    $(this).remove(); 
});
}, 4000);
     <!--fin Sección alerta--> 
        </script>        
    </body>
</html>
