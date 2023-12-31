<%-- 
    Document   : carrito
    Created on : 9 dic. 2022, 12:03:34
    Author     : gabri
--%>

<%@page import="modelo.bean.Cliente"%>
<%@page import="modelo.bean.Carrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.bean.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% ArrayList<Carrito> lista = (ArrayList<Carrito>) request.getAttribute("carrito");
        %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TRABAJO APLICATIVO</title>
        <script src="https://kit.fontawesome.com/4767f52d92.js" crossorigin="anonymous"></script>
        <script>
            function confirmar() {
                if (confirm("Esta seguro de eliminar compra?")) {
                    return true;
                }
                return false;
            }
            function confirmarCompra() {
                if (confirm("COMPRA EXITOSA")) {
                    return true;
                }
                return false;
            }

        </script>
        <!-- icono de pestaña  -->
        <link rel="icon" href="images/logosf.png">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <link href="CSS/style_1.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body>
        <%
            Cliente cli = (Cliente) request.getSession().getAttribute("cliente");
        %>
        
<header class="header">

        <a href="index.jsp" class="logo">
        <img src="Img/logosf.png" alt="">
        </a>
    
        <nav class="navbar">
        <a href="#promociones">Inicio</a>
        <a href="promociones">Promociones</a>
        <a href="#broaster">Broaster</a>
        <a href="#salchipapas">Salchipapas</a>
        <a href="#chaufas">Chaufas</a>
        <a href="#bebidas">Bebidas</a>
        <a href="nosotros.jsp">Nosotros</a>
    </nav>
    
    <div class="icons" style=" text-align: right ">
            <a style=" color: #fff; font-size: 1.5rem  " href="carrito" id="cart-btn"><i class="fa-sharp fa-solid fa-cart-shopping" style=" color: #fff; font-size: 1.5rem "></i>(<label style=" color: #fff; font-size: 1.5rem">${contador}</label>)</a>
            <div><h4 style=" color: #fff; font-size: 1rem"  id="us">Usuario: <%=cli.getNombre()%></h4></div>
            <a style=" color: #fff; font-size: 1rem" href="cerrarSesion">Cerrar Sesión  <i style=" color: #fff; font-size: 1.5rem" class="fa-sharp fa-solid fa-right-from-bracket"></i></a>
        </div>
    

    </header>
        
        <div class="container mt-4">
            <h3>Carrito</h3>
            <br>
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ITEM</th>
                                <th>NOMBRES</th>
                                <th>DESCRIPCIÓN</th>
                                <th>PRECIO</th>
                                <th>CANTIDAD</th>
                                <th>SUBTOTAL</th>
                                <th>ACCION</th>
                                <th></th>
                            </tr>
                            <% for (Carrito car : lista) {%>
                        </thead>
                        <tbody>
                            <tr>
                                <th><%=car.getItem()%></th>
                                <th><%=car.getNombres()%></th>
                                <th><%=car.getDescripcion()%></th>
                                <th><%=car.getPrecioCompra()%></th>
                                <th><%=car.getCantidad()%></th> 
                                <th id="idsub"><%=car.getSubtotal()%></th>
                                <th>
                                    <input type="hidden" id="idp" value="<%=car.getIdproducto()%>">
                                    <a href="eliminarProd?id=<%=car.getIdproducto()%>" onclick="return confirmar()"  id="btnDelete">eliminar</a>

                                </th>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>

                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <h3>Generar Compra</h3>
                        </div>
                        <div class="card-body">
                            <label>Subtotal:</label>
                            <input type="text" value="$/${totalPagar}" readonly="" class="form-control"><br>
                            <label>Descuento:</label>
                            <input type="text" value="$/0.0" readonly="" class="form-control"><br>
                            <label>Total Pagar:</label>
                            <input type="text" value="${totalPagar}" readonly="" class="form-control"><br>
                        </div>
                        <div class="card-footer">
                            <a href="GenerarCompra?id=<%=cli.getId()%>" class="btn btn-danger btn-block" onclick="return confirmarCompra()" > Generar Compra  </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
<script src="https://kit.fontawesome.com/4767f52d92.js" crossorigin="anonymous"></script>
</body>
</html>
