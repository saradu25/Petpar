<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Home - PetPar</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<h1>Bem-vindo a PetPar</h1>
<c:if test="${not empty sessionScope.user}">
    <p>Hola, ${sessionScope.user.name}! Bem-vindo de novo.</p>
</c:if>
<c:choose>
    <c:when test="${sessionScope.userType == 'adopter'}">
        <p>Explora os animais disponiveis para adoção.</p>
    </c:when>
    <c:when test="${sessionScope.userType == 'organization'}">
        <p>Administra os animais y adoções.</p>
    </c:when>
    <c:otherwise>
        <p>Por favor, <a href="login.jsp">iniciar sessão</a> para continuar.</p>
    </c:otherwise>
</c:choose>
</body>
</html>