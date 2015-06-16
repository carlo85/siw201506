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
<title>Modifica prodotto</title>
</head>
<body>
	<div id="form">
		<f:view>
			<h:form>
				<h1>
					<b>${gestioneProdotto.prodotto.id}</b>
				</h1>
				<table>
					<tr>
						<td>Nome:</td>
						<td>${gestioneProdotto.prodotto.nome}</td>
						<td></td>
					</tr>
					<tr>
						<td>Codice:</td>
						<td>${gestioneProdotto.prodotto.codice}</td>
						<td></td>
					</tr>
					<tr>
						<td>Descrizione:</td>
						<td><h:inputText value="#{gestioneProdotto.descrizione}"
								required="false" id="descrizione" /></td>
						<td></td>
					</tr>
					<tr>
						<td>Prezzo:</td>
						<td><h:inputText value="#{gestioneProdotto.prezzo}"
								required="false" converterMessage=" Deve essere un numero"
								validatorMessage=" Deve essere un numero positivo" id="prezzo">
								<f:validateDoubleRange minimum="0" />
							</h:inputText></td>
						<td><h:message for="prezzo" styleClass="error" /></td>
					</tr>
				</table>
				<br />
				<div>
					<h:commandButton value="Modifica"
						action="#{gestioneProdotto.modificaProdotto}" />
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