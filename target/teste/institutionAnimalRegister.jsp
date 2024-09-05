<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Animal</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/cadastro.css">
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
                <a href="institutionAnimalList.jsp" class="nav-link">Lista de Pets</a>
            </li>
            <li class="nav-item">
                <a href="institutionAnimalRegister.jsp" class="nav-link">Cadastro de Pets</a>
            </li>
            <li class="nav-item">
                <a href="donationInstitutionList.jsp" class="nav-link">Lista de doações</a>
            </li>
            <li class="nav-item">
                <a action="ControllerServlet" method="post"  value="logout"class="nav-link">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<div class="cadastro-container">
    <form action="ControllerServlet" method="post">
        <fieldset>
            <legend>Cadastro de Animal</legend>
            <div class="inputBox">
                <label for="nome">Nome:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="inputBox">
                <label for="description">Descrição:</label>
                <input type="description" id="description" name="description" required>
            </div>
            <div class="inputBox">
                <label for="birthDate">Data de Nascimento:</label>
                <input type="date" id="birthDate" name="birthDate" required>
            </div>
            <div class="inputBox">
                <label for="genero">Espécie:</label>
                <select id="type" name="type" required>
                    <option value="" disabled selected>Selecione</option>
                    <option value="CACHORRO">Cachorro</option>
                    <option value="GATO">Gato</option>
                    <option value="ROEDOR">Roedor</option>
                    <option value="PEIXE">Peixe</option>
                    <option value="OUTRO">Outro</option>
                </select>
            </div>
            <div class="inputBox">
                <label for="genero">Gênero:</label>
                <select id="genero" name="gender" required>
                    <option value="" disabled selected>Selecione</option>
                    <option value="MASCULINO">Masculino</option>
                    <option value="FEMININO">Feminino</option>
                    <option value="OUTRO">Outro</option>
                </select>
            </div>
            <button type="submit" name="action" value="addAnimal">Cadastrar</button>
        </fieldset>
    </form>
</div>
</body>
</html>
