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
<title>Inserimento prodotto</title>
</head>
<body>
	<div class="centered">
		<h1>Nuovo prodotto</h1>
	</div>
	<div id="form">
		<c:choose>
			<c:when
				test="${controlloUtente.utente.categoria == 'amministratore'}">
				<f:view>
					<h:form>
						<table>
							<tr>
								<td>Nome:</td>
								<td><h:inputText value="#{inserimentoProdotto.nome}"
										required="true" requiredMessage=" Campo obbligatorio"
										id="nome" /></td>
								<td><h:message for="nome" styleClass="error" /></td>
							</tr>
							<tr>
								<td>Codice:</td>
								<td><h:inputText value="#{inserimentoProdotto.codice}"
										required="true" requiredMessage=" Campo obbligatorio"
										id="codice">
									</h:inputText></td>
								<td><h:message for="codice" styleClass="error" /></td>
							</tr>
							<tr>
								<td>Descrizione:</td>
								<td><h:inputTextarea
										value="#{inserimentoProdotto.descrizione}" required="false"
										cols="20" rows="5" /></td>
								<td></td>
							</tr>
							<tr>
								<td>Prezzo:</td>
								<td><h:inputText value="#{inserimentoProdotto.prezzo}"
										required="true" requiredMessage=" Campo obbligatorio"
										converterMessage=" Deve essere un numero"
										validatorMessage=" Deve essere un numero positivo" id="prezzo">
										<f:validateDoubleRange minimum="0" />
									</h:inputText></td>
								<td><h:message for="prezzo" styleClass="error" /></td>
							</tr>
							<tr>
								<td>Quantità:</td>
								<td><h:inputText value="#{inserimentoProdotto.quantita}"
										required="false" converterMessage=" Deve essere un numero"
										validatorMessage=" Deve essere un numero positivo"
										id="quantita">
										<f:validateLongRange minimum="0" />
									</h:inputText></td>
								<td><h:message for="quantita" styleClass="error" /></td>
							</tr>
						</table>
						<br />
						<div class="centered">
							<h:commandButton value="Inserisci"
								action="#{inserimentoProdotto.inserimentoProdotto}" />
						</div>
					</h:form>
				</f:view>
			</c:when>
			<c:otherwise>Non hai i permessi per visualizzare questo contenuto</c:otherwise>
		</c:choose>
	</div>
	<p>
		<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
			principale</a>
	</p>
</body>
</html>