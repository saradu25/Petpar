<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Perfil do Animal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/animalProfileUser.css">
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
               <a href="userAnimalList.jsp" class="nav-link">Lista de Pets</a>
           </li>
           <li class="nav-item">
               <a href="animalUserProfile.jsp" class="nav-link">Andamento da adoção</a>
           </li>
           <li class="nav-item">
               <a href="ControllerServlet?action=institutionList" class="nav-link" href="#">Faça uma doação!</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="ControllerServlet?action=logout" >Logout</a>
           </li>
       </ul>
    </div>
</nav>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg">
                <div class="card-header bg-custom-header text-white text-center">
                    <h3>${animal.name}</h3>
                </div>
                <div class="card-body bg-custom-body">
                    <div class="text-center mb-4">
                        <img src="img/animal_image.jpg" alt="Foto do Animal" class="img-fluid rounded">
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item">Nome: ${animal.name}</li>
                        <li class="list-group-item">Descrição: ${animal.description}</li>
                        <li class="list-group-item">Gênero: ${animal.gender}</li>
                        <li class="list-group-item">Data de Nascimento: ${animal.birthDate}</li>
                        <li class="list-group-item">Tipo: ${animal.type}</li>
                    </ul>
                    <form action="ControllerServlet" method="post" id="form1" class="mt-4">
                        <input type="hidden" name="id" id="id" value="${animal.id}">
                        <button type="submit" class="btn btn-custom w-100" name="action" value="userAdoption">Solicitar Adoção</button>
                    </form>
                    <br></br>
                    <a href="userAnimalList.jsp" class="btn btn-custom w-100">Voltar</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
