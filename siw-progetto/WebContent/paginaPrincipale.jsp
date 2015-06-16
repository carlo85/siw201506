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
<title>Pagina principale</title>
</head>
<body>
<div class="centered">
	<c:choose>
		<c:when test="${controlloUtente.utente.categoria == 'amministratore'}">
			<f:view>
				<h:form>
					<div id="userbar">
						Salve
						<h:commandLink value="#{controlloUtente.utente.nomeUtente}"
							action="#{gestioneUtente.ricercaUtente}">
							<f:setPropertyActionListener
								target="#{gestioneUtente.nomeUtente}"
								value="#{controlloUtente.utente.nomeUtente}" />
						</h:commandLink>
						<h:commandButton value="Disconnetti"
							action="#{controlloUtente.disconnessioneUtente}" />
					</div>
				</h:form>
				<h:form>
					<ul id="menu-bar">
						<li><h:commandLink value="Inserisci prodotto"
								action="inserimentoProdotto?faces-redirect=true" /></li>
						<li><h:commandLink value="Cerca prodotto"
								action="ricercaProdotto?faces-redirect=true" /></li>
						<li><h:commandLink value="Cerca utente"
								action="ricercaUtente?faces-redirect=true" /></li>
						<li><h:commandLink value="Cerca ordine"
								action="ricercaOrdine?faces-redirect=true" /></li>
						<li><h:commandLink value="Catalogo"
								action="#{gestioneProdotto.ricercaProdotti}" /></li>
						<li><h:commandLink value="Iscritti"
								action="#{gestioneUtente.ricercaIscritti}" /></li>
						<li><h:commandLink value="Ordini"
								action="#{gestioneOrdine.ricercaOrdini}" /></li>
					</ul>
				</h:form>
			</f:view>
		</c:when>
		<c:when test="${controlloUtente.utente.categoria == 'utente'}">
			<f:view>
				<h:form>
					<div id="userbar">
						Salve
						<h:commandLink value="#{controlloUtente.utente.nomeUtente}"
							action="#{gestioneUtente.ricercaUtente}">
							<f:setPropertyActionListener
								target="#{gestioneUtente.nomeUtente}"
								value="#{controlloUtente.utente.nomeUtente}" />
						</h:commandLink>
						<h:commandButton value="Disconnetti"
							action="#{controlloUtente.disconnessioneUtente}" />
					</div>
				</h:form>
				<h:form>
					<ul id="menu-bar">
						<li><h:commandLink value="Informazioni personali"
								action="#{gestioneUtente.ricercaUtente}">
								<f:setPropertyActionListener
									target="#{gestioneUtente.nomeUtente}"
									value="#{controlloUtente.utente.nomeUtente}" />
							</h:commandLink></li>
						<li><h:commandLink value="Catalogo"
								action="#{gestioneProdotto.ricercaProdotti}" /></li>
						<li><h:commandLink
								value="Carrello (#{controlloUtente.numeroRighe})"
								action="carrello?faces-redirect=true" /></li>
						<li><h:commandLink value="Storico ordini"
								action="#{controlloUtente.ricercaOrdini}" /></li>
					</ul>
				</h:form>
			</f:view>
		</c:when>
		<c:when test="${controlloUtente.utente.categoria == 'ospite'}">
			<f:view>
				<h:form>
					<div id="userbar">
						Salve
						<h:commandLink value="#{controlloUtente.utente.nomeUtente}"
							action="#{gestioneUtente.ricercaUtente}">
							<f:setPropertyActionListener
								target="#{gestioneUtente.nomeUtente}"
								value="#{controlloUtente.utente.nomeUtente}" />
						</h:commandLink>
						<h:commandButton value="Disconnetti"
							action="#{controlloUtente.disconnessioneUtente}" />
					</div>
					<p>La tua registrazione è in attesa di convalida.</p>
				</h:form>
				<h:form>
					<ul id="menu-bar">
						<li><h:commandLink value="Catalogo"
								action="#{gestioneProdotto.ricercaProdotti}" /></li>
					</ul>
				</h:form>
			</f:view>
		</c:when>
		<c:otherwise>
			<f:view>
				<h:form>
					<div id="userbar">
						<table align="right">
							<tr>
								<td>Nome utente</td>
								<td>Parola chiave</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><h:inputText value="#{controlloUtente.nomeUtente}"
										id="nomeUtente" /></td>
								<td><h:inputSecret value="#{controlloUtente.parolaChiave}"
										id="parolaChiave" /></td>
								<td><h:commandButton value="Accedi"
										action="#{controlloUtente.accessoUtente}" /></td>
								<td><h:commandButton value="Registrati"
										action="registrazioneUtente?faces-redirect=true" /></td>
							</tr>
						</table>
						<div style="clear: both"></div>
					</div>
					<ul id="menu-bar">
						<li><h:commandLink value="Catalogo"
								action="#{gestioneProdotto.ricercaProdotti}" /></li>
					</ul>
				</h:form>
			</f:view>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>