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

	<div class="container">
		<div class="list-container" >
			<fieldset>
                <legend>Pets em Adoção</legend>
                <form action="ControllerServlet" method="post">
                    <div class="row">
                        <div class="col-12 col-lg-3">
                            <div class="mb-2">
                                <label for="type">Tipo</label>
                                <select class="form-select"
                                    name="statusAdoption" id="statusAdoption">
                                    <option value="" disabled selected>Selecione</option>
                                    <option value="IN_PROGRESS">IN_PROGRESS</option>
                                    <option value="PENDING">PENDING</option>
                                    <option value="DONE">DONE</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="mb-2">
                                <label for="type">Specie</label>
                                <select class="form-select"
                                    name="status" id="status">
                                    <option value="" disabled selected>Selecione:</option>
                                    <option value="CACHORRO">Cachorro</option>
                                    <option value="GATO">Gato</option>
                                    <option value="ROEDOR">Roedor</option>
                                    <option value="PEIXE">Peixe</option>
                                    <option value="OUTRO">Outro</option>
                                </select>
                            </div>
                        </div>
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
                            <button type="submit" class="btn btn-primary" name="action" value="institutionAnimals">Filtrar</button>
                        </div>
                    </div>
                </form>
            </fieldset>
			<c:choose>
				<c:when test="${fn:length(institutionFilteredAnimals) > 0}">
					<table class="table table-responsive table-striped table-hover" >
						<tr>
							<th>#</th>
							<th>Especie</th>
							<th>Nome</th>
							<th>Genero</th>
							<th>Data de nascimento</th>
							<th>Disponivel para adoção desde</th>
							<th>Instituição</th>
						</tr>
						<c:forEach var="animal" items="${institutionFilteredAnimals}" varStatus="index">
							<tr>
								<td>${index.count}</td>
								<td>
									<c:choose>
										<c:when test="${animal.type == 'CACHORRO'}">
											<img src="img/N/A.png" alt="Cachorro">
										</c:when>
										<c:when test="${animal.type == 'GATO'}">
											<img src="img/N/A.png" alt="Gato">
										</c:when>
										<c:when test="${animal.type == 'ROEDOR'}">
											<img src="img/N/A.png" alt="Roedor">
										</c:when>
										<c:when test="${animal.type == 'PEIXE'}">
											<img src="img/N/A.png" alt="Peixe">
										</c:when>
										<c:when test="${animal.type == 'OUTRO'}">
                                            <img src="img/N/A.png" alt="Outro">
                                        </c:when>
									</c:choose>
								</td>

								<td>${animal.name}</td>
								<td>${animal.gender}</td>
								<td>
                                    <fmt:parseDate value="${animal.birthDate}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
                                    <fmt:formatDate value="${parsedDate}" var="newParsedDate" type="date" pattern="dd/MM/yyyy" />
                                    ${newParsedDate}
                                </td>
                                <td>
                                    <fmt:parseDate value="${animal.adoptedAt}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
                                    <fmt:formatDate value="${parsedDate}" var="newParsedDate" type="date" pattern="dd/MM/yyyy" />
                                    ${newParsedDate}
                                </td>
								<td>${animal.institution.name}</td>
								<td>
									<span data-bs-toggle="tooltip" data-bs-placement="top" title="Editar">
										<a class="btn" href="ControllerServlet?action=animalInstitutionProfile&id=${animal.id}">
	                						<img src="img/N/A.svg" alt="Editar">
	                					</a>
									</span>

                					<span data-bs-toggle="tooltip" data-bs-placement="top" title="Deletar">
                						<a class="btn" href="ControllerServlet?action=animalDelete&id=${animal.id}">
                                            <img src="img/N/A.svg" alt="Deletar">
                                        </a>
                					</span>

								</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<c:out value="Nenhum animal registrado."></c:out>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal" tabindex="-1" id="myModal">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Exclusão</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <p>Deseja adotar adotar esse PET?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
		        <button type="button" id="delete" class="btn btn-danger">Adotar!</button>
		      </div>
		    </div>
	  	</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/home.js"></script>
</body>
</html>
