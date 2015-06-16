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
<title>Utente</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty gestioneUtente.utente}">
			<div id="content">
				<f:view>
					<h1>
						<b>${gestioneUtente.utente.nomeUtente}</b>
					</h1>
					<p>
						<b>Nome:</b> ${gestioneUtente.utente.nome}
					</p>
					<p>
						<b>Cognome:</b> ${gestioneUtente.utente.cognome}
					</p>
					<p>
						<b>Data di nascita:</b> ${gestioneUtente.utente.dataNascita}
					</p>
					<p>
						<b>Data di registrazione:</b>
						${gestioneUtente.utente.dataRegistrazione}
					</p>
					<p>
						<b>Indirizzo:</b> ${gestioneUtente.utente.indirizzo}
					</p>
					<p>
						<b>Posta elettronica:</b>
						${gestioneUtente.utente.postaElettronica}
					</p>
					<p>
						<b>Categoria:</b> ${gestioneUtente.utente.categoria}
					</p>
					<h:form>
						<div class="centered">
							<c:if
								test="${(controlloUtente.utente.categoria == 'amministratore') && (gestioneUtente.utente.categoria != 'amministratore')}">
								<h:commandButton value="Elimina"
									action="#{gestioneUtente.eliminazioneUtente}" />
								<c:if test="${gestioneUtente.utente.categoria == 'ospite'}">
									<h:commandButton value="Convalida"
										action="#{gestioneUtente.convalidaRegistrazioneUtente}" />
								</c:if>
							</c:if>
							<c:if
								test="${(gestioneUtente.utente.nomeUtente == controlloUtente.utente.nomeUtente) && (controlloUtente.utente.categoria != 'amministratore')}">
								<h:commandButton value="Elimina"
									action="#{gestioneUtente.eliminazioneUtente}" />
								<h:commandButton value="Modifica"
									action="modificaUtente?faces-redirect=true" />
							</c:if>
						</div>
					</h:form>
				</f:view>
			</div>
		</c:when>
		<c:otherwise>
			<p>Utente non trovato</p>
		</c:otherwise>
	</c:choose>
	<p>
		<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
			principale</a>
	</p>
</body>
</html>