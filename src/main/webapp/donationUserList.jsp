<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.List,br.edu.ifsp.arq.ads.petpar.model.entities.Animal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Animais para Adoção - PetPar</title>
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
                <a href="userAnimalList.jsp" class="nav-link" href="#">Lista de Pets</a>
            </li>
            <li class="nav-item">
                <a href="animalUserProfile.jsp" class="nav-link" href="#">Andamento da adoção</a>
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
			<div class="col-12">
				<h1 class="text-center">Instituições que voce pode doar</h1>
			</div>
            <fieldset>
                <legend>Login Adotante</legend>
                <c:choose>
                    <c:when test="${fn:length(institutionList) > 0}">
                        <table class="table table-responsive table-striped table-hover" >
                            <tr>
                                <th>#</th>
                                <th>Nome</th>
                                <th>CPF/CNPJ</th>
                                <th>Número de telefone</th>
                                <th>E-mail</th>
                            </tr>
                            <c:forEach var="institution" items="${institutionList}" varStatus="index">
                                <tr>
                                    <td>${index.count}</td>
                                    <td>${institution.name}</td>
                                    <td>${institution.cpfOrCnpj}</td>
                                    <td>${institution.phoneNumber}</td>
                                    <td>${institution.email}</td>

                                    <td>
                                        <span data-bs-toggle="tooltip" data-bs-placement="top" title="Doar">
                                            <a class="btn" href="ControllerServlet?action=initDonation&id=${institution.id}">
                                                <img src="img/N/A.svg" alt="Doar">
                                            </a>
                                        </span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <c:out value="Sem nenhuma instituição registrada."></c:out>
                    </c:otherwise>
                </c:choose>
			</fieldset>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/home.js"></script>
</body>
</html>
