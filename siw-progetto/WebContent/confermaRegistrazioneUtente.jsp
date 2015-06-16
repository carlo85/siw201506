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
<title>Registrazione - conferma?</title>
</head>
<body>
	<p>Sei sicuro di voler procedere alla registrazione?</p>
	<div id="content">
		<f:view>
			<h1>
				<b>${registrazioneUtente.nomeUtente}</b>
			</h1>
			<p>
				<b>Nome:</b> ${registrazioneUtente.nome}
			</p>
			<p>
				<b>Cognome:</b> ${registrazioneUtente.cognome}
			</p>
			<p>
				<b>Data di nascita:</b> ${registrazioneUtente.dataNascita}
			</p>
			<p>
				<b>Indirizzo:</b> ${registrazioneUtente.indirizzo}
			</p>
			<p>
				<b>Posta elettronica:</b> ${registrazioneUtente.postaElettronica}
			</p>
			<h:form>
				<h:commandButton value="Registra"
					action="#{registrazioneUtente.confermaRegistrazioneUtente}" />
			</h:form>
		</f:view>
	</div>
	<p>
		<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
			principale</a>
	</p>
</body>
</html>