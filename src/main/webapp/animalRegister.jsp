<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Animal</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
    <form action="CadastroAnimalServlet" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>Cadastro de Animal</legend>
            <div class="inputBox">
                <label for="name">Nome:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="inputBox">
                <label for="description">Descrição:</label>
                <textarea id="description" name="description" rows="4" required></textarea>
            </div>
            <div class="inputBox">
                <label for="img">Imagem:</label>
                <input type="file" id="img" name="img" accept="image/*" required>
            </div>
            <div class="inputBox">
                <label for="gender">Gênero:</label>
                <select id="gender" name="gender" required>
                    <option value="" disabled selected>Selecione</option>
                    <option value="masculino">Masculino</option>
                    <option value="feminino">Feminino</option>
                </select>
            </div>
            <div class="inputBox">
                <label for="birth_date">Data de Nascimento:</label>
                <input type="date" id="birth_date" name="birth_date" required>
            </div>
            <div class="inputBox">
                <label for="type">Tipo:</label>
                <input type="text" id="type" name="type" required>
            </div>
            <div class="inputBox">
                <label for="postedAt">Data de Publicação:</label>
                <input type="date" id="postedAt" name="postedAt" required>
            </div>
            <button type="submit">Cadastrar Animal</button>
        </fieldset>
    </form>
</div>
</body>
</html>
