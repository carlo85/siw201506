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
<title>Eliminazione - conferma?</title>
</head>
<body>
	<p>Sei sicuro di voler procedere all'eliminazione?</p>
	<div id="content">
		<f:view>
			<h1>
				<b>${gestioneProdotto.prodotto.id}</b>
			</h1>
			<p>
				<b>Nome:</b> ${gestioneProdotto.prodotto.nome}
			</p>
			<p>
				<b>Codice:</b> ${gestioneProdotto.prodotto.codice}
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
			<h:form>
				<c:if
					test="${(controlloUtente.utente.categoria == 'amministratore')}">
					<h:commandButton value="Elimina"
						action="#{gestioneProdotto.confermaEliminazioneProdotto}" />
				</c:if>
			</h:form>
		</f:view>
	</div>
	<p>
		<a href="/siw-progetto/faces/paginaPrincipale.jsp">Pagina
			principale</a>
	</p>
</body>
</html>