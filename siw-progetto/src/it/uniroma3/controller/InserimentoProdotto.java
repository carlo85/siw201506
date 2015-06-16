package it.uniroma3.controller;

import it.uniroma3.facade.FacadeProdotto;
import it.uniroma3.modelli.Prodotto;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class InserimentoProdotto {
	
	private String nome;
	private String codice;
	private String descrizione;
	private Float prezzo;
	private Integer quantita = 0;

	@EJB
	private FacadeProdotto facadeProdotto = new FacadeProdotto();

	public String inserimentoProdotto() {
		if (this.facadeProdotto.ricercaProdotto(this.codice) == null)
			return "confermaInserimentoProdotto";
		return "codiceProdottoEsistente";
	}

	public String confermaInserimentoProdotto() {
		Prodotto p = new Prodotto(this.nome, this.codice, this.descrizione, this.prezzo, this.quantita);
		try { 
			this.facadeProdotto.confermaInserimentoProdotto(p);
			this.nome = null;
			this.codice = null;
			this.descrizione = null;
			this.prezzo = null;
			this.quantita = 0;
			return "operazioneRiuscita";
		}
		catch (Exception e) {
			return "errore";
		}
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCodice() {
		return codice;
	}

	public void setCodice(String codice) {
		this.codice = codice;
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

}
