<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>DogSmart | Sistema Pos</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
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

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="plantilla/index2.html" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>D</b>SM</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Centro</b>CRISTIANO</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>

                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">          
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="plantilla/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs">${usuario.getNombre()}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="plantilla/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                        <p>
                                            ${usuario.getNombre()} - Desarrollador Web
                                            <small>${usuario.getCorreo()}</small>
                                        </p>
                                    </li>   
                                    <li class="user-footer">
                                        <div>
                                            <form action="Validar" method="post">
                                                <button name="accion" value="Cerrar Sesión" href="" class="btn btn-default btn-block">Cerrar Sesión</button>
                                            </form>                                            
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>                
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="plantilla/dist/img/user2-160x160.jpg" class="img-circle" style="width:110px; height:50px">
                        </div>
                        <div class="pull-left info">
                            <p>${usuario.getNombre()}</p>
                            <p>${usuario.getRol()}</p>
                        </div>
                    </div>
                    <!-- search form -->
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">MENU NAVEGACION</li>
                        <li><a href="Controlador?menu=Producto&accion=Listar" target="myFrame"><i class="fa fa-users"></i> <span>Inventario</span></a></li>
                        <li><a href="Controlador?menu=Categoria&accion=Listar" target="myFrame"><i class="fa fa-cubes"></i> <span>Categorías</span></a></li>
                        <li><a href="Controlador?menu=Venta&accion=default" target="myFrame"><i class="fa fa-calendar"></i> <span>Egresos</span></a></li>
                       <!--<li><a href="Controlador?menu=Compra&accion=Listar" target="myFrame"><i class="fa fa-stethoscope"></i> <span>Compras</span></a></li>-->
                        <li><a href="Controlador?menu=Cliente&accion=Listar" target="myFrame"><i class="fa fa-user"></i> <span>Responsable Egresos</span></a></li>
                        <li><a href="Controlador?menu=Proveedor&accion=Listar" target="myFrame"><i class="fa fa-user-md"></i> <span>Proveedores</span></a></li>
                        <li><a href="Controlador?menu=ConsultaVenta&accion=Listar" target="myFrame"><i class="fa fa-user"></i> <span>Consulta Egresos</span></a></li>
                        <!--<li><a href="Controlador?menu=ConsultaCompra&accion=Listar" target="myFrame"><i class="fa fa-user-md"></i> <span>Consulta Compras</span></a></li>-->
                        <!--<li><a href="Controlador?menu=Rol&accion=Listar" target="myFrame"><i class="fa fa-spinner"></i> <span>Administrador</span></a></li>-->
                        <li><a href="Controlador?menu=Usuario&accion=Listar" target="myFrame"><i class="fa fa-file-text-o"></i> <span>Usuarios</span></a></li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                
                <!-- Main content -->
                <section class="content">
                    <div class="m-4" style="height: 550px;">
                        <iframe name="myFrame" style="height: 106%; width: 100%; border: none">

                        </iframe>
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 1.0.00
                </div>
                <strong>Copyright &copy; 2022 <a href="https://www.facebook.com/">David Llangari</a>.</strong> Todos los Derechos Reservados.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark" style="display: none;">
                <!-- Create the tabs -->
                <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                    <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                    <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
                </ul>    
            </aside>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- jQuery 3 -->
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
        <script src="plantilla/dist/js/demo.js"></script>
    </body>
</html>
