<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Animais para Adoção - PetPar</title>
</head>
<body>
<h2>Animais para Adoção</h2>
<div>
    <c:forEach var="animal" items="${animals}">
        <div>
            <img src="${animal.imageUrl}" alt="Foto do ${animal.name}" style="width:100px; height:100px;">
            <h3>${animal.name}</h3>
            <p>${animal.description}</p>
            <p><a href="animalProfile.jsp?animalId=${animal.id}">Ver Perfil</a></p>
        </div>
    </c:forEach>
</div>
</body>
</html>
