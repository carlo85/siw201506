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
<title>Carrello</title>
</head>
<body>
	<div class="centered">
		<c:choose>
			<c:when
				test="${controlloUtente.carrello != null && not empty controlloUtente.righe}">
				<f:view>
					<h:form>
						<h1>Carrello</h1>
						<table class="tablesorter">
							<thead>
								<tr>
									<th>Id</th>
									<th>Id prodotto</th>
									<th>Nome prodotto</th>
									<th>Prezzo singolo</th>
									<th>Quantità</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="r" items="#{controlloUtente.righe}">
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
										<td><c:if
												test="${not empty controlloUtente.utente && controlloUtente.utente.categoria == 'utente'}">
												<h:commandButton
													action="#{controlloUtente.rimozioneDalCarrello}"
													value="Rimuovi">
													<f:setPropertyActionListener target="#{controlloUtente.id}"
														value="#{r.id}" />
												</h:commandButton>
											</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br />
						<h:commandButton value="Svuota carrello"
							action="#{controlloUtente.svuotamentoCarrello}" />
						<h:commandButton value="Invia ordine"
							action="#{controlloUtente.confermaCreazioneOrdine}" />
					</h:form>
				</f:view>
			</c:when>
			<c:otherwise>
				<p>Carrello vuoto</p>
			</c:otherwise>
		</c:choose>
		<p>
			<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
				principale</a>
		</p>
	</div>
</body>
</html>