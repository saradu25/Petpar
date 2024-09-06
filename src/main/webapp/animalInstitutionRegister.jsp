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
            <legend>Cadastro de Pet</legend>
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
