<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doação - PetPar</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/cadastro.css">
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="home.jsp">PetPar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a href="userAnimalList.jsp" class="nav-link">Lista de Pets</a>
            </li>
            <li class="nav-item">
                <a href="userAnimalAdoption.jsp" class="nav-link">Andamento da adoção</a>
            </li>
            <li class="nav-item">
                <a href="ControllerServlet?action=institutionList" class="nav-link" href="#">Faça uma doação!</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ControllerServlet?action=logout" >Logout</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="center col-lg-10 col-sm-12">
        <form action="ControllerServlet" method="post">
            <fieldset>
                <legend>Contribua</legend>
                <div class="mb-4">
                    <label for="valor" class="form-label">Valor da Doação</label>
                    <input type="number" step="0.01" class="form-control form-control-lg" id="valor" name="amount" placeholder="R$ 0,00" required>
                </div>

                <div class="mb-4">
                    <label class="form-label">Escolha uma opção de pagamento</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="cartaoCredito" value="CARTAO" checked>
                        <label class="form-check-label" for="cartaoCredito">Cartão de Crédito</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="qrCode" value="PIX">
                        <label class="form-check-label" for="pix">QR Code (Pix/Transferência)</label>
                    </div>
                </div>

                <!-- Campos de cartão de crédito -->
                <div id="cartaoContainer">
                    <div class="mb-3">
                        <label for="nomeCartao" class="form-label">Nome no Cartão</label>
                        <input type="text" class="form-control form-control-lg" id="nomeCartao" name="cardName" placeholder="Nome completo no cartão">
                    </div>
                    <div class="mb-3">
                        <label for="numeroCartao" class="form-label">Número do Cartão</label>
                        <input type="text" class="form-control form-control-lg" id="numeroCartao" name="cardNumber" placeholder="Número do cartão">
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="validadeCartao" class="form-label">Validade</label>
                            <input type="text" class="form-control form-control-lg" id="validadeCartao" name="cardExpiry" placeholder="MM/AA">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="cvv" class="form-label">CVV</label>
                            <input type="text" class="form-control form-control-lg" id="cvv" name="cardCVV" placeholder="CVV">
                        </div>
                    </div>
                </div>

                <!-- QR code -->
                <div id="qrCodeContainer" class="mt-3" style="display: none;">
                    <p>Use o QR Code abaixo para fazer uma transferência via Pix ou outro método compatível:</p>
                    <img src="img/QR.png" alt="QR Code" class="img-fluid rounded mx-auto d-block" style="max-width: 200px;">
                </div>

                <button type="submit" name="action" value="userDonate">Doar Agora</button>
            </fieldset>
        </form>
    </div>
</div>
</div>

<script>
    // Alterna entre a exibição dos campos de cartão de crédito e QR Code
    document.getElementById('cartaoCredito').addEventListener('click', function () {
        document.getElementById('cartaoContainer').style.display = 'block';
        document.getElementById('qrCodeContainer').style.display = 'none';
    });

    document.getElementById('qrCode').addEventListener('click', function () {
        document.getElementById('cartaoContainer').style.display = 'none';
        document.getElementById('qrCodeContainer').style.display = 'block';
    });
</script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
