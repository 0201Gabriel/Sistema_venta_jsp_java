<%-- 
    Document   : registrar
    Created on : 22 dic. 2022, 15:13:38
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @use postcss-preset-env {
  stage: 0;
}

/* config.css */

:root {
  --baseColor: #606468;
}

/* helpers/align.css */

.align {
  display: grid;
  place-items: center;
}

.grid {
  inline-size: 90%;
  margin-inline: auto;
  max-inline-size: 20rem;
}

/* helpers/hidden.css */

.hidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

/* helpers/icon.css */

:root {
  --iconFill: var(--baseColor);
}

.icons {
  display: none;
}

.icon {
  block-size: 1em;
  display: inline-block;
  fill: var(--iconFill);
  inline-size: 1em;
  vertical-align: middle;
}

/* layout/base.css */

:root {
  --htmlFontSize: 100%;

  --bodyBackgroundColor: #2c3338;
  --bodyColor: var(--baseColor);
  --bodyFontFamily: "Open Sans";
  --bodyFontFamilyFallback: sans-serif;
  --bodyFontSize: 0.875rem;
  --bodyFontWeight: 400;
  --bodyLineHeight: 1.5;
}

* {
  box-sizing: inherit;
}

html {
  box-sizing: border-box;
  font-size: var(--htmlFontSize);
}

body {
  background-color: var(--bodyBackgroundColor);
  color: var(--bodyColor);
  font-family: var(--bodyFontFamily), var(--bodyFontFamilyFallback);
  font-size: var(--bodyFontSize);
  font-weight: var(--bodyFontWeight);
  line-height: var(--bodyLineHeight);
  margin: 0;
  min-block-size: 100vh;
}

/* modules/anchor.css */

:root {
  --anchorColor: #eee;
}

a {
  color: var(--anchorColor);
  outline: 0;
  text-decoration: none;
}

a:focus,
a:hover {
  text-decoration: underline;
}

/* modules/form.css */

:root {
  --formGap: 0.875rem;
}

input {
  background-image: none;
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  transition: background-color 0.3s;
}

input[type="submit"] {
  cursor: pointer;
}

.form {
  display: grid;
  gap: var(--formGap);
}

.form input[type="password"],
.form input[type="text"],
.form input[type="submit"] {
  inline-size: 100%;
}

.form__field {
  display: flex;
}
h1{
   display: flex; 
   align-items: center;
   flex-direction: column;
   font-size: 2rem;
}
.form__input {
  flex: 1;
}

/* modules/login.css */

:root {
  --loginBorderRadus: 0.25rem;
  --loginColor: #eee;

  --loginInputBackgroundColor: #3b4148;
  --loginInputHoverBackgroundColor: #434a52;

  --loginLabelBackgroundColor: #363b41;

  --loginSubmitBackgroundColor: #ea4c88;
  --loginSubmitColor: #eee;
  --loginSubmitHoverBackgroundColor: #d44179;
}

.login {
  color: var(--loginColor);
}

.login label,
.login input[type="text"],
.login input[type="password"],
.login input[type="submit"] {
  border-radius: var(--loginBorderRadus);
  padding: 1rem;
}

.login label {
  background-color: var(--loginLabelBackgroundColor);
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-inline: 1.25rem;
}

.login input[type="password"],
.login input[type="text"] {
  background-color: var(--loginInputBackgroundColor);
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}

.login input[type="password"]:focus,
.login input[type="password"]:hover,
.login input[type="text"]:focus,
.login input[type="text"]:hover {
  background-color: var(--loginInputHoverBackgroundColor);
}

.login input[type="submit"] {
  background-color: var(--loginSubmitBackgroundColor);
  color: var(--loginSubmitColor);
  font-weight: 700;
  text-transform: uppercase;
}

.login input[type="submit"]:focus,
.login input[type="submit"]:hover {
  background-color: var(--loginSubmitHoverBackgroundColor);
}

/* modules/text.css */

p {
  margin-block: 1.5rem;
}

.text--center {
  text-align: center;
}
        </style>
    </head>
    <body class="align">
        
        <div class="grid">
            <h1>Registrarse</h1>
         <form action="registraCliente" method="post" class="form login">
         <div class="form__field">
             <label for="login__username"><svg class="icon">
             <use xlink:href="#icon-user"></use>
             </svg><span class="hidden">Username</span></label>
        <input name="dni" autocomplete="username" id="login__username" type="text" name="username" class="form__input" placeholder="DNI" required>
         </div>
             
        <div class="form__field">
             <label for="login__username"><svg class="icon">
             <use xlink:href="#icon-user"></use>
             </svg><span class="hidden">Username</span></label>
        <input name="nombres" autocomplete="username" id="login__username" type="text" name="username" class="form__input" placeholder="Nombres" required>
         </div>
             
        <div class="form__field">
             <label for="login__username"><svg class="icon">
             <use xlink:href="#icon-user"></use>
             </svg><span class="hidden">Username</span></label>
        <input name="direccion" autocomplete="username" id="login__username" type="text" name="username" class="form__input" placeholder="Dirección" required>
         </div>
             
        <div class="form__field">
             <label for="login__username"><svg class="icon">
             <use xlink:href="#icon-user"></use>
             </svg><span class="hidden">Username</span></label>
        <input name="email" autocomplete="username" id="login__username" type="text" name="username" class="form__input" placeholder="Email" required>
         </div>

        <div class="form__field">
        <label for="login__password"><svg class="icon">
            <use xlink:href="#icon-lock"></use>
          </svg><span class="hidden">Password</span></label>
        <input id="login__password" type="password" name="password" class="form__input" placeholder="Password" required>
        </div>            

        <div class="form__field">
        <input type="submit" value="Registrarse">
        </div>     
        </form>
            </div>
    </body>
</html>
