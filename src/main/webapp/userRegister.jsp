<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Adotante</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/cadastro.css">
</head>
<body>
<div class="cadastro-container">
    <form action="ControllerServlet" method="post">
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
    <p>Já tem uma conta? <a href="LoginUsuario.jsp">Faça login</a></p>
</div>
</body>
</html>
