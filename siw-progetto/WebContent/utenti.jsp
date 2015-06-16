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
<title>Utenti</title>
</head>
<body>
	<div class="centered">
		<c:choose>
			<c:when
				test="${controlloUtente.utente.categoria == 'amministratore'}">
				<f:view>
					<h:form>
						<h1>Utenti</h1>
						<p>
							<h:commandButton action="#{gestioneUtente.ricercaUtenti}"
								value="Solo utenti">
							</h:commandButton>
							<h:commandButton action="#{gestioneUtente.ricercaOspiti}"
								value="Solo ospiti">
							</h:commandButton>
							<h:commandButton action="#{gestioneUtente.ricercaIscritti}"
								value="Tutti">
							</h:commandButton>
						</p>
						<c:choose>
							<c:when test="${not empty gestioneUtente.utenti}">
								<table class="tablesorter">
									<thead>
										<tr>
											<th>Nome utente</th>
											<th>Nome</th>
											<th>Cognome</th>
											<th>Data di nascita</th>
											<th>Data di registrazione</th>
											<th>Indirizzo</th>
											<th>Posta elettronica</th>
											<th>Categoria</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="u" items="#{gestioneUtente.utenti}">
											<tr>
												<td><h:commandLink
														action="#{gestioneUtente.ricercaUtente}"
														value="#{u.nomeUtente}">
														<f:setPropertyActionListener
															target="#{gestioneUtente.nomeUtente}"
															value="#{u.nomeUtente}" />
													</h:commandLink></td>
												<td>${u.nome}</td>
												<td>${u.cognome}</td>
												<td>${u.dataNascita}</td>
												<td>${u.dataRegistrazione}</td>
												<td>${u.indirizzo}</td>
												<td>${u.postaElettronica}</td>
												<td>${u.categoria}</td>
												<td><h:commandButton
														action="#{gestioneUtente.eliminazioneUtente}"
														value="Elimina">
														<f:setPropertyActionListener
															target="#{gestioneUtente.utente}" value="#{u}" />
														<f:setPropertyActionListener
															target="#{gestioneUtente.nomeUtente}"
															value="#{u.nomeUtente}" />
													</h:commandButton> <c:if test="${u.categoria == 'ospite'}">
														<h:commandButton
															action="#{gestioneUtente.convalidaRegistrazioneUtente}"
															value="Convalida">
															<f:setPropertyActionListener
																target="#{gestioneUtente.utente}" value="#{u}" />
															<f:setPropertyActionListener
																target="#{gestioneUtente.nomeUtente}"
																value="#{u.nomeUtente}" />
														</h:commandButton>
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:when>
							<c:otherwise>
								<p>Non ci sono utenti</p>
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