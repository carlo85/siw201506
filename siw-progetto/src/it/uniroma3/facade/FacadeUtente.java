package it.uniroma3.facade;

import it.uniroma3.modelli.Utente;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Stateless
public class FacadeUtente {
	
	@PersistenceContext(unitName = "siw-progetto")
	private EntityManager em;
	
	public Utente accessoUtente(String nomeUtente, String parolaChiave) {
		TypedQuery<Utente> query = em.createQuery("SELECT u FROM Utente u WHERE u.nomeUtente = ?1 AND u.parolaChiave = ?2", Utente.class);
		query.setParameter(1, nomeUtente);
		query.setParameter(2, parolaChiave);
		try {
			return query.getSingleResult();
		}
		catch (Exception e) {
			return null;
		}
	}
	
	public boolean confermaRegistrazioneUtente(Utente utente) {
		try {
			em.persist(utente);
			return true;
		}
		catch (Exception e) {
			return false;
		}
	}
	
	public boolean convalidaRegistrazioneUtente(String nomeUtente) {
		Utente u = this.ricercaUtente(nomeUtente);
		try {
			u.setCategoria("utente");
			return true;
		}
		catch (Exception e) {
			return false;
		}
	}
	
	public Utente ricercaUtente(String nomeUtente) {
		Utente u = em.find(Utente.class, nomeUtente);
		return u;
	}
	
	public Utente ricercaUtente(Long id) {
		TypedQuery<Utente> query = em.createQuery("SELECT u FROM Utente u, Ordine o WHERE o MEMBER OF u.ordini AND o.id = ?1", Utente.class);
		query.setParameter(1, id);
		try {
			return query.getSingleResult();
		}
		catch (Exception e) {
			return null;
		}
	}
	
	public List<Utente> ricercaIscritti() {
		return em.createNamedQuery("ricercaIscritti", Utente.class).getResultList();
	}
	
	public List<Utente> ricercaUtenti() {
		return em.createNamedQuery("ricercaUtenti", Utente.class).getResultList();
	}
	
	public List<Utente> ricercaOspiti() {
		return em.createNamedQuery("ricercaOspiti", Utente.class).getResultList();
	}
	
	public Utente confermaModificaUtente(String nomeUtente, String vecchiaParolaChiave, String nuovaParolaChiave, String indirizzo, String postaElettronica) {
		TypedQuery<Utente> query = em.createQuery("SELECT u FROM Utente u WHERE u.nomeUtente = ?1 AND u.parolaChiave = ?2", Utente.class);
		query.setParameter(1, nomeUtente);
		query.setParameter(2, vecchiaParolaChiave);
		try {
			Utente u = query.getSingleResult();
			if (nuovaParolaChiave != "")
				u.setParolaChiave(nuovaParolaChiave);
			if (indirizzo != "")
				u.setIndirizzo(indirizzo);
			if (postaElettronica != "")
				u.setPostaElettronica(postaElettronica);
			return u;
		}
		catch (Exception e) {
			return null;
		}
	}
	
	public void confermaEliminazioneUtente(String nomeUtente) {
		em.remove(this.ricercaUtente(nomeUtente));
	}

}
