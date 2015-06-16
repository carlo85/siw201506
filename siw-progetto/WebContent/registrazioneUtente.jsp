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
<title>Registrazione utente</title>
</head>
<body>
	<div class="centered">
		<h1>Registrazione utente</h1>
	</div>
	<div id="form">
		<f:view>
			<h:form>
				<table>
					<tr>
						<td>Nome utente:</td>
						<td><h:inputText value="#{registrazioneUtente.nomeUtente}"
								required="true" requiredMessage=" Campo obbligatorio"
								id="nomeUtente" /></td>
						<td><h:message for="nomeUtente" styleClass="error" /></td>
					</tr>
					<tr>
						<td>Parola chiave:</td>
						<td><h:inputSecret
								value="#{registrazioneUtente.parolaChiave}" required="true"
								requiredMessage=" Campo obbligatorio"
								validatorMessage=" Deve contenere almeno 6 caratteri"
								id="parolaChiave">
								<f:validateLength minimum="6" />
							</h:inputSecret></td>
						<td><h:message for="parolaChiave" styleClass="error" /></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><h:inputText value="#{registrazioneUtente.nome}"
								required="true" requiredMessage=" Campo obbligatorio" id="nome" /></td>
						<td><h:message for="nome" styleClass="error" /></td>
					</tr>
					<tr>
						<td>Cognome:</td>
						<td><h:inputText value="#{registrazioneUtente.cognome}"
								required="true" requiredMessage=" Campo obbligatorio"
								id="cognome" /></td>
						<td><h:message for="cognome" styleClass="error" /></td>
					</tr>
					<tr>
						<td>Data di nascita:</td>
						<td><h:inputText value="#{registrazioneUtente.dataNascita}"
								required="true" requiredMessage=" Campo obbligatorio"
								converterMessage=" Formato non valido" id="dataNascita">
								<f:convertDateTime pattern="dd-MM-yyyy" />
							</h:inputText></td>
						<td><h:message for="dataNascita" styleClass="error" /></td>
					</tr>
					<tr>
						<td>Indirizzo:</td>
						<td><h:inputText value="#{registrazioneUtente.indirizzo}"
								required="true" requiredMessage=" Campo obbligatorio"
								id="indirizzo" /></td>
						<td><h:message for="indirizzo" styleClass="error" /></td>
					</tr>
					<tr>
						<td>Posta elettronica:</td>
						<td><h:inputText
								value="#{registrazioneUtente.postaElettronica}" required="true"
								requiredMessage=" Campo obbligatorio"
								validatorMessage=" Formato non valido" id="postaElettronica">
								<f:validateRegex
									pattern="[\w\.-]*[a-zA-Z0-9_]@[\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]" />
							</h:inputText></td>
						<td><h:message for="postaElettronica" styleClass="error" /></td>
					</tr>
				</table>
				<br />
				<div class="centered">
					<h:commandButton value="Registra"
						action="#{registrazioneUtente.registrazioneUtente}" />
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