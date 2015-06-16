package it.uniroma3.controller;

import java.util.List;

import it.uniroma3.facade.FacadeOrdine;
import it.uniroma3.facade.FacadeRigaOrdine;
import it.uniroma3.facade.FacadeUtente;
import it.uniroma3.modelli.Ordine;
import it.uniroma3.modelli.RigaOrdine;
import it.uniroma3.modelli.Utente;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class GestioneOrdine {
	
	private Long id;
	private Ordine ordine;
	private List<Ordine> ordini;
	private List<RigaOrdine> righe;
	private Utente utente;
	
	@EJB
	private FacadeOrdine facadeOrdine = new FacadeOrdine();
	
	@EJB
	private FacadeRigaOrdine facadeRigaOrdine = new FacadeRigaOrdine();
	
	@EJB
	private FacadeUtente facadeUtente = new FacadeUtente();
	
	public String ricercaOrdine() {
		this.ordine = this.facadeOrdine.ricercaOrdine(this.id);
		this.righe = this.facadeRigaOrdine.ricercaRigheOrdine(this.id);
		this.utente = this.facadeUtente.ricercaUtente(this.id);
		return "ordine";
	}

	public String ricercaOrdini() {
		this.ordini = this.facadeOrdine.ricercaOrdini();
		return "ordini";
	}

	public String ricercaOrdiniChiusi() {
		this.ordini = this.facadeOrdine.ricercaOrdiniChiusi();
		return "ordini";
	}

	public String ricercaOrdiniEvasi() {
		this.ordini = this.facadeOrdine.ricercaOrdiniEvasi();
		return "ordini";
	}

	public String evasioneOrdine() {
		if (this.facadeOrdine.evasioneOrdine(this.id))
			return "operazioneRiuscita";
		return "prodottiEsauriti";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Ordine getOrdine() {
		return ordine;
	}

	public void setOrdine(Ordine ordine) {
		this.ordine = ordine;
	}

	public List<Ordine> getOrdini() {
		return ordini;
	}

	public List<RigaOrdine> getRighe() {
		return righe;
	}

	public Utente getUtente() {
		return utente;
	}

}
