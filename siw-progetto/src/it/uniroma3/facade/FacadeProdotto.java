package it.uniroma3.facade;

import it.uniroma3.modelli.Prodotto;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import java.util.List;

@Stateless
public class FacadeProdotto {
	
    @PersistenceContext(unitName = "siw-progetto")
    private EntityManager em;
    
	public boolean confermaInserimentoProdotto(Prodotto prodotto) {
		try {
			em.persist(prodotto);
			return true;
		}
		catch (Exception e) {
			return false;
		}
	}
	
	public Prodotto ricercaProdotto(Long id) {
	    Prodotto p = em.find(Prodotto.class, id);
		return p;
	}
	
	public Prodotto ricercaProdotto(String codice) {
		TypedQuery<Prodotto> query = em.createQuery("SELECT p FROM Prodotto p WHERE p.codice = ?1", Prodotto.class);
		query.setParameter(1, codice);
	    try {
	    	return query.getSingleResult();
	    }
	    catch (Exception e) {
	    	return null;
	    }
	}

	public List<Prodotto> ricercaProdotti() {
		return em.createNamedQuery("ricercaProdotti", Prodotto.class).getResultList();
	}

	public boolean confermaModificaProdotto(Long id, String descrizione, Float prezzo) {
		try {
			Prodotto p = this.ricercaProdotto(id);
			if (descrizione != "")
				p.setDescrizione(descrizione);
			if (prezzo != 0)
				p.setPrezzo(prezzo);
			return true;
		}
		catch (Exception e) {
			return false;
		}
	}
	
	public void incrementoQuantita(Long id, Integer quantita) {
		Prodotto p = this.ricercaProdotto(id);
		p.incrementoQuantita(quantita);
	}

	public void confermaEliminazioneProdotto(Long id) {
		em.remove(this.ricercaProdotto(id));
	}

}