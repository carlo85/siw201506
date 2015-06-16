package it.uniroma3.controller;

import java.util.List;

import it.uniroma3.facade.FacadeUtente;
import it.uniroma3.modelli.Utente;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class GestioneUtente {
	
	private String nomeUtente;
	private Utente utente;
	private List<Utente> utenti;
	private Long id;
	
	@EJB
	private FacadeUtente facadeUtente = new FacadeUtente();
	
	public String ricercaUtente() {
		this.utente = this.facadeUtente.ricercaUtente(this.nomeUtente);
		return "utente";
	}

	public String ricercaIscritti() {
		this.utenti = this.facadeUtente.ricercaIscritti();
		return "utenti";
	}

	public String ricercaUtenti() {
		this.utenti = this.facadeUtente.ricercaUtenti();
		return "utenti";
	}

	public String ricercaOspiti() {
		this.utenti = this.facadeUtente.ricercaOspiti();
		return "utenti";
	}

	public String ricercaUtenteDaOrdine() {
		this.utente = this.facadeUtente.ricercaUtente(this.id);
		if (this.utente != null)
			return "utente";
		return "ordine";
	}

	public String convalidaRegistrazioneUtente() {
		if (this.facadeUtente.convalidaRegistrazioneUtente(this.nomeUtente))
			return "operazioneRiuscita";
		return "errore";
	}

	public String eliminazioneUtente() {
		return "confermaEliminazioneUtente";
	}

	public String confermaEliminazioneUtente() {
		this.facadeUtente.confermaEliminazioneUtente(this.nomeUtente);
		this.nomeUtente = null;
		return "operazioneRiuscita";
	}

	public String getNomeUtente() {
		return nomeUtente;
	}

	public void setNomeUtente(String nomeUtente) {
		this.nomeUtente = nomeUtente;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}
	
	public List<Utente> getUtenti() {
		return utenti;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
