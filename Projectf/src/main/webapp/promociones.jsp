<%-- 
    Document   : promociones
    Created on : 8 dic. 2022, 20:55:15
    Author     : Manuel
--%>

<%@page import="modelo.bean.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.bean.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <% ArrayList<Producto> lista = (ArrayList<Producto>) request.getAttribute("combo");
     %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TRABAJO APLICATIVO</title>
    <!-- icono de pestaña  -->
    <link rel="icon" href="images/logosf.png">
    <script src="https://kit.fontawesome.com/4767f52d92.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="CSS/style.css">

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
        <a href="#broaster">Broaster</a>
        <a href="#salchipapas">Salchipapas</a>
        <a href="#chaufas">Chaufas</a>
        <a href="#bebidas">Bebidas</a>
        <a href="nosotros.jsp">Nosotros</a>
    </nav>
    
        <div class="icons">
            <a style=" color: #fff; font-size: 2.5rem " href="carrito" id="cart-btn"><i class="fa-sharp fa-solid fa-cart-shopping" style=" color: #fff; font-size: 2.5rem "></i>(<label style=" color: #fff; font-size: 2.5rem">${contador}</label>)</a>
            <div><h4 style=" color: #fff; font-size: 1.8rem"  id="us">Usuario: <%=cli.getNombre()%></h4></div>
            <a style=" color: #fff; font-size: 1.8rem" href="cerrarSesion">Cerrar Sesión  <i style=" color: #fff; font-size: 2.5rem" class="fa-sharp fa-solid fa-right-from-bracket"></i></a>
        </div>
    
    </header>

    <section class="menu" id="promociones">

        <h1 class="heading" >  <span>promociones</span> </h1>
        <div class="box-container">
    <% for (Producto pr : lista) {%>
            <div class="box">
                <img src="<%=pr.getFoto()%>" width="200" height="100" >
                <h3><%=pr.getNombres()%></h3>
                <h3><%=pr.getDescripcion()%></h3>
                <div class="price">S/<%=pr.getPrecio()%> <span></span></div>
                <a href="Controlador?id=<%=pr.getIdpro()%>" class="btn">Agregar a Carrito</a>
                <a href="comprar?id=<%=pr.getIdpro()%>" class="btn">Comprar</a>
            </div>
                <% }%>
    
            
    
        </div>
    
    </section>
                
    <section class="menu" id="broaster">

        <h1 class="heading" >  <span>broaster</span> </h1>
        <div class="box-container">
    
            <div class="box">
                <img src="Img/broaster-1.png" alt="">
                <h3>alita broaster</h3>
                <div class="price">S/.8 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/broaster-2.png" alt="">
                <h3>encuentro broaster</h3>
                <div class="price">S/.8,5<span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/broaster-3.png" alt="">
                <h3>pierna broaster</h3>
                <div class="price">S/.8,5 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/broaster-4.png" alt="">
                <h3>pecho broaster</h3>
                <div class="price">S/.9 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>

        </div>
    
    </section>
                
    <section class="menu" id="salchipapas">

        <h1 class="heading" >  <span>salchipapas</span> </h1>
        <div class="box-container">
    
            <div class="box">
                <img src="Img/salchipapa-1.png" alt="">
                <h3>Salchipapa</h3>
                <h3>papas fritas + <hr> salchicha</h3>
                <div class="price">S/.7 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/salchipapa-2.png" alt="">
                <h3>salchibroaster</h3>
                <h3>papas fritas + salchicha + broaster</h3>
                <div class="price">S/.9,5<span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/salchipapa-3.png" alt="">
                <h3>mostrito broaster</h3>
                <h3>papas fritas + chaufa + broaster (ala)</h3>
                <div class="price">S/.10 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/salchipapa-4.png" alt="">
                <h3>mostrito broaster</h3>
                <h3>papas fritas + chaufa + broaster (pierna)</h3>
                <div class="price">S/.11 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/salchipapa-5.png" alt="">
                <h3>mostrito broaster</h3>
                <h3>papas fritas + chaufa + broaster (pecho)</h3>
                <div class="price">S/.12 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>

    
        </div>
    
    </section>
                
    <section class="menu" id="chaufas">

        <h1 class="heading" >  <span>chaufas</span> </h1>
        <div class="box-container">
    
            <div class="box">
                <img src="Img/chaufa-1.png" alt="">
                <h3>chaufa de pollo</h3>
                <div class="price">S/.9 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/chaufa-2.png" alt="">
                <h3>chaufa de carne</h3>
                <div class="price">S/.10,5<span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/chaufa-3.png" alt="">
                <h3>aeropuerto de pollo</h3>
                <div class="price">S/.10 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/chaufa-4.png" alt="">
                <h3>salvaje</h3>
                <div class="price">S/.12 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/chaufa-5.png" alt="">
                <h3>chaufa especial</h3>
                <div class="price">S/.13 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
        </div>
    
    </section>
                
    <section class="menu" id="bebidas">

        <h1 class="heading" >  <span>bebidas</span> </h1>
        <div class="box-container">
    
            <div class="box bb">
                <img src="Img/bebida-1.png" alt="">
                <h3>chicha 1 L</h3>
                <div class="price">S/.8 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box bb">
                <img src="Img/bebida-2.png" alt="">
                <h3>chicha 1/2 L</h3>
                <div class="price">S/.4<span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box">
                <img src="Img/bebida-3.png" alt="">
                <h3>gaseosa 1 1/2 L</h3>
                <div class="price">S/.7 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box bb">
                <img src="Img/bebida-4.png" alt="">
                <h3>gaseosa pepsi 1 1/2 L</h3>
                <div class="price">S/.5 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>
    
            <div class="box bb">
                <img src="Img/bebida-5.png" alt="">
                <h3>botella de agua</h3>
                <div class="price">S/.2 <span></span></div>
                <a href="#" class="btn">Comprar</a>
            </div>

        </div>
    
    </section>
</body>
