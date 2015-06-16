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
<title>Modifica utente</title>
</head>
<body>
	<div id="form">
		<f:view>
			<h:form>
				<h1>
					<b>${controlloUtente.utente.nomeUtente}</b>
				</h1>
				<table>
					<tr>
						<td>Vecchia parola chiave:</td>
						<td><h:inputSecret value="#{controlloUtente.parolaChiave}"
								required="true" requiredMessage=" Campo obbligatorio"
								id="parolaChiave" /></td>
						<td><h:message for="parolaChiave" styleClass="error" /></td>
					</tr>
					<tr>
						<td>Nuova parola chiave:</td>
						<td><h:inputSecret
								value="#{controlloUtente.nuovaParolaChiave}" required="false"
								validatorMessage=" Deve contenere almeno 6 caratteri"
								id="nuovaParolaChiave">
								<f:validateRegex pattern="^$|.{6,}" />
							</h:inputSecret></td>
						<td><h:message for="nuovaParolaChiave" styleClass="error" /></td>
					</tr>
					<tr>
						<td>Indirizzo:</td>
						<td><h:inputText value="#{controlloUtente.indirizzo}"
								required="false" id="indirizzo" /></td>
						<td></td>
					</tr>
					<tr>
						<td>Posta elettronica:</td>
						<td><h:inputText value="#{controlloUtente.postaElettronica}"
								required="false" validatorMessage=" Formato non valido"
								id="postaElettronica">
								<f:validateRegex
									pattern="^$|[\w\.-]*[a-zA-Z0-9_]@[\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]" />
							</h:inputText></td>
						<td><h:message for="postaElettronica" styleClass="error" /></td>
					</tr>
				</table>
				<br />
				<div>
					<h:commandButton value="Modifica"
						action="#{controlloUtente.modificaUtente}" />
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