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
<title>Prodotto</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty gestioneProdotto.prodotto}">
			<div id="content">
				<f:view>
					<h1>
						<b>Prodotto ${gestioneProdotto.prodotto.codice}</b>
					</h1>
					<p>
						<b>Nome:</b> ${gestioneProdotto.prodotto.nome}
					</p>
					<p>
						<b>Descrizione:</b> ${gestioneProdotto.prodotto.descrizione}
					</p>
					<p>
						<b>Prezzo:</b> ${gestioneProdotto.prodotto.prezzo}
					</p>
					<p>
						<b>Quantità:</b> ${gestioneProdotto.prodotto.quantita}
					</p>

					<c:if
						test="${(controlloUtente.utente.categoria == 'amministratore')}">
						<h:form>
							<div class="centered">
								<h:commandButton value="Elimina"
									action="#{gestioneProdotto.eliminazioneProdotto}" />
								<h:commandButton value="Modifica"
									action="modificaProdotto?faces-redirect=true" />
							</div>
						</h:form>
						<br />
						<h:form>
							<table>
								<tr>
									<td>Aggiungi quantità:</td>
									<td><h:inputText value="#{gestioneProdotto.quantita}"
											required="true" requiredMessage=" Campo obbligatorio"
											converterMessage=" Deve essere un numero"
											validatorMessage=" Deve essere un numero positivo"
											id="incrementoQuantita">
											<f:validateLongRange minimum="0" />
										</h:inputText></td>
									<td><h:message for="incrementoQuantita" styleClass="error" /></td>
								</tr>
							</table>
							<br />
							<div class="centered">
								<h:commandButton value="Aggiungi"
									action="#{gestioneProdotto.incrementoQuantita}" />
							</div>
						</h:form>
					</c:if>
					<c:if test="${(controlloUtente.utente.categoria == 'utente')}">
						<h:form>
							<table>
								<tr>
									<td>Quantità:</td>
									<td><h:inputText value="#{controlloUtente.quantita}"
											required="true" requiredMessage=" Campo obbligatorio"
											converterMessage=" Deve essere un numero"
											validatorMessage=" Deve essere un numero positivo"
											id="quantita">
											<f:validateLongRange minimum="0" />
										</h:inputText></td>
									<td><h:message for="quantita" styleClass="error" /></td>
								</tr>
							</table>
							<br />
							<div class="centered">
								<h:commandButton value="Inserisci nel carrello"
									action="#{controlloUtente.inserimentoNelCarrello}" />
							</div>
						</h:form>
					</c:if>
				</f:view>
			</div>
		</c:when>
		<c:otherwise>
			<p>Prodotto non trovato</p>
		</c:otherwise>
	</c:choose>
	<p>
		<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
			principale</a>
	</p>
</body>
</html>