package it.uniroma3.controller;

import java.util.Date;

import it.uniroma3.facade.FacadeUtente;
import it.uniroma3.modelli.Utente;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class RegistrazioneUtente {
	
	private String nomeUtente;
	private String parolaChiave;
	private String nome;
	private String cognome;
	private Date dataNascita;
	private String indirizzo;
	private String postaElettronica;

	@EJB
	private FacadeUtente facadeUtente = new FacadeUtente();

	public String registrazioneUtente() {
		if (this.facadeUtente.ricercaUtente(this.nomeUtente) == null)
			return "confermaRegistrazioneUtente";
		return "nomeUtenteEsistente";
	}

	public String confermaRegistrazioneUtente() {
		Utente u = new Utente(this.nomeUtente, this.parolaChiave, this.nome, this.cognome, this.dataNascita, this.indirizzo, this.postaElettronica);
		try {
			this.facadeUtente.confermaRegistrazioneUtente(u);
			this.nomeUtente = null;
			this.parolaChiave = null;
			this.nome = null;
			this.cognome = null;
			this.dataNascita = null;
			this.indirizzo = null;
			this.postaElettronica = null;
			return "richiestaInoltrata";
		}
		catch (Exception e) {
			return "errore";
		}
	}

	public String getNomeUtente() {
		return nomeUtente;
	}

	public void setNomeUtente(String nomeUtente) {
		this.nomeUtente = nomeUtente;
	}

	public String getParolaChiave() {
		return parolaChiave;
	}

	public void setParolaChiave(String parolaChiave) {
		this.parolaChiave = parolaChiave;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getPostaElettronica() {
		return postaElettronica;
	}

	public void setPostaElettronica(String postaElettronica) {
		this.postaElettronica = postaElettronica;
	}

}
