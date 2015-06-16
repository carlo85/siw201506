package it.uniroma3.modelli;

import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@NamedQueries({
	@NamedQuery(name = "ricercaIscritti", query = "SELECT u FROM Utente u WHERE u.categoria <> 'amministratore'"),
	@NamedQuery(name = "ricercaUtenti", query = "SELECT u FROM Utente u WHERE u.categoria = 'utente'"),
	@NamedQuery(name = "ricercaOspiti", query = "SELECT u FROM Utente u WHERE u.categoria = 'ospite'")})
public class Utente {
	
	@Id
	private String nomeUtente;
	
	@Column(nullable = false)
	private String parolaChiave;
	
	@Column(nullable = false)
	private String categoria = "ospite";
	
	@Column
	private String nome;
	
	@Column
	private String cognome;
	
	@Column
	@Temporal(TemporalType.DATE)
	private Date dataNascita;

	@Column
	@Temporal(TemporalType.DATE)
	private Date dataRegistrazione;

	@Column
	private String indirizzo;
	
	@Column
	private String postaElettronica;
	
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "utente_nomeUtente")
	private List<Ordine> ordini = new LinkedList<Ordine>();
	
	public Utente() {
		
	}
	
	public Utente(String nomeUtente, String parolaChiave, String nome, String cognome, Date dataNascita, String indirizzo, String postaElettronica) {
		this.nomeUtente = nomeUtente;
		this.parolaChiave = parolaChiave;
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.indirizzo = indirizzo;
		this.postaElettronica = postaElettronica;
	}

	@PrePersist
	protected void onCreate() {
		this.dataRegistrazione = new Date();
	}
	
	public void creazioneOrdine(Ordine ordine) {
		this.ordini.add(ordine);
	}
	
	public boolean rimozioneOrdine(Long id) {
		Iterator<Ordine> i = this.ordini.iterator();
		while (i.hasNext()) {
			Ordine o = i.next();
			if (o.getId() == id) {
				i.remove();
				return true;
			}
		}
		return false;
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
	
	public String getCategoria() {
		return categoria;
	}
	
	public void setCategoria(String categoria) {
		this.categoria = categoria;
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

	public Date getDataRegistrazione() {
		return dataRegistrazione;
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
	
	public List<Ordine> getOrdini() {
		return ordini;
	}

	public void setOrdini(List<Ordine> ordini) {
		this.ordini = ordini;
	}

	public int hashCode() {
		return this.nomeUtente.hashCode();
	}

	public boolean equals(Object obj) {
		Utente utente = (Utente)obj;
		return this.getNomeUtente().equals(utente.getNomeUtente());
	}

}
