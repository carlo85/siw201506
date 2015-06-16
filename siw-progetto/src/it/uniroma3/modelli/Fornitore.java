package it.uniroma3.modelli;

import java.util.Iterator;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.ManyToMany;

	@Entity
	public class Fornitore {
        
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false, unique = true)
	private String partitaIva;
	
	@Column(nullable = false)
	private String indirizzo;
	
	@Column(nullable = false)
	private String telefono;

	@Column(nullable = false)
	private String postaElettronica;
	
	@ManyToMany
	private List<Prodotto> prodotti;

	public Fornitore() {
		
	}

	public Fornitore(String partitaIva, String indirizzo, String telefono, String postaElettronica) {
		this.partitaIva = partitaIva;
		this.indirizzo = indirizzo;
		this.telefono = telefono;
		this.postaElettronica = postaElettronica;
	}
	
	public void assegnazioneProdotto(Prodotto p) {
		this.prodotti.add(p);
	}
	
	public boolean rimozioneProdotto(Long id) {
		Iterator<Prodotto> i = this.prodotti.iterator();
		while (i.hasNext()) {
			Prodotto p = i.next();
			if (p.getId() == id) {
				i.remove();
				return true;
			}
		}
		return false;
	}

	public Long getId() {
		return id;
	}

	public String getPartitaIva() {
		return this.partitaIva;
	}

	public void setPartitaIva(String partitaIva) {
		this.partitaIva = partitaIva;
	}
    
    public String getIndirizzo() {
        return this.indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getTelefono() {
        return this.telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public String getPostaElettronica() {
        return postaElettronica;
    }

    public void setPostaElettronica(String postaElettronica) {
        this.postaElettronica = postaElettronica;
    }

	public List<Prodotto> getProdotti() {
		return prodotti;
	}

	public void setProdotti(List<Prodotto> prodotti) {
		this.prodotti = prodotti;
	}

	public int hashCode() {
		return this.partitaIva.hashCode();
	}

	public boolean equals(Object obj) {
		Fornitore fornitore = (Fornitore)obj;
		return this.getPartitaIva().equals(fornitore.getPartitaIva());
	}
	
}