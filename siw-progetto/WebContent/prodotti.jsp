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
<title>Prodotti</title>
</head>
<body>
	<div class="centered">
		<c:choose>
			<c:when test="${not empty gestioneProdotto.prodotti}">
				<f:view>
					<h:form>
						<h1>Prodotti</h1>
						<table class="tablesorter">
							<thead>
								<tr>
									<th>Id</th>
									<th>Nome</th>
									<th>Codice</th>
									<th>Descrizione</th>
									<th>Prezzo</th>
									<th>Quantità</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="#{gestioneProdotto.prodotti}">
									<tr>
										<td><h:commandLink
												action="#{gestioneProdotto.ricercaProdotto}" value="#{p.id}">
												<f:setPropertyActionListener target="#{gestioneProdotto.id}"
													value="#{p.id}" />
												<c:if
													test="${not empty controlloUtente.utente && controlloUtente.utente.categoria == 'utente'}">
													<f:setPropertyActionListener target="#{controlloUtente.id}"
														value="#{p.id}" />
												</c:if>
											</h:commandLink></td>
										<td>${p.nome}</td>
										<td>${p.codice}</td>
										<td>${p.descrizione}</td>
										<td>${p.prezzo}</td>
										<td>${p.quantita}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</h:form>
				</f:view>
			</c:when>
			<c:otherwise>
				<p>Non ci sono prodotti</p>
			</c:otherwise>
		</c:choose>
		<p>
			<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
				principale</a>
		</p>
	</div>
</body>
</html>