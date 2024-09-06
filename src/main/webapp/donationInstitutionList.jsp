<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<div class="lis-container">
		<div>
            <fieldset>
                <legend>Doações Recebidas</legend>
                <form action="ControllerServlet" method="post">
                    <div class="row">
                        <div class="col-12 col-lg-3">
                            <div class="mb-2">
                                <label for="initial-date">Data inicial</label>
                                <input type="date" name="initial-date" id="initial-date"
                                    class="form-control">
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="mb-2">
                                <label for="final-date">Data final</label>
                                <input type="date" name="final-date" id="final-date"
                                    class="form-control">
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 mt-4">
                            <button type="submit" class="btn btn-primary" name="action" value="institutionDonation">Filtrar</button>
                        </div>
                    </div>
                </form>
            </fieldset>
        <c:choose>
            <c:when test="${fn:length(institutionDonation) > 0}">
                <table class="table table-responsive table-striped table-hover" >
                    <tr>
                        <th>#</th>
                        <th>Valor </th>
                        <th>Nome do doador</th>
                        <th>Data</th>
                    </tr>
                    <c:forEach var="institution" items="${institutionDonation}" varStatus="index">
                        <tr>
                            <td>${index.count}</td>
                            <td>${institution.amount}</td>
                            <td>${institution.user.name}</td>
                            <td>
                                <fmt:parseDate value="${institution.data}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
                                <fmt:formatDate value="${parsedDate}" var="newParsedDate" type="date" pattern="dd/MM/yyyy" />
                                ${newParsedDate}
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <c:out value="Sem nenhuma doação."></c:out>
            </c:otherwise>
        </c:choose>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/home.js"></script>
</body>
</html>
