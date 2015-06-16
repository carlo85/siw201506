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
public class ControlloUtente {
	
	private Utente utente;
	private String nomeUtente;
	private String parolaChiave;
	private String nuovaParolaChiave;
	private String indirizzo;
	private String postaElettronica;
	private Ordine carrello;
	private List<RigaOrdine> righe;
	private Integer numeroRighe = 0;
	private List<Ordine> ordini;
	private Integer quantita = 1;
	private Long id;
	
	@EJB
	private FacadeUtente facadeUtente = new FacadeUtente();

	@EJB
	private FacadeOrdine facadeOrdine = new FacadeOrdine();

	@EJB
	private FacadeRigaOrdine facadeRigaOrdine = new FacadeRigaOrdine();

	public String accessoUtente() {
		this.utente = this.facadeUtente.accessoUtente(this.nomeUtente, this.parolaChiave);
		if (this.utente != null) {
			if (this.utente.getCategoria().equals("utente")) {
				this.carrello = this.facadeOrdine.recuperoCarrello(this.utente.getNomeUtente());
				if (this.carrello != null) {
					this.righe = this.facadeRigaOrdine.ricercaRigheOrdine(this.carrello.getId());
					this.numeroRighe = this.righe.size();
				}
			}
			this.nomeUtente = null;
			this.parolaChiave = null;
			return "paginaPrincipale";
		}
		return "credenzialiErrate";
	}

	public String disconnessioneUtente() {
		this.utente = null;
		this.carrello = null;
		this.righe = null;
		this.numeroRighe = 0;
		this.ordini = null;
		return "paginaPrincipale";
	}

	public String modificaUtente() {
		return "confermaModificaUtente";
	}

	public String confermaModificaUtente() {
		boolean parolaChiaveModificata = false;
		if (!this.nuovaParolaChiave.equals("") && !this.nuovaParolaChiave.equals(this.parolaChiave))
			parolaChiaveModificata = true;
		Utente u = this.facadeUtente.confermaModificaUtente(this.utente.getNomeUtente(), this.parolaChiave, this.nuovaParolaChiave, this.indirizzo, this.postaElettronica);
		if (u != null) {
			this.utente = u;
			if (parolaChiaveModificata)
				this.disconnessioneUtente();
			this.parolaChiave = null;
			this.nuovaParolaChiave = null;
			this.indirizzo = null;
			this.postaElettronica = null;
			return "operazioneRiuscita";
		}
		return "errore";
	}

	public String inserimentoNelCarrello() {
		if (this.carrello == null)
			this.carrello = this.facadeOrdine.creazioneCarrello(this.utente.getNomeUtente());
		if (this.facadeRigaOrdine.creazioneRigaOrdine(this.carrello.getId(), this.id, this.quantita)) {
			this.carrello = this.facadeOrdine.recuperoCarrello(this.utente.getNomeUtente());
			this.righe = this.facadeRigaOrdine.ricercaRigheOrdine(this.carrello.getId());
			this.numeroRighe = this.righe.size();
			this.id = null;
			return "operazioneRiuscita";
		}
		return "prodottoDuplicato";
	}

	public String rimozioneDalCarrello() {
		this.carrello = this.facadeRigaOrdine.rimozioneRigaOrdine(this.carrello.getId(), this.id);
		this.righe = this.facadeRigaOrdine.ricercaRigheOrdine(this.carrello.getId());
		this.numeroRighe = this.righe.size();
		if (this.righe.isEmpty())
			this.svuotamentoCarrello();
		this.id = null;
		return "operazioneRiuscita";
	}

	public String svuotamentoCarrello() {
		this.facadeOrdine.distruzioneCarrello(this.utente.getNomeUtente(), this.carrello.getId());
		this.carrello = null;
		this.righe = null;
		this.numeroRighe = 0;
		this.id = null;
		return "operazioneRiuscita";
	}
	
	public String confermaCreazioneOrdine() {
		this.facadeOrdine.confermaCreazioneOrdine(this.carrello.getId());
		this.carrello = null;
		this.righe = null;
		this.numeroRighe = 0;
		return "operazioneRiuscita";
	}
	
	public String ricercaOrdini() {
		this.ordini = this.facadeOrdine.ricercaOrdiniUtente(this.utente.getNomeUtente());
		return "ordiniUtente";
	}
	
	public String annullamentoOrdine() {
		if (this.facadeOrdine.annullamentoOrdine(this.utente.getNomeUtente(), this.id)) {
			this.id = null;
			return "operazioneRiuscita";
		}
		return "annullamentoImpossibile";
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
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

	public String getNuovaParolaChiave() {
		return nuovaParolaChiave;
	}

	public void setNuovaParolaChiave(String nuovaParolaChiave) {
		this.nuovaParolaChiave = nuovaParolaChiave;
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

	public Ordine getCarrello() {
		return carrello;
	}

	public List<RigaOrdine> getRighe() {
		return righe;
	}

	public Integer getNumeroRighe() {
		return numeroRighe;
	}

	public List<Ordine> getOrdini() {
		return ordini;
	}

	public Integer getQuantita() {
		return quantita;
	}

	public void setQuantita(Integer quantita) {
		this.quantita = quantita;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}