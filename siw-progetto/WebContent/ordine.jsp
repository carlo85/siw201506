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
<title>Ordine</title>
</head>
<body>
	<div class="centered">
		<c:choose>
			<c:when test="${not empty gestioneOrdine.ordine}">
				<f:view>
					<h1>Ordine ${gestioneOrdine.ordine.id}</h1>
					<c:if
						test="${controlloUtente.utente.categoria == 'amministratore'}">
						<h:form>
							<p>
								Ordine effettuato da
								<h:commandLink action="#{gestioneUtente.ricercaUtenteDaOrdine}"
									value="#{gestioneOrdine.utente.nomeUtente}">
									<f:setPropertyActionListener target="#{gestioneUtente.id}"
										value="#{gestioneOrdine.ordine.id}" />
								</h:commandLink>
							</p>
						</h:form>
					</c:if>
					<h:form>
						<table class="tablesorter">
							<thead>
								<tr>
									<th>Id</th>
									<th>Id prodotto</th>
									<th>Nome prodotto</th>
									<th>Prezzo singolo</th>
									<th>Quantità</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="r" items="#{gestioneOrdine.righe}">
									<tr>
										<td>${r.id}</td>
										<td><h:commandLink
												action="#{gestioneProdotto.ricercaProdotto}"
												value="#{r.idProdotto}">
												<f:setPropertyActionListener target="#{gestioneProdotto.id}"
													value="#{r.idProdotto}" />
											</h:commandLink></td>
										<td>${r.nomeProdotto}</td>
										<td>${r.prezzoProdotto}</td>
										<td>${r.quantitaProdotto}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</h:form>
					<br />
					<c:if test="${gestioneOrdine.ordine.stato == 'chiuso'}">
						<c:if
							test="${controlloUtente.utente.categoria == 'amministratore'}">
							<h:form>
								<h:commandButton action="#{gestioneOrdine.evasioneOrdine}"
									value="Evadi">
								</h:commandButton>
							</h:form>
						</c:if>
						<c:if test="${controlloUtente.utente.categoria == 'utente'}">
							<h:form>
								<h:commandButton action="#{controlloUtente.annullamentoOrdine}"
									value="Annulla">
								</h:commandButton>
							</h:form>
						</c:if>
					</c:if>
				</f:view>
			</c:when>
			<c:otherwise>
				<p>Ordine non trovato</p>
			</c:otherwise>
		</c:choose>
		<p>
			<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
				principale</a>
		</p>
	</div>
</body>
</html>