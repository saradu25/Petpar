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
                        <a href="institutionAnimalList.jsp" class="nav-link" href="#">Lista de Pets</a>
                    </li>
                    <li class="nav-item">
                        <a href="institutionAnimalRegister.jsp" class="nav-link" href="#">Cadastro de Pets</a>
                    </li>
                    <li class="nav-item">
                        <a href="donationInstitutionList.jsp" class="nav-link" href="#">Lista de doações</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ControllerServlet?action=logout" >Logout</a>
                    </li>
                </ul>
            </div>
    </nav>


<div class="cadastro-container">
    <form action="ControllerServlet" method="post">
        <fieldset>
            <legend>Perfil do Animal - Instituição</legend>
            <div class="inputBox">
                <label for="name">Nome do Animal:</label>
                <input type="text" id="name" name="name" value="${animal.name}" required>
            </div>
            <div class="inputBox">
                <label for="description">Descrição:</label>
                <textarea id="description" name="description" rows="3" required>${animal.description}</textarea>
            </div>
            <div class="inputBox">
                <label for="statusAdoption">Gênero:</label>
                <select id="statusAdoption" name="statusAdoption"  required>
                    <option value="${animal.statusAdoption}" selected>${animal.statusAdoption}</option>
                    <option value="IN_PROGRESS">Diponivel</option>
                    <option value="PENDING">Pendente</option>
                    <option value="DONE">Adotado</option>
                </select>
            </div>
            <div class="inputBox">
                <label for="gender">Gênero:</label>
                <select id="gender" name="gender"  required>
                    <option value="${animal.gender}" selected>${animal.gender}</option>
                    <option value="MASCULINO">Masculino</option>
                    <option value="FEMININO">Feminino</option>
                </select>
            </div>
            <div class="inputBox">
                <label for="birth_date" >Data de Nascimento:</label>
                <input type="date" id="birthDate" name="birthDate" value="${animal.birthDate}" required>
            </div>
            <div class="inputBox">
                <label for="type">Tipo:</label>
                <select id="type" name="type" value="${animal.type}" required>
                    <option value="${animal.type}" selected>${animal.type}</option>
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
                <input type="hidden" name="id" id="id" value="${animal.id}">
                <input type="hidden" name="user" id="user" value="${animal.user.id}">
                <input type="hidden" name="institution" id="institution" value="${animal.institution.id}">
                <!-- Botão Salvar Perfil -->
                <button type="submit" class="btn btn-success" name="action" value="animalUpdate">Salvar</button>

                <!-- Botão Cancelar -->
                <a href="institutionAnimalList.jsp" class="btn btn-secondary">Cancelar</a>

                <!-- Botão Eliminar Animal -->
                <button type="submit" class="btn btn-danger" name="action" value="animalDelete">Deletar</button>
            </div>
        </fieldset>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/animalProfile.js"></script>
</body>
</html>