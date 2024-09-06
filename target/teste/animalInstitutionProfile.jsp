<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Perfil do Animal - Instituição</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/animalProfileInstitution.css">
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
                <a href="home.jsp" class="nav-link">Inicio</a>
            </li>
            <li class="nav-item">
                <a href="userLogin.jsp" class="nav-link">Quero adotar</a>
            </li>
            <li class="nav-item">
                <a href="institutionLogin.jsp" class="nav-link">Faça Parte</a>
            </li>
            <li class="nav-item">
                <a href="contato.jsp" class="nav-link">Contato</a>
            </li>
        </ul>
    </div>
</nav>

<div class="cadastro-container">
    <form action="ControllerServlet?action=addAnimalProfile" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>Perfil do Animal - Instituição</legend>
            <div class="inputBox">
                <label for="name">Nome do Animal:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="inputBox">
                <label for="description">Descrição:</label>
                <textarea id="description" name="description" rows="3" required></textarea>
            </div>
            <div class="inputBox">
                <label for="gender">Gênero:</label>
                <select id="gender" name="gender" required>
                    <option value="" disabled selected>Selecione</option>
                    <option value="MASCULINO">Masculino</option>
                    <option value="FEMININO">Feminino</option>
                </select>
            </div>
            <div class="inputBox">
                <label for="birth_date">Data de Nascimento:</label>
                <input type="date" id="birth_date" name="birth_date" required>
            </div>
            <div class="inputBox">
                <label for="type">Tipo:</label>
                <select id="type" name="type" required>
                    <option value="" disabled selected>Selecione</option>
                    <option value="CACHORRO">Cachorro</option>
                    <option value="GATO">Gato</option>
                    <option value="ROEDOR">Roedor</option>
                    <option value="PEIXE">Peixe</option>
                </select>
            </div>
            <div class="inputBox">
                <label for="photo">Foto do Animal:</label>
                <input type="file" id="photo" name="photo" required>
            </div>

            <div class="d-flex justify-content-between mt-4">
                <!-- Botão Salvar Perfil -->
                <button type="submit" class="btn btn-success">Salvar Perfil</button>

                <!-- Botão Cancelar -->
                <a href="institutionAnimalList.jsp" class="btn btn-secondary">Cancelar</a>

                <!-- Botão Eliminar Animal -->
                <button type="button" class="btn btn-danger" onclick="deleteAnimal(${animal.id})">Eliminar Animal</button>
            </div>
        </fieldset>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/animalProfile.js"></script>
</body>
</html>