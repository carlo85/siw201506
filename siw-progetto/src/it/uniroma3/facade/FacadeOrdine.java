package it.uniroma3.facade;

import it.uniroma3.modelli.Ordine;
import it.uniroma3.modelli.Prodotto;
import it.uniroma3.modelli.RigaOrdine;
import it.uniroma3.modelli.Utente;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Stateless
public class FacadeOrdine {

	@PersistenceContext(unitName = "siw-progetto")
	private EntityManager em;

	public Ordine recuperoCarrello(String nomeUtente) {
		TypedQuery<Ordine> query = em.createQuery("SELECT o FROM Ordine o, Utente u WHERE o MEMBER OF u.ordini AND u.nomeUtente = ?1 AND o.stato = ?2", Ordine.class);
		query.setParameter(1, nomeUtente);
		query.setParameter(2, "aperto");
		try {
			return query.getSingleResult();
		}
		catch (Exception e) {
			return null;
		}
	}

	public Ordine creazioneCarrello(String nomeUtente) {
		Utente u = em.find(Utente.class, nomeUtente);
		Ordine o = new Ordine();
		em.persist(o);
		u.creazioneOrdine(o);
		return o;
	}

	public void distruzioneCarrello(String nomeUtente, Long id) {
		Utente u = em.find(Utente.class, nomeUtente);
		Ordine o = this.ricercaOrdine(id);
		u.rimozioneOrdine(id);
		em.remove(o);
	}

	public void confermaCreazioneOrdine(Long id) {
		Ordine o = this.ricercaOrdine(id);
		o.setStato("chiuso");
		o.setDataChiusura(new Date());
	}

	public Ordine ricercaOrdine(Long id) {
		Ordine o = em.find(Ordine.class, id);
		return o;
	}
	
	public List<Ordine> ricercaOrdiniUtente(String nomeUtente) {
		TypedQuery<Ordine> query = em.createQuery("SELECT o FROM Ordine o, Utente u WHERE o MEMBER OF u.ordini AND u.nomeUtente = ?1 AND o.stato <> ?2", Ordine.class);
		query.setParameter(1, nomeUtente);
		query.setParameter(2, "aperto");
		return query.getResultList();
	}
	
	public List<Ordine> ricercaOrdini() {
		return em.createNamedQuery("ricercaOrdini", Ordine.class).getResultList();
	}
	
	public List<Ordine> ricercaOrdiniChiusi() {
		return em.createNamedQuery("ricercaOrdiniChiusi", Ordine.class).getResultList();
	}
	
	public List<Ordine> ricercaOrdiniEvasi() {
		return em.createNamedQuery("ricercaOrdiniEvasi", Ordine.class).getResultList();
	}

	public boolean evasioneOrdine(Long id) {
		Ordine o = this.ricercaOrdine(id);
		List<RigaOrdine> righe = o.getRighe();
		for (RigaOrdine r : righe) {
			Long idProdotto = r.getIdProdotto();
			Prodotto p = em.find(Prodotto.class, idProdotto);
			if (r.getQuantitaProdotto() > p.getQuantita())
				return false;
		}
		for (RigaOrdine r : righe) {
			Long idProdotto = r.getIdProdotto();
			Prodotto p = em.find(Prodotto.class, idProdotto);
			Integer quantita = r.getQuantitaProdotto();
			p.diminuzioneQuantita(quantita);
		}
		o.setStato("evaso");
		o.setDataEvasione(new Date());
		return true;
	}

	public boolean annullamentoOrdine(String nomeUtente, Long id) {
		Utente u = em.find(Utente.class, nomeUtente);
		Ordine o = this.ricercaOrdine(id);
		if (o.getStato().equals("chiuso")) {
			u.rimozioneOrdine(id);
			em.remove(o);
			return true;
		}
		return false;
	}

}