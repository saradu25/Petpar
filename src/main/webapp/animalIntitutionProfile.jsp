<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil do Animal - Instituição</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/animalProfile.css">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg">
                <div class="card-header text-center bg-custom-header text-white">
                    <h4>Perfil do Animal - Instituição</h4>
                </div>
                <div class="card-body">
                    <form action="ControllerServlet?action=addAnimalProfile" method="post" enctype="multipart/form-data">
                        <!-- Campo para Nome do Animal -->
                        <div class="mb-3">
                            <label for="name" class="form-label">Nome do Animal</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <!-- Campo para Descrição -->
                        <div class="mb-3">
                            <label for="description" class="form-label">Descrição</label>
                            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                        </div>

                        <!-- Campo para Gênero -->
                        <div class="mb-3">
                            <label for="gender" class="form-label">Gênero</label>
                            <select class="form-select" id="gender" name="gender" required>
                                <option value="MASCULINO">Masculino</option>
                                <option value="FEMININO">Feminino</option>
                            </select>
                        </div>

                        <!-- Campo para Data de Nascimento -->
                        <div class="mb-3">
                            <label for="birth_date" class="form-label">Data de Nascimento</label>
                            <input type="date" class="form-control" id="birth_date" name="birth_date" required>
                        </div>

                        <!-- Campo para Tipo de Animal -->
                        <div class="mb-3">
                            <label for="type" class="form-label">Tipo</label>
                            <select class="form-select" id="type" name="type" required>
                                <option value="CACHORRO">Cachorro</option>
                                <option value="GATO">Gato</option>
                                <option value="ROEDOR">Roedor</option>
                                <option value="PEIXE">Peixe</option>
                            </select>
                        </div>

                        <!-- Upload de Imagem -->
                        <div class="mb-3">
                            <label for="photo" class="form-label">Foto do Animal</label>
                            <input type="file" class="form-control" id="photo" name="photo" required>
                        </div>

                        <button type="submit" class="btn btn-custom w-100 mt-4">Salvar Perfil</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
