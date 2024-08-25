<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Login - PetPar</title>
    <link rel="stylesheet" href="css/x.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="login-container">
    <header>
        <h2>Login</h2>
    </header>
    <br></br>

    <form action="ControllerServlet?action=login" method="post" class="login-form">
        <div class="form-group">
            <label for="email">E-mail:</label>
            <input type="email" id="email" name="email" required>
        </div>

        <br></br>

        <div class="form-group">
            <label for="password">Senha:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <br></br>
        <button type="submit">Entrar</button>
    </form>
    <p>Não tem conta? <a href="login.jsp">Cadastre-se aqui</a></p>
    <p><a href="#">Esqueceu sua senha?</a></p>
</div>
</body>
</html>
