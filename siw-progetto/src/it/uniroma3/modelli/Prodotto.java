package it.uniroma3.modelli;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Column;
import javax.persistence.OneToMany;

	@Entity
	@NamedQuery(name = "ricercaProdotti", query = "SELECT p FROM Prodotto p")
	public class Prodotto {
        
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false)
	private String nome;
	
	@Column(nullable = false, unique = true)
	private String codice;
	
	@Column(length = 2000)
	private String descrizione;

	@Column(nullable = false)
	private Float prezzo;
	
	@Column(nullable = false)
	private Integer quantita = 0;
	
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "prodotto_id")
	private List<RigaOrdine> righe = new LinkedList<RigaOrdine>();
	
	@ManyToMany(mappedBy="prodotti")
	private List<Fornitore> fornitori;

	public Prodotto() {
		
	}

	public Prodotto(String nome, String codice, String descrizione, Float prezzo, Integer quantita) {
		this.nome = nome;
		this.codice = codice;
		this.descrizione = descrizione;
		this.prezzo = prezzo;
		this.quantita = quantita;
	}
	
	public void incrementoQuantita(Integer quantita) {
		this.quantita = this.quantita + quantita;
	}
	
	public boolean diminuzioneQuantita(Integer quantita) {
		if (quantita > this.quantita)
			return false;
		this.quantita = this.quantita - quantita;
		return true;
	}
	
	public void creazioneRiga(RigaOrdine r) {
		this.righe.add(r);
	}
	
	public boolean rimozioneRiga(Long id) {
		Iterator<RigaOrdine> i = this.righe.iterator();
		while (i.hasNext()) {
			RigaOrdine r = i.next();
			if (r.getId() == id) {
				i.remove();
				return true;
			}
		}
		return false;
	}
	
	public void assegnazioneFornitore(Fornitore f) {
		this.fornitori.add(f);
	}
	
	public boolean rimozioneProdotto(Long id) {
		Iterator<Fornitore> i = this.fornitori.iterator();
		while (i.hasNext()) {
			Fornitore f = i.next();
			if (f.getId() == id) {
				i.remove();
				return true;
			}
		}
		return false;
	}

	public Long getId() {
		return id;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
    
    public String getCodice() {
        return this.codice;
    }

    public void setCodice(String codice) {
        this.codice = codice;
    }

    public String getDescrizione() {
        return this.descrizione;
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

	public List<RigaOrdine> getRighe() {
		return righe;
	}

	public void setRighe(List<RigaOrdine> righe) {
		this.righe = righe;
	}

	public List<Fornitore> getFornitori() {
		return fornitori;
	}

	public void setFornitori(List<Fornitore> fornitori) {
		this.fornitori = fornitori;
	}

	public int hashCode() {
		return this.codice.hashCode();
	}

	public boolean equals(Object obj) {
		Prodotto prodotto = (Prodotto)obj;
		return this.getCodice().equals(prodotto.getCodice());
	}
	
}