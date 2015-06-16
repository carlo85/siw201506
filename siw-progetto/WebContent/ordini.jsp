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
<title>Ordini</title>
</head>
<body>
	<div class="centered">
		<c:choose>
			<c:when
				test="${controlloUtente.utente.categoria == 'amministratore'}">
				<f:view>
					<h:form>
						<h1>Ordini</h1>
						<p>
							<h:commandButton action="#{gestioneOrdine.ricercaOrdiniChiusi}"
								value="Solo chiusi">
							</h:commandButton>
							<h:commandButton action="#{gestioneOrdine.ricercaOrdiniEvasi}"
								value="Solo evasi">
							</h:commandButton>
							<h:commandButton action="#{gestioneOrdine.ricercaOrdini}"
								value="Tutti">
							</h:commandButton>
						</p>
						<c:choose>
							<c:when test="${not empty gestioneOrdine.ordini}">
								<table class="tablesorter">
									<thead>
										<tr>
											<th>Id</th>
											<th>Data creazione</th>
											<th>Data chiusura</th>
											<th>Data evasione</th>
											<th>Stato</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="o" items="#{gestioneOrdine.ordini}">
											<tr>
												<td><h:commandLink
														action="#{gestioneOrdine.ricercaOrdine}" value="#{o.id}">
														<f:setPropertyActionListener target="#{gestioneOrdine.id}"
															value="#{o.id}" />
													</h:commandLink></td>
												<td>${o.dataCreazione}</td>
												<td>${o.dataChiusura}</td>
												<td>${o.dataEvasione}</td>
												<td>${o.stato}</td>
												<td><c:if test="${o.stato == 'chiuso'}">
														<h:commandButton action="#{gestioneOrdine.evasioneOrdine}"
															value="Evadi">
															<f:setPropertyActionListener
																target="#{gestioneOrdine.ordine}" value="#{o}" />
															<f:setPropertyActionListener
																target="#{gestioneOrdine.id}" value="#{o.id}" />
														</h:commandButton>
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:when>
							<c:otherwise>
								<p>Non ci sono ordini</p>
							</c:otherwise>
						</c:choose>
					</h:form>
				</f:view>
			</c:when>
			<c:otherwise>Non hai i permessi per visualizzare questo contenuto</c:otherwise>
		</c:choose>
		<p>
			<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
				principale</a>
		</p>
	</div>
</body>
</html>