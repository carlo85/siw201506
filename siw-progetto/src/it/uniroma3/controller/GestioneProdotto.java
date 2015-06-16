package it.uniroma3.controller;

import java.util.List;

import it.uniroma3.facade.FacadeProdotto;
import it.uniroma3.modelli.Prodotto;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class GestioneProdotto {
	
	private Long id;
	private String descrizione;
	private Float prezzo;
	private Integer quantita;
	private Prodotto prodotto;
	private List<Prodotto> prodotti;
	
	@EJB
	private FacadeProdotto facadeProdotto = new FacadeProdotto();
	
	public String ricercaProdotto() {
		this.prodotto = this.facadeProdotto.ricercaProdotto(this.id);
		return "prodotto";
	}

	public String ricercaProdotti() {
		this.prodotti = this.facadeProdotto.ricercaProdotti();
		return "prodotti";
	}
	
	public String modificaProdotto() {
		return "confermaModificaProdotto";
	}
	
	public String confermaModificaProdotto() {
		if (this.facadeProdotto.confermaModificaProdotto(this.id, this.descrizione, this.prezzo)) {
			this.id = null;
			this.descrizione = null;
			this.prezzo = null;
			return "operazioneRiuscita";
		}
		return "errore";
	}
	
	public String incrementoQuantita() {
		this.facadeProdotto.incrementoQuantita(this.prodotto.getId(), this.quantita);
		return "operazioneRiuscita";
	}

	public String eliminazioneProdotto() {
		return "confermaEliminazioneProdotto";
	}

	public String confermaEliminazioneProdotto() {
		this.facadeProdotto.confermaEliminazioneProdotto(this.id);
		this.id = null;
		return "operazioneRiuscita";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public Float getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(Float prezzo) {
		this.prezzo = prezzo;
	}

	public Integer getQuantita() {
		return quantita;
	}

	public void setQuantita(Integer quantita) {
		this.quantita = quantita;
	}

	public Prodotto getProdotto() {
		return prodotto;
	}
	
	public List<Prodotto> getProdotti() {
		return prodotti;
	}

}
