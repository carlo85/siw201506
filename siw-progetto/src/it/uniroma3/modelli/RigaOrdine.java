package it.uniroma3.modelli;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;

@Entity
public class RigaOrdine {
	
	@Id
	@Column(nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private Long idProdotto;
	
	@Column(nullable = false)
	private String nomeProdotto;
	
	@Column(nullable = false)
	private Float prezzoProdotto;

	@Column(nullable = false)
	private Integer quantitaProdotto = 1;
	
	public RigaOrdine() {
		
	}
	
	public RigaOrdine(Prodotto prodotto, Integer quantitaProdotto) {
		this.idProdotto = prodotto.getId();
		this.nomeProdotto = prodotto.getNome();
		this.prezzoProdotto = prodotto.getPrezzo();
		this.quantitaProdotto = quantitaProdotto;
	}
	
	public Long getId() {
		return id;
	}

	public Long getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(Long idProdotto) {
		this.idProdotto = idProdotto;
	}

	public String getNomeProdotto() {
		return nomeProdotto;
	}

	public void setNomeProdotto(String nomeProdotto) {
		this.nomeProdotto = nomeProdotto;
	}

	public Float getPrezzoProdotto() {
		return prezzoProdotto;
	}

	public void setPrezzoProdotto(Float prezzoProdotto) {
		this.prezzoProdotto = prezzoProdotto;
	}

	public Integer getQuantitaProdotto() {
		return quantitaProdotto;
	}

	public void setQuantitaProdotto(Integer quantitaProdotto) {
		this.quantitaProdotto = quantitaProdotto;
	}

}