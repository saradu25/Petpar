<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetPar - Adotante</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/dashboards.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">PetPar - Adotante</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a href="animalRegister.jsp" class="nav-link" >Meus processos</a>
            </li>
            <li class="nav-item">
                <a href="animalList.jsp" class="nav-link">Ver lista de animais disponíveis</a>
            </li>
            <li class="nav-item">
                <a href="donations.jsp" class="nav-link" href="#">Instituições</a>
            </li>
            <li class="nav-item">
                <a href="userDonation.jsp" class="nav-link" href="#">Fazer doação</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container-fluid vh-100 d-flex align-items-center justify-content-center bg-custom">
    <div class="row w-100">
        <div class="col-md-6 d-flex justify-content-center align-items-center">
            <img src="img/PAR.png" alt="Pets" class="img-fluid pets-image">
        </div>
        <div class="col-md-6 d-flex flex-column justify-content-center align-items-center text-white">
            <h1 class="display-3 font-weight-bold">PetPar</h1>
            <p class="lead">Gerencie a sua adoção aqui!</p>
        </div>
    </div>
</div>

</body>
</html>
