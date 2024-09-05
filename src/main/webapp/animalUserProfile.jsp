<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil do Animal - Usuário</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/animalProfile.css">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg">
                <div class="card-header text-center bg-custom-header text-white">
                    <h4>Perfil do Animal</h4>
                </div>
                <div class="card-body">
                    <!-- Exibição das Informações do Animal -->
                    <div class="mb-3">
                        <label class="form-label">Nome</label>
                        <p class="form-control-static">${animal.name}</p>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Descrição</label>
                        <p class="form-control-static">${animal.description}</p>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Gênero</label>
                        <p class="form-control-static">${animal.gender}</p>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Data de Nascimento</label>
                        <p class="form-control-static">${animal.birth_date}</p>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Tipo</label>
                        <p class="form-control-static">${animal.type}</p>
                    </div>

                    <!-- Exibição da Imagem -->
                    <div class="mb-3">
                        <label class="form-label">Foto do Animal</label>
                        <img src="${animal.photo_url}" alt="Foto do Animal" class="img-fluid">
                    </div>

                    <a href="ControllerServlet?action=adoptAnimal&id=${animal.id}" class="btn btn-custom w-100 mt-4">Adotar</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
