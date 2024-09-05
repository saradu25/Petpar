<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - PetPar</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
</head>
<body class="bg-custom d-flex justify-content-center align-items-center">
<div class="login-container shadow-lg p-5 rounded">
    <header class="mb-4 text-center">
        <h2 class="text-white">Login</h2>
    </header>
    <form action="ControllerServlet" method="post">

        <div class="inputBox">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="inputBox">
            <label for="password">Senha:</label>
            <input type="password" id="texPassword" name="texPassword" required>
        </div>

        <button type="submit" class="btn btn-adopt w-100" name="action" value="userLogin">Entrar</button>
    </form>
    <div class="text-center mt-3">
        <p class="text-white">Não tem conta? <a href="paginaRecebimento.jsp" class="text-white">Cadastre-se aqui</a></p>
        <p><a href="#" class="text-white">Esqueceu sua senha?</a></p>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
