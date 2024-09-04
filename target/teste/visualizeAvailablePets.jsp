<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Animais Disponíveis para Adoção</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/animalList.css">
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">PetPar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Início</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Adotar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">ONGs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Doações</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contato</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Conteúdo Principal -->
<div class="container my-5">
    <h1 class="text-center BLANCOX-5-hex">Animais Disponíveis para Adoção</h1>
    <div class="row">
        <%
            List<Animal> animals = (List<Animal>) request.getAttribute("filteredAnimals");
            if (animals != null && !animals.isEmpty()) {
                for (Animal animal : animals) {
        %>
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <img src="<%= animal.getImageUrl() %>" class="card-img-top" alt="<%= animal.getName() %>">
                <div class="card-body">
                    <h5 class="card-title BLANCOX-1-hex"><%= animal.getName() %></h5>
                    <p class="card-text"><%= animal.getDescription() %></p>
                    <p class="text-muted">Publicado em: <%= animal.getPostedAt() %></p>
                    <a href="adoptAnimal.jsp?id=<%= animal.getId() %>" class="btn btn-adopt w-100">Adotar</a>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <p class="text-center">Nenhum animal disponível para adoção no momento.</p>
        <% } %>
    </div>
</div>

<!-- Footer -->
<footer class="text-center p-3 BLANCOX-4-hex">
    <p>PetPar © 2024 - Todos os direitos reservados</p>
</footer>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
