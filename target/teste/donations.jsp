<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doações - PetPar</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/donations.css">
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
                <a href="paginaRecebimento.jsp" class="nav-link" href="#">Inicio</a>
            </li>
            <li class="nav-item">
                <a href="animalList.jsp" class="nav-link" href="#">Quero adotar</a>
            </li>
            <li class="nav-item">
                <a href="donations.jsp" class="nav-link" href="#">Como ajudar?</a>
            </li>
            <li class="nav-item">
                <a href="contato.jsp" class="nav-link" href="#">Contato</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="text-center mb-5">
        <h1 class="display-4">Ajude ONGs e Instituições da Causa Animal</h1>
        <p class="lead">Contribua para fazer a diferença na vida de muitos animais!</p>
    </div>
    <br></br>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

        <div class="col">
            <div class="card h-100">
                <img src="img/Santuario.png" class="card-img-top" alt="ONG 1">
                <div class="card-body">
                    <h5 class="card-title">Santuário Luz dos Bichos</h5>
                    <p class="card-text">Nossa missão é resgatar, cuidar e encontrar um lar para animais abandonados.</p>
                </div>
                <div class="card-footer text-center">
                    <a href="https://luzdosbichos.com.br/#ajude" class="btn btn-custom">Doe Agora</a>
                </div>
            </div>
        </div>

        <br></br>
        <!-- Card ONG 2 -->
        <div class="col">
            <div class="card h-100">
                <img src="img/proanimal.png" class="card-img-top" alt="ONG 2">
                <div class="card-body">
                    <h5 class="card-title">Grupo ProAnimal</h5>
                    <p class="card-text">Somos uma ONG focada no cuidado e proteção animal.</p>
                </div>
                <div class="card-footer text-center">
                    <a href="https://www.grupoproanimal.com.br/" class="btn btn-custom">Doe Agora</a>
                </div>
            </div>
        </div>

        <br></br>

        <!-- Card ONG 3 -->
        <div class="col">
            <div class="card h-100">
                <img src="img/patrulha.jpg" class="card-img-top" alt="ONG 3">
                <div class="card-body">
                    <h5 class="card-title">Patrulha Animal</h5>
                    <p class="card-text">Grupo de Adoção Responsável da cidade de São Carlos/SP.</p>
                </div>
                <div class="card-footer text-center">
                    <a href="https://www.facebook.com/patrulhaanimalsaocarlos/?locale=pt_BR" class="btn btn-custom">Doe Agora</a>
                </div>
            </div>
        </div>

        <br></br>

        <div class="col">
            <div class="card h-100">
                <img src="img/amigos.png" class="card-img-top" alt="ONG 3">
                <div class="card-body">
                    <h5 class="card-title">Amigos salvado Amigos</h5>
                    <p class="card-text">A ONG Amigos Salvando Amigos - ASA é uma organização sem fins lucrativos que promove o controle da reprodução de cães e gatos por meio de mutirões de esterilização cirúrgica, além de programas de educação em saúde e guarda responsável.</p>
                </div>
                <div class="card-footer text-center">
                    <a href="https://ongasa.wordpress.com/como-ajudar/" class="btn btn-custom">Doe Agora</a>
                </div>
            </div>
        </div>

    </div>
</div>

< -- Usar UserDonateHelper para fazer doação desde a nossa pagina mesmo -- >


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
