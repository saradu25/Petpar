<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Adotante</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/cadastro.css">
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
<div class="cadastro-container">
    <form action="ControllerServlet" method="post" id="registerForm">
        <fieldset>
            <legend>Cadastro de Adotante</legend>
            <div class="inputBox">
                <label for="nome">Nome:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="inputBox">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="inputBox">
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>
            </div>
            <div class="inputBox">
                <label for="dataNascimento">Data de Nascimento:</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" required>
            </div>
            <div class="inputBox">
                <label for="cpf">CPF:</label>
                <input type="text" id="cpf" name="cpf" required>
            </div>
            <div class="inputBox">
                <label for="telefone">Número de Telefone:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" required>
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
            <button type="submit" name="action" value="addUser">Cadastrar</button>
        </fieldset>
    </form>
    <p>Já tem uma conta? <a href="userLogin.jsp">Faça login</a></p>
</div>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/register.js"></script>
</body>
</html>
