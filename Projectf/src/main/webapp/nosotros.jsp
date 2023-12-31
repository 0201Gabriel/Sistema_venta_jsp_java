<%-- 
    Document   : nosotros
    Created on : 8 dic. 2022, 20:55:02
    Author     : Manuel
--%>

<%@page import="modelo.bean.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TRABAJO APLICATIVO</title>
    <!-- icono de pestaña  -->
    <link rel="icon" href="images/logosf.png">
    <script src="https://kit.fontawesome.com/4767f52d92.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link rel="stylesheet" href="CSS/style.css">

</head>
<body>
     <%
        Cliente cli=(Cliente)request.getSession().getAttribute("cliente");     
        %>
    
<!-- header section starts  -->

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

    <div class="icons">
        <div class="fas fa-shopping-cart" id="cart-btn">(<label>${contador}</label>)</div>
        <div><h4 style=" color: #fff; font-size: 1.8rem"  id="us">Usuario: <%=cli.getNombre()%></h4></div>
        <a style=" color: #fff; font-size: 1.8rem" href="cerrarSesion">Cerrar Sesión  <i style=" color: #fff; font-size: 2.5rem" class="fa-sharp fa-solid fa-right-from-bracket"></i></a>
    </div>

</header>
<section class="about" id="about">

    <h1 class="heading"> <span>sobre</span> nosotros </h1>

    <div class="row">

        <div class="image">
            <img src="Img/nosotros.png" alt="">
        </div>

        <div class="content">
            <h3>¿Por qué nuestra pollería es especial?</h3>
            <p>Somos una Pollería que siempre busca mejorar en la innovación de los pedidos, contamos con la maquinaria adecuada
            y bien estructurada para la relizacion de los productos, que finalmente llegan a la boca de nuestros clientes</p>
        </div>

    </div>

</section>
</body>