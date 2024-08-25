<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetPar - Encontre seu novo amigo</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/x.css">
</head>
<body>
<!-- NavBar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">PetPar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Adotar</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">ONG/Instituciones</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Donations</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contato</a>
            </li>
        </ul>
    </div>
</nav>

<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/bannerAdotar.png" class="d-block w-100" alt="Adotar">
        </div>
        <div class="carousel-item">
            <img src="img/adotar.png" class="d-block w-100" alt="BLA">
        </div>
        <div class="carousel-item">
            <img src="img/PAR.png" class="d-block w-100" alt="BLA">
        </div>
    </div>
</div>


<!-- Conteúdo Principal -->
<div class="container-fluid vh-100 d-flex align-items-center justify-content-center bg-custom">
    <div class="row w-100">
        <div class="col-md-6 d-flex justify-content-center align-items-center">
            <img src="img/PAR.png" alt="Pets" class="img-fluid pets-image">
        </div>
        <div class="col-md-6 d-flex flex-column justify-content-center align-items-center text-white">
            <h1 class="display-3 font-weight-bold">PetPar</h1>
            <p class="lead">Encontre seu novo amigo aqui!</p>
            <div class="btn-container">
                <a href="userRegister.jsp" class="btn btn-adopt btn-lg mb-3 btn-custom">Quero adotar</a>
                <a href="institutionRegister.jsp" class="btn btn-institution btn-lg btn-custom">Instituição</a>
            </div>
        </div>
    </div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
