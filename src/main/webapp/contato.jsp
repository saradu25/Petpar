<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contato - PetPar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/donations.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="home.jsp">PetPar</a>
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


<div class="container contact-container">
    <div class="contact-header">
        <h2>Fale Conosco</h2>
        <p>Entre em contato com a equipe de desenvolvedores da PetPar</p>
    </div>
    <form>
        <div class="mb-3">
            <label for="name" class="form-label">Nome Completo</label>
            <input type="text" class="form-control" id="name" placeholder="Seu nome">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">E-mail</label>
            <input type="email" class="form-control" id="email" placeholder="seuemail@exemplo.com">
        </div>
        <div class="mb-3">
            <label for="subject" class="form-label">Assunto</label>
            <input type="text" class="form-control" id="subject" placeholder="Assunto do contato">
        </div>
        <div class="mb-3">
            <label for="message" class="form-label">Mensagem</label>
            <textarea class="form-control" id="message" rows="5" placeholder="Sua mensagem"></textarea>
        </div>
        <button type="submit" class="btn btn-custom btn-lg w-100">Enviar</button>
    </form>
</div>

<br></br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
