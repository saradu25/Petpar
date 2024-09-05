<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Animais para Adoção - PetPar</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">PetPar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a href="paginaRecebimento.jsp" class="nav-link" href="#">Inicio</a>
            </li>
            <li class="nav-item">
                <a href="animalList.jsp" class="nav-link" href="#">Quero adotar</a>
            </li>
            <li class="nav-item">
                <a href="donations.jsp" class="nav-link" href="#">Como ajudar?</a>
            </li>
            <li class="nav-item">
                <a href="contato.jsp" class="nav-link" href="#">Contato</a>
            </li>
        </ul>
    </div>
</nav>

<h2>Animais para Adoção</h2>
<div>
    <c:forEach var="animal" items="${animals}">
        <div>
            <img src="${animal.imageUrl}" alt="Foto do ${animal.name}" style="width:100px; height:100px;">
            <h3>${animal.name}</h3>
            <p>${animal.description}</p>
            <p><a href="animalProfile.jsp?animalId=${animal.id}">Ver Perfil</a></p>
        </div>
    </c:forEach>
</div>
</body>
</html>
