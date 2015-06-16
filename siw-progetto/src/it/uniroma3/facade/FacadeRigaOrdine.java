package it.uniroma3.facade;

import it.uniroma3.modelli.Ordine;
import it.uniroma3.modelli.Prodotto;
import it.uniroma3.modelli.RigaOrdine;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Stateless
public class FacadeRigaOrdine {

	@PersistenceContext(unitName = "siw-progetto")
	private EntityManager em;

	public boolean creazioneRigaOrdine(Long idOrdine, Long idProdotto, Integer quantita) {
		List<RigaOrdine> righe = this.ricercaRigheOrdine(idOrdine);
		for (RigaOrdine r : righe) {
			if (r.getIdProdotto().equals(idProdotto))
				return false;
		}
		Ordine o = em.find(Ordine.class, idOrdine);
		Prodotto p = em.find(Prodotto.class, idProdotto);
		RigaOrdine r = new RigaOrdine(p, quantita);
		em.persist(r);
		p.creazioneRiga(r);
		o.creazioneRiga(r);
		return true;
	}
	
	public List<RigaOrdine> ricercaRigheOrdine(Long id) {
		TypedQuery <RigaOrdine> query = em.createQuery("SELECT r FROM RigaOrdine r, Ordine o WHERE r MEMBER OF o.righe AND o.id = ?1", RigaOrdine.class);
		query.setParameter(1, id);
		return query.getResultList();
	}

	public Ordine rimozioneRigaOrdine(Long idOrdine, Long id) {
		Ordine o = em.find(Ordine.class, idOrdine);
		RigaOrdine r = em.find(RigaOrdine.class, id);
		Long idProdotto = r.getIdProdotto();
		Prodotto p = em.find(Prodotto.class, idProdotto);
		p.rimozioneRiga(id);
		o.rimozioneRiga(id);
		em.remove(r);
		return o;
	}

}