package it.uniroma3.modelli;

import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Column;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@NamedQueries({
	@NamedQuery(name = "ricercaOrdini", query = "SELECT o FROM Ordine o WHERE o.stato <> 'aperto'"),
	@NamedQuery(name = "ricercaOrdiniChiusi", query = "SELECT o FROM Ordine o WHERE o.stato = 'chiuso'"),
	@NamedQuery(name = "ricercaOrdiniEvasi", query = "SELECT o FROM Ordine o WHERE o.stato = 'evaso'")})
public class Ordine {
	
	@Id
	@Column(nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String stato = "aperto";
	
	@Column
	@Temporal(TemporalType.DATE)
	private Date dataCreazione;
	
	@Column
	@Temporal(TemporalType.DATE)
	private Date dataChiusura;

	@Column
	@Temporal(TemporalType.DATE)
	private Date dataEvasione;
	
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "ordine_id")
	private List<RigaOrdine> righe = new LinkedList<RigaOrdine>();
	
	public Ordine() {
		
	}
	
	@PrePersist
	protected void onCreate() {
		this.dataCreazione = new Date();
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

	public Long getId() {
		return id;
	}
	
	public String getStato() {
		return stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}

	public Date getDataCreazione() {
		return dataCreazione;
	}

	public Date getDataChiusura() {
		return dataChiusura;
	}

	public void setDataChiusura(Date dataChiusura) {
		this.dataChiusura = dataChiusura;
	}

	public Date getDataEvasione() {
		return dataEvasione;
	}

	public void setDataEvasione(Date dataEvasione) {
		this.dataEvasione = dataEvasione;
	}

	public List<RigaOrdine> getRighe() {
		return righe;
	}

	public void setRighe(List<RigaOrdine> righe) {
		this.righe = righe;
	}
	
}