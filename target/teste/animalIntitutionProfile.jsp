<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Perfil do Animal - PetPar</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
<h2>Perfil do Animal</h2>
<div>
    <img src="${animal.imageUrl}" alt="Foto do ${animal.name}">
    <h3>${animal.name}</h3>
    <p>Descrição: ${animal.description}</p>
    <p>Idade: ${animal.age} anos</p>
    <p>Sexo: ${animal.gender}</p>
    <p><a href="adoptionForm.jsp?animalId=${animal.id}">Adotar</a></p>
</div>
</body>
</html>
