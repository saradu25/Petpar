<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Instituição- PetPar</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/cadastro.css">
</head>
<body >
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">PetPar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a href="home.jsp" class="nav-link" href="#">Inicio</a>
            </li>
            <li class="nav-item">
                <a href="userLogin.jsp" class="nav-link" href="#">Quero adotar</a>
            </li>
            <li class="nav-item">
                <a href="institutionLogin.jsp" class="nav-link" href="#">Faça Parte</a>
            </li>
            <li class="nav-item">
                <a href="contato.jsp" class="nav-link" href="#">Contato</a>
            </li>
        </ul>
    </div>
</nav>

<div class="cadastro-container"> <!-- class="login-container shadow-lg p-5 rounded bg-custom d-flex justify-content-center align-items-center" -->
    <fieldset>
        <legend>Login Instituição</legend>
      <form action="ControllerServlet" method="post" >

        <div class="inputBox">
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required>
        </div>

        <div class="inputBox">
          <label for="password">Senha:</label>
          <input type="password" id="texPassword" name="texPassword" required>
        </div>

        <button type="submit" name="action" value="institutionLogin">Entrar</button>
      </form>
    </fieldset>

    <div class="text-center mt-3">
      <p class="text-black">Não tem conta?
      <a href="institutionRegister.jsp" >Cadastre-se aqui</a></p>
      <p><a href="#">Esqueceu sua senha?</a></p>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
