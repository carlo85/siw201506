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
<title>Ricerca utente</title>
</head>
<body>
	<div class="centered">
		<h1>Cerca utente</h1>
	</div>
	<div id="form">
		<f:view>
			<h:form>
				<table>
					<tr>
						<td>Nome utente:</td>
						<td><h:inputText value="#{gestioneUtente.nomeUtente}"
								required="true" requiredMessage=" Campo obbligatorio"
								id="nomeUtente" /></td>
						<td><h:message for="nomeUtente" styleClass="error" /></td>
					</tr>
				</table>
				<br />
				<div class="centered">
					<h:commandButton value="Ricerca"
						action="#{gestioneUtente.ricercaUtente}" />
				</div>
			</h:form>
		</f:view>
	</div>
	<p>
		<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
			principale</a>
	</p>
</body>
</html>