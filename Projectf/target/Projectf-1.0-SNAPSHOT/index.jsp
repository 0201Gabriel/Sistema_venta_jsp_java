
<%@page import="modelo.bean.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pollería El Galponazo</title>

    <link rel="icon" href="Img/logosf.png">
    <script src="https://kit.fontawesome.com/4767f52d92.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="CSS/style.css">
    <style>
        
    </style>
</head>
<body>
    <%
        Cliente cli=(Cliente)request.getSession().getAttribute("cliente");     
        %>
    
<header class="header">

    <a href="index.jsp" class="logo">
        <img src="Img/logosf.png" alt="">
    </a>

    <nav class="navbar">
        <a href="#promociones">Inicio</a>
        <a href="promociones">Promociones</a>
        <<a href="#broaster">Broaster</a>
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


<section class="home" id="home">

    <div class="content">
        <h3>El mejor pollo a la brasa</h3>
        <p>Crocante, bien dorado y jugoso</p>

    </div>

</section>
</body>
</html>
