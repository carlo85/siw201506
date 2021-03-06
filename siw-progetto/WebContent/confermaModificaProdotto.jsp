<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ page import="it.uniroma3.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="/siw-progetto/stile.css" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modifica - conferma?</title>
</head>
<body>
	<p>Sei sicuro di voler procedere alla modifica?</p>
	<div id="content">
		<f:view>
			<h1>
				<b>${gestioneProdotto.prodotto.id}</b>
			</h1>
			<p>
				<b>Descrizione:</b>
				<c:choose>
					<c:when test="${gestioneProdotto.descrizione != ''}">${gestioneProdotto.descrizione}</c:when>
					<c:otherwise>${gestioneProdotto.prodotto.descrizione} (invariato)</c:otherwise>
				</c:choose>
			</p>
			<p>
				<b>Prezzo:</b>
				<c:choose>
					<c:when test="${gestioneProdotto.prezzo != 0}">${gestioneProdotto.prezzo}</c:when>
					<c:otherwise>${gestioneProdotto.prodotto.prezzo} (invariato)</c:otherwise>
				</c:choose>
			</p>
			<h:form>
				<h:commandButton value="Modifica"
					action="#{gestioneProdotto.confermaModificaProdotto}" />
			</h:form>
		</f:view>
	</div>
	<p>
		<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
			principale</a>
	</p>
</body>
</html>