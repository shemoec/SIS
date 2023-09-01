/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import config.GenerarSerie;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.*;
import modelo.entidades.*;

/**
 *
 * @author angel
 */
public class Controlador extends HttpServlet {

    Usuario us = new Usuario();
    UsuarioDAO uDAO = new UsuarioDAO();
    Categoria cat = new Categoria();
    CategoriaDAO cDAO = new CategoriaDAO();
    Proveedor pro = new Proveedor();
    ProveedorDAO pDAO = new ProveedorDAO();
    Cliente cli = new Cliente();
    ClienteDAO cliDAO = new ClienteDAO();
    Rol rol = new Rol();
    RolDAO rDAO = new RolDAO();
    Producto prod = new Producto();
    ProductoDAO proDAO = new ProductoDAO();
    Venta v = new Venta();
    VentaDAO vDAO = new VentaDAO();
    Compra c = new Compra();
    CompraDAO compDAO = new CompraDAO();
    List<Venta> listaVenta = new ArrayList<>();
    List<Compra> listaCompra = new ArrayList<>();
    int itemVenta;
    int codVenta;
    String descripcionVenta;
    Double precioVenta;
    int cantVenta;
    double subTotalVenta;
    double subTotalVVenta;
    int ivaVenta = 12;
    double totalVenta;
    double totalVVenta;
    String numeroserieVenta;
    
    int itemCompra;
    int codCompra;
    String descripcionCompra;
    Double precioCompra;
    int cantCompra;
    double subTotalCompra;
    double subTotalCCompra;
    int ivaCompra = 12;
    double totalCompra;
    double totalCCompra;
    String numeroserieCompra;
   
    
    
    int idu;
    int idc;
    int idp;
    int idcli;
    int idr;
    int idpro;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String menu = request.getParameter("menu");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
        if (menu.equals("Categoria")) {
            switch (accion) {
                case "Listar":
                    List lista = cDAO.listar();
                    request.setAttribute("categorias", lista);
                    break;
                case "Agregar":
                    String nombre = request.getParameter("txtNombre");
                    String descripcion = request.getParameter("txtDescripcion");
                    cat.setNombre(nombre);
                    cat.setDescripcion(descripcion);
                    cDAO.agregar(cat);
                    request.getRequestDispatcher("Controlador?menu=Categoria&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nombree = request.getParameter("txtNombreE");
                    String descripcione = request.getParameter("txtDescripcionE");
                    int id = Integer.parseInt(request.getParameter("txtId"));
                    cat.setNombre(nombree);
                    cat.setDescripcion(descripcione);
                    cat.setIdCategoria(id);
                    cDAO.actualizar(cat);
                    request.getRequestDispatcher("Controlador?menu=Categoria&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idu = Integer.parseInt(request.getParameter("id"));
                    Categoria c = cDAO.buscarCategoria(idu);
                    request.setAttribute("categoria", c);
                    break;
                case "Desactivar":
                    idc = Integer.parseInt(request.getParameter("id"));
                    cDAO.desactivar(idc);
                    request.getRequestDispatcher("Controlador?menu=Categoria&accion=Listar").forward(request, response);
                    break;
                case "Activar":
                    idc = Integer.parseInt(request.getParameter("id"));
                    cDAO.activar(idc);
                    request.getRequestDispatcher("Controlador?menu=Categoria&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Categoria.jsp").forward(request, response);
        }
        if (menu.equals("Producto")) {
            switch (accion) {
                case "Listar":
                    List lista = proDAO.listar();
                    request.setAttribute("productos", lista);
                    break;
                case "Agregar":
                    Categoria categorias = cDAO.buscarCategoria(Integer.valueOf(request.getParameter("txtCategoria")));
                    Proveedor proveedores = pDAO.buscarProveedor(Integer.valueOf(request.getParameter("txtProveedor")));
                    String nombre = request.getParameter("txtNombre");
                    Double precio = Double.valueOf(request.getParameter("txtPrecio"));
                    int stock = Integer.valueOf(request.getParameter("txtStock"));
                    prod.setCategoria(categorias);
                    prod.setProveedor(proveedores);
                    prod.setNombre(nombre);
                    prod.setPrecio(precio);
                    prod.setStock(stock);
                    proDAO.agregar(prod);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    Categoria categoriase = cDAO.buscarCategoria(Integer.valueOf(request.getParameter("txtCategoriaE")));
                    Proveedor proveedorese = pDAO.buscarProveedor(Integer.valueOf(request.getParameter("txtProveedorE")));
                    String nombree = request.getParameter("txtNombreE");
                    Double precioe = Double.valueOf(request.getParameter("txtPrecioE"));
                    int stocke = Integer.valueOf(request.getParameter("txtStockE"));
                    int id = Integer.parseInt(request.getParameter("txtId"));
                    prod.setCategoria(categoriase);
                    prod.setProveedor(proveedorese);
                    prod.setNombre(nombree);
                    prod.setPrecio(precioe);
                    prod.setStock(stocke);
                    prod.setIdProducto(id);
                    proDAO.actualizar(prod);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idpro = Integer.parseInt(request.getParameter("id"));
                    Producto p = proDAO.buscarProducto(idpro);
                    request.setAttribute("producto", p);
                    break;
                case "Desactivar":
                    idpro = Integer.parseInt(request.getParameter("id"));
                    proDAO.desactivar(idpro);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Activar":
                    idpro = Integer.parseInt(request.getParameter("id"));
                    proDAO.activar(idpro);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Producto.jsp").forward(request, response);
        }
        if (menu.equals("Venta")) {
            switch (accion) {
                case "BuscarResponsable":
                    String cedula = request.getParameter("codigocliente");
                    cli.setCedula(cedula);
                    cli = cliDAO.buscar(cedula);
                    request.setAttribute("cli", cli);
                    request.setAttribute("subTotalV", subTotalVVenta);
                    request.setAttribute("total", totalVenta);
                    request.setAttribute("totalC", totalVVenta);
                    request.setAttribute("lista", listaVenta);
                    request.setAttribute("prod", prod);
                    numeroserieVenta = vDAO.GenerarSerie();
                    if (numeroserieVenta == null) {
                        numeroserieVenta = "00000001";
                        request.setAttribute("nserie", numeroserieVenta);
                    } else {
                        int incrementar = Integer.parseInt(numeroserieVenta);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserieVenta = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserieVenta);
                    }
                    break;
                case "BuscarProducto":
                    int id = Integer.parseInt(request.getParameter("codigoproducto"));
                    prod.setIdProducto(id);
                    prod = proDAO.buscarProducto(id);
                    request.setAttribute("prod", prod);
                    request.setAttribute("subTotalV", subTotalVVenta);
                    request.setAttribute("total", totalVenta);
                    request.setAttribute("totalC", totalVVenta);
                    request.setAttribute("lista", listaVenta);
                    request.setAttribute("cli", cli);
                    numeroserieVenta = vDAO.GenerarSerie();
                    if (numeroserieVenta == null) {
                        numeroserieVenta = "00000001";
                        request.setAttribute("nserie", numeroserieVenta);
                    } else {
                        int incrementar = Integer.parseInt(numeroserieVenta);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserieVenta = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserieVenta);
                    }
                    break;
                case "Agregar":
                    subTotalVVenta = 0.0;
                    totalVenta = 0.0;
                    totalVVenta = 0.0;
                    Producto productos = proDAO.buscarProducto(Integer.valueOf(request.getParameter("codigoproducto")));
                    itemVenta = itemVenta + 1;
                    //cod=prod.getIdProducto();
                    descripcionVenta = request.getParameter("nombreproducto");
                    precioVenta = Double.parseDouble(request.getParameter("precio"));
                    cantVenta = Integer.parseInt(request.getParameter("cant"));
                    subTotalVenta = precioVenta * cantVenta;
                    v = new Venta();
                    v.setItem(itemVenta);
                    v.setProducto(productos);
                    v.setDescripcionP(descripcionVenta);
                    v.setPrecio(precioVenta);
                    v.setCantidad(cantVenta);
                    v.setSubTotal(subTotalVenta);
                    listaVenta.add(v);
                    for (int i = 0; i < listaVenta.size(); i++) {
                        subTotalVVenta = subTotalVVenta + listaVenta.get(i).getSubTotal();
                    }
                    request.setAttribute("subTotalV", subTotalVVenta);
                    totalVVenta = (12 * subTotalVVenta) / 100;
                    totalVenta = subTotalVVenta + totalVVenta;
                    request.setAttribute("total", totalVenta);
                    request.setAttribute("totalC", totalVVenta);
                    request.setAttribute("lista", listaVenta);
                    request.setAttribute("cli", cli);
                    numeroserieVenta = vDAO.GenerarSerie();
                    if (numeroserieVenta == null) {
                        numeroserieVenta = "00000001";
                        request.setAttribute("nserie", numeroserieVenta);
                    } else {
                        int incrementar = Integer.parseInt(numeroserieVenta);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserieVenta = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserieVenta);
                    }
                    break;
                case "GenerarVenta":
                    //Guardar Venta
                    Cliente clientes = cliDAO.buscarCliente(cli.getIdCliente());
                    v.setCliente(clientes);
                    Usuario usuarios = uDAO.buscarUsuario(1);
                    v.setUsuario(usuarios);
                    v.setNumSerie(numeroserieVenta);
                    v.setIva(ivaVenta);
                    v.setSubTotalV(subTotalVVenta);
                    v.setTotal(totalVenta);
                    vDAO.guardarVentas(v);
                    //Guardar Detalle Venta
                    int idv = Integer.parseInt(vDAO.idVentas());
                    for (int i = 0; i < listaVenta.size(); i++) {
                        v = new Venta();
                        v.setIdVenta(idv);
                        Producto products = proDAO.buscarProducto(listaVenta.get(i).getProducto().getIdProducto());
                        v.setProducto(products);
                        v.setCantidad(listaVenta.get(i).getCantidad());
                        v.setPrecio(listaVenta.get(i).getPrecio());
                        vDAO.guardarDetalleVentas(v);
                    }
                    break;
                case "Cancelar":
                    for (int i = 0; i < listaVenta.size(); i++) {
                        listaVenta.remove(i);
                        i = i - 1;
                    }
                    break;
                default:
                    numeroserieVenta = vDAO.GenerarSerie();
                    if (numeroserieVenta == null) {
                        numeroserieVenta = "00000001";
                        request.setAttribute("nserie", numeroserieVenta);
                    } else {
                        int incrementar = Integer.parseInt(numeroserieVenta);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserieVenta = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserieVenta);
                    }
                    request.getRequestDispatcher("Venta.jsp").forward(request, response);
            }
            request.getRequestDispatcher("Venta.jsp").forward(request, response);
        }
        if (menu.equals("Compra")) {
            switch (accion) {
                case "BuscarProveedor":
                    String ruc = request.getParameter("codigoproveedor");
                    pro.setRuc(ruc);
                    pro = pDAO.buscar(ruc);
                    request.setAttribute("pro", pro);
                    request.setAttribute("subTotalV", subTotalCCompra);
                    request.setAttribute("total", totalCompra);
                    request.setAttribute("totalC", totalCCompra);
                    request.setAttribute("lista", listaCompra);
                    request.setAttribute("prod", prod);
                    numeroserieCompra = compDAO.GenerarSerie();
                    if (numeroserieCompra == null) {
                        numeroserieCompra = "00000001";
                        request.setAttribute("nserie", numeroserieCompra);
                    } else {
                        int incrementar = Integer.parseInt(numeroserieCompra);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserieCompra = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserieCompra);
                    }
                    break;
                case "BuscarProducto":
                    int id = Integer.parseInt(request.getParameter("codigoproducto"));
                    prod.setIdProducto(id);
                    prod = proDAO.buscarProducto(id);
                    request.setAttribute("prod", prod);
                    request.setAttribute("subTotalV", subTotalCCompra);
                    request.setAttribute("total", totalCompra);
                    request.setAttribute("totalC", totalCCompra);
                    request.setAttribute("lista", listaCompra);
                    request.setAttribute("pro", pro);
                    numeroserieCompra = compDAO.GenerarSerie();
                    if (numeroserieCompra == null) {
                        numeroserieCompra = "00000001";
                        request.setAttribute("nserie", numeroserieCompra);
                    } else {
                        int incrementar = Integer.parseInt(numeroserieCompra);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserieCompra = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserieCompra);
                    }
                    break;
                    case "Agregar":
                    subTotalCCompra = 0.0;
                    totalCompra = 0.0;
                    totalCCompra = 0.0;
                    Producto productos = proDAO.buscarProducto(Integer.valueOf(request.getParameter("codigoproducto")));
                    itemCompra = itemCompra + 1;
                    descripcionCompra = request.getParameter("nombreproducto");
                    precioCompra = Double.parseDouble(request.getParameter("precio"));
                    cantCompra = Integer.parseInt(request.getParameter("cant"));
                    int stockDisponible = productos.getStock();
                    if (cantCompra <= stockDisponible) {
                        subTotalCompra = precioCompra * cantCompra;
                        productos.setStock(stockDisponible - cantCompra);
                        proDAO.actualizar(productos);
                    } else {
                        request.setAttribute("error", "No hay suficiente stock disponible.");
                        break;
                    }
                    c = new Compra();
                    c.setItem(itemCompra);
                    c.setProducto(productos);
                    c.setDescripcionP(descripcionCompra);
                    c.setPrecio(precioCompra);
                    c.setCantidad(cantCompra);
                    c.setSubTotal(subTotalCompra);
                    listaCompra.add(c);
                    for (int i = 0; i < listaCompra.size(); i++) {
                        subTotalCCompra = subTotalCCompra + listaCompra.get(i).getSubTotal();
                    }
                    request.setAttribute("subTotalV", subTotalCCompra);
                    totalCCompra = (12 * subTotalCCompra) / 100;
                    totalCompra = subTotalCCompra + totalCCompra;
                    request.setAttribute("total", totalCompra);
                    request.setAttribute("totalC", totalCCompra);
                    request.setAttribute("lista", listaCompra);
                    request.setAttribute("pro", pro);
                    numeroserieCompra = compDAO.GenerarSerie();
                    if (numeroserieCompra == null) {
                        numeroserieCompra = "00000001";
                        request.setAttribute("nserie", numeroserieCompra);
                    } else {
                        int incrementar = Integer.parseInt(numeroserieCompra);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserieCompra = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserieCompra);
                    }
                break;

                case "GenerarCompra":
                    //Guardar Venta
                    Proveedor proveedores = pDAO.buscarProveedor(pro.getIdProveedor());
                    c.setProveedor(proveedores);
                    Usuario usuarios = uDAO.buscarUsuario(1);
                    c.setUsuario(usuarios);
                    c.setNumSerie(numeroserieCompra);
                    c.setIva(ivaCompra);
                    c.setSubTotalV(subTotalCCompra);
                    c.setTotal(totalCompra);
                    compDAO.guardarCompras(c);
                    //Guardar Detalle Venta
                    int idc = Integer.parseInt(compDAO.idCompras());
                    for (int i = 0; i < listaCompra.size(); i++) {
                        c = new Compra();
                        c.setIdCompra(idc);
                        Producto products = proDAO.buscarProducto(listaCompra.get(i).getProducto().getIdProducto());
                        c.setProducto(products);
                        c.setCantidad(listaCompra.get(i).getCantidad());
                        c.setPrecio(listaCompra.get(i).getPrecio());
                        compDAO.guardarDetalleCompra(c);
                    }
                    break;
                case "Cancelar":
                    for (int i = 0; i < listaCompra.size(); i++) {
                        listaCompra.remove(i);
                        i = i - 1;
                    }
                    break;
                default:
                    numeroserieCompra = compDAO.GenerarSerie();
                    if (numeroserieCompra == null) {
                        numeroserieCompra = "00000001";
                        request.setAttribute("nserie", numeroserieCompra);
                    } else {
                        int incrementar = Integer.parseInt(numeroserieCompra);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserieCompra = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserieCompra);
                    }
                    request.getRequestDispatcher("Compra.jsp").forward(request, response);
            }
            request.getRequestDispatcher("Compra.jsp").forward(request, response);
        }
        if (menu.equals("Cliente")) {
            switch (accion) {
                case "Listar":
                    List lista = cliDAO.listar();
                    request.setAttribute("clientes", lista);
                    break;
                case "Agregar":
                    String cedula = request.getParameter("txtCedula");
                    String nombre = request.getParameter("txtNombre");
                    String direccion = request.getParameter("txtDireccion");
                    String telefono = request.getParameter("txtTelefono");
                    String correo = request.getParameter("txtCorreo");
                    cli.setCedula(cedula);
                    cli.setNombre(nombre);
                    cli.setDireccion(direccion);
                    cli.setTelefono(telefono);
                    cli.setCorreo(correo);
                    cliDAO.agregar(cli);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String cedulae = request.getParameter("txtCedulaE");
                    String nombree = request.getParameter("txtNombreE");
                    String direccione = request.getParameter("txtDireccionE");
                    String telefonoe = request.getParameter("txtTelefonoE");
                    String correoe = request.getParameter("txtCorreoE");
                    int id = Integer.parseInt(request.getParameter("txtId"));
                    cli.setCedula(cedulae);
                    cli.setNombre(nombree);
                    cli.setDireccion(direccione);
                    cli.setTelefono(telefonoe);
                    cli.setCorreo(correoe);
                    cli.setIdCliente(id);
                    cliDAO.actualizar(cli);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idcli = Integer.parseInt(request.getParameter("id"));
                    Cliente cl = cliDAO.buscarCliente(idcli);
                    request.setAttribute("cliente", cl);
                    break;
                case "Desactivar":
                    idcli = Integer.parseInt(request.getParameter("id"));
                    cliDAO.desactivar(idcli);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Activar":
                    idcli = Integer.parseInt(request.getParameter("id"));
                    cliDAO.activar(idcli);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Cliente.jsp").forward(request, response);
        }
        if (menu.equals("Proveedor")) {
            switch (accion) {
                case "Listar":
                    List lista = pDAO.listar();
                    request.setAttribute("proveedores", lista);
                    break;
                case "Agregar":
                    String ruc = request.getParameter("txtRuc");
                    String nombre = request.getParameter("txtNombre");
                    String direccion = request.getParameter("txtDireccion");
                    String telefono = request.getParameter("txtTelefono");
                    String correo = request.getParameter("txtCorreo");
                    pro.setRuc(ruc);
                    pro.setNombre(nombre);
                    pro.setDireccion(direccion);
                    pro.setTelefono(telefono);
                    pro.setCorreo(correo);
                    pDAO.agregar(pro);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String ruce = request.getParameter("txtRucE");
                    String nombree = request.getParameter("txtNombreE");
                    String direccione = request.getParameter("txtDireccionE");
                    String telefonoe = request.getParameter("txtTelefonoE");
                    String correoe = request.getParameter("txtCorreoE");
                    int id = Integer.parseInt(request.getParameter("txtId"));
                    pro.setRuc(ruce);
                    pro.setNombre(nombree);
                    pro.setDireccion(direccione);
                    pro.setTelefono(telefonoe);
                    pro.setCorreo(correoe);
                    pro.setIdProveedor(id);
                    pDAO.actualizar(pro);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idp = Integer.parseInt(request.getParameter("id"));
                    Proveedor p = pDAO.buscarProveedor(idp);
                    request.setAttribute("proveedor", p);
                    break;
                case "Desactivar":
                    idp = Integer.parseInt(request.getParameter("id"));
                    pDAO.desactivar(idp);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    break;
                case "Activar":
                    idp = Integer.parseInt(request.getParameter("id"));
                    pDAO.activar(idp);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
        }
        if (menu.equals("ConsultaVenta")) {
            switch (accion) {
                case "Listar":
                    String fechaInicioVenta =  request.getParameter("txtFechaInicioVenta");
                    String fechaFinVenta =  request.getParameter("txtFechaFinVenta");
                    List lista = vDAO.listarVentaFecha(fechaInicioVenta,fechaFinVenta);
                    request.setAttribute("ventas", lista);
                    break;
                case "Anular":
                    int idv = Integer.parseInt(request.getParameter("id"));
                    vDAO.anular(idv);
                    request.getRequestDispatcher("Controlador?menu=ConsultaVenta&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("ConsultaVenta.jsp").forward(request, response);
        }
        if (menu.equals("ConsultaCompra")) {
            switch (accion) {
                case "Listar":
                    String fechaInicioCompra =  request.getParameter("txtFechaInicioCompra");
                    String fechaFinCompra =  request.getParameter("txtFechaFinCompra");
                    List lista = compDAO.listarCompraFecha(fechaInicioCompra,fechaFinCompra);
                    request.setAttribute("compras", lista);
                    break;
                case "Anular":
                    int idc = Integer.parseInt(request.getParameter("id"));
                    compDAO.anular(idc);
                    request.getRequestDispatcher("Controlador?menu=ConsultaComprar&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("ConsultaCompra.jsp").forward(request, response);
        }
        if (menu.equals("Rol")) {
            switch (accion) {
                case "Listar":
                    List lista = rDAO.listar();
                    request.setAttribute("roles", lista);
                    break;
                case "Desactivar":
                    idr = Integer.parseInt(request.getParameter("id"));
                    rDAO.desactivar(idr);
                    request.getRequestDispatcher("Controlador?menu=Rol&accion=Listar").forward(request, response);
                    break;
                case "Activar":
                    idr = Integer.parseInt(request.getParameter("id"));
                    rDAO.activar(idr);
                    request.getRequestDispatcher("Controlador?menu=Rol&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Rol.jsp").forward(request, response);
        }
        if (menu.equals("Usuario")) {
            switch (accion) {
                case "Listar":
                    List lista = uDAO.listar();
                    request.setAttribute("usuarios", lista);
                    break;
                case "Agregar":
                    Rol roles = rDAO.buscarRol(Integer.valueOf(request.getParameter("txtRol")));
                    String cedula = request.getParameter("txtCedula");
                    String nombre = request.getParameter("txtNombre");
                    String telefono = request.getParameter("txtTelefono");
                    String direccion = request.getParameter("txtDireccion");
                    String correo = request.getParameter("txtCorreo");
                    us.setRol(roles);
                    us.setNombre(nombre);
                    us.setCedula(cedula);
                    us.setTelefono(telefono);
                    us.setDireccion(direccion);
                    us.setCorreo(correo);
                    uDAO.agregar(us);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    Rol rolese = rDAO.buscarRol(Integer.valueOf(request.getParameter("txtRolE")));
                    String cedulae = request.getParameter("txtCedulaE");
                    String nombree = request.getParameter("txtNombreE");
                    String telefonoe = request.getParameter("txtTelefonoE");
                    String direccione = request.getParameter("txtDireccionE");
                    String correoe = request.getParameter("txtCorreoE");
                    int id = Integer.parseInt(request.getParameter("txtId"));
                    us.setRol(rolese);
                    us.setNombre(nombree);
                    us.setCedula(cedulae);
                    us.setTelefono(telefonoe);
                    us.setDireccion(direccione);
                    us.setCorreo(correoe);
                    us.setIdUsuario(id);
                    uDAO.actualizar(us);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idu = Integer.parseInt(request.getParameter("id"));
                    Usuario u = uDAO.buscarUsuario(idu);
                    request.setAttribute("usuario", u);
                    break;
                case "Desactivar":
                    idu = Integer.parseInt(request.getParameter("id"));
                    uDAO.desactivar(idu);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                case "Activar":
                    idu = Integer.parseInt(request.getParameter("id"));
                    uDAO.activar(idu);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Usuario.jsp").forward(request, response);
        }
    }
    
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public static java.sql.Date FechaDadoString(String fecha) {
        long lnMilisegundos = 0;
        try {
            java.util.Date date = sdf.parse(fecha);
            lnMilisegundos = date.getTime();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        java.sql.Date sqlTimestamp = new java.sql.Date(lnMilisegundos);
        return sqlTimestamp;
    }

    void LimpiarListaVenta() {
        for (int i = 0; i < listaVenta.size(); i++) {
            listaVenta.remove(i);
            i = i - 1;
        }
    }
    
    void LimpiarListaCompra() {
        for (int i = 0; i < listaCompra.size(); i++) {
            listaCompra.remove(i);
            i = i - 1;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
