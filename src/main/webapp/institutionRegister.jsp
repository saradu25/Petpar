<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Instituição</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/cadastro.css">
    <!-- gambiarra para não zoar o description no formulario -->
    <style>
        input, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #BF793B;
            border-radius: 5px;
            font-size: 1rem;
            color: #333;
        }
    </style>
</head>
<body>
<div class="cadastro-container">
    <form action="ControllerServlet" method="post">
        <fieldset>
            <legend>Cadastro de Instituição</legend>

            <div class="inputBox">
                <label for="name">Nome da Instituição:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="inputBox">
                <label for="description">Descrição:</label>
                <textarea id="description" name="description" rows="4" required></textarea>
            </div>

            <div class="inputBox">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="inputBox">
                <label for="password">Senha:</label>
                <input type="password" id="texPassword" name="texPassword" required>
            </div>

            <div class="inputBox">
                <label for="cpfCnpj">CPF ou CNPJ:</label>
                <input type="text" id="cpfCnpj" name="cpfCnpj" required>
            </div>

            <div class="inputBox">
                <label for="phone_number">Número de Telefone:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" required>
            </div>

            <button type="submit" name="action" value="addInstitution">Cadastrar</button>
        </fieldset>
    </form>
    <p>Já tem uma conta? <a href="LoginInstitution.jsp">Faça login</a></p>
</div>
</body>
</html>
