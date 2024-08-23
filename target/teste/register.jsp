<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro</title>
    <link rel="stylesheet" href="css/teste.css">
    <script>
        function ajustarFormulario() {
            const tipo = new URLSearchParams(window.location.search).get('tipo');
            if (tipo === 'instituicao') {
                document.getElementById('campoCpf').style.display = 'none';
                document.getElementById('campoCnpj').style.display = 'block';
            } else {
                document.getElementById('campoCpf').style.display = 'block';
                document.getElementById('campoCnpj').style.display = 'none';
            }
        }

        window.onload = ajustarFormulario;
    </script>
</head>
<body>
<div class="cadastro-container">
    <form action="CadastroServlet" method="post">
        <fieldset>
            <legend><b>Cadastro de Usuário e Senha</b></legend>

            <input type="hidden" name="tipoUsuario" value="<%= request.getParameter("tipo") %>">

            <div id="campoCpf" class="inputBox">
                <label for="cpf" class="labelInput">CPF:</label>
                <input type="text" id="cpf" name="cpf" class="inputUser">
            </div>

            <div id="campoCnpj" class="inputBox" style="display: none;">
                <label for="cnpj" class="labelInput">CNPJ:</label>
                <input type="text" id="cnpj" name="cnpj" class="inputUser">
            </div>

            <div class="inputBox">
                <label for="nome" class="labelInput">Nome:</label>
                <input type="text" id="nome" name="name" class="inputUser" required>
            </div>

            <div class="inputBox">
                <label for="email" class="labelInput">Email:</label>
                <input type="email" id="email" name="email" class="inputUser" required>
            </div>

            <div class="inputBox">
                <label for="senha" class="labelInput">Senha:</label>
                <input type="password" id="senha" name="senha" class="inputUser" required>
            </div>

            <div class="inputBox">
                <label for="confirmPassword" class="labelInput">Confirmar senha:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="inputUser" required>
            </div>

            <button type="submit" id="submit">Cadastrar</button>
        </fieldset>
    </form>
    <p>Já tem uma conta? <a href="LoginUsuario.jsp">Faça login</a></p>
</div>
</body>
</html>
