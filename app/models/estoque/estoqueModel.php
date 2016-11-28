<?php
/**
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class estoqueModel{
	private $id;
	private $produto;
	private $nivelestoque;
	private $quantidade_total;
	private $lotes = Array();
	private $logEntradas = Array();
	
	//set
	public function setId($id)
	{
		$this->id = $id;
	}
	public function setProduto(produtosModel $produto)
	{
		$this->produto = $produto;
	}

	public function setNivelEstoque(nivelEstoqueModel $nivelestoque)
	{
		$this->nivelestoque = $nivelestoque;
	}

	public function setQuantidadeTotal($quantidade_total)
	{
		$this->quantidade_total = $quantidade_total;
	}
	public function setLotes($lotes)
	{
		$this->lotes = $lotes;
	}
	public function addLote(lotesModel $lote)
	{
		array_push($this->lotes, $lote);
	}
	public function setLogEntrada($logEntradas)
	{
		$this->logEntradas = $logEntradas;
	}

	//get
	public function getId()
	{
		return $this->id;
	}
	public function getProduto()
	{
		return $this->produto;
	}
	public function getNivelEstoque()
	{
		return $this->nivelestoque;
	}

	public function getLogEntrada()
	{
		return $this->logEntradas;
	}

	/**
	 * retorna a quantidade total do produto em estoque relacionada à unidade de medida 
	 * que está sendo controlada
	 * @return double
	 * */
	public function getQuantidadeTotal()
	{	
		$valorUndEstoque = 0;
		//para cada lote de um produto no estoque
		foreach ($this->lotes as $lotes){
			//obtem cada localização deste lote para pegar as quantidades relativas a unidade de medida
			foreach ($lotes->getLocalizacao() as $localizacao){
				$fatorUnidadeLote = $localizacao->getUnidadeMedidaEstoque()->getFator(); // fator relacionada a unidade de medida do estoque
				$qtdLoteLocal = $localizacao->getQuantidade(); //quantidade do lote por localização
				if(localizacoes::ARMAZEM == $localizacao->getLocalizacao())
				{
					$fator = $this->getProduto()->getUnidadeMedidaParaEstoque()->getFator();
					if($this->getProduto()->getUnidadeMedidaParaEstoque()->getId() != $localizacao->getUnidadeMedidaEstoque()->getId()){
						$qtd = ($qtdLoteLocal * $localizacao->getUnidadeMedidaEstoque()->getFator()) / $fator;
					}else
						$qtd = ($qtdLoteLocal * $fator) / $localizacao->getUnidadeMedidaEstoque()->getFator();
					
				}else
				if(localizacoes::PRATELEIRA == $localizacao->getLocalizacao())
				{
					$fator = $this->getProduto()->getUnidadeMedidaParaVenda()->getFator();

					if($this->getProduto()->getUnidadeMedidaParaEstoque()->getId() != $localizacao->getUnidadeMedidaEstoque()->getId()){
						$qtd = ($qtdLoteLocal * $localizacao->getUnidadeMedidaEstoque()->getFator()) / $fator;
					}else
						$qtd = ($qtdLoteLocal * $fator) / $localizacao->getUnidadeMedidaEstoque()->getFator();

				}else
				if(localizacoes::DESCARTADOS == $localizacao->getLocalizacao())
				{

					$fator = $this->getProduto()->getUnidadeMedidaParaEstoque()->getFator();

					if($this->getProduto()->getUnidadeMedidaParaEstoque()->getId() != $localizacao->getUnidadeMedidaEstoque()->getId()){
						$qtd = ($qtdLoteLocal * $localizacao->getUnidadeMedidaEstoque()->getFator()) / $fator;
					}else
						$qtd = ($qtdLoteLocal * $fator) / $localizacao->getUnidadeMedidaEstoque()->getFator();

				}


				// $valorUndEstoque += ((double)$qtdLoteLocal * (double)$fatorUnidadeLote) / $fator;
				$valorUndEstoque += $qtd;//(double)$qtdLoteLocal / $fator;
			}
		}

		$this->quantidade_total = $valorUndEstoque;

		return $this->quantidade_total;
	}


	public function getLotes()
	{
		return $this->lotes;
	}




	/**
	 * retorna a quantidade total do produtos entrados no estoque
	 * que está sendo controlada
	 * @return double
	 * */
	public function getQuantidadeEntradas()
	{	
		$qtdEntrada = 0;
		foreach($this->logEntradas as $entrada)
		{
			$fator = $this->getProduto()->getUnidadeMedidaParaEstoque()->getFator();
			if($this->getProduto()->getUnidadeMedidaParaEstoque()->getId() != $entrada->getUnidadeMedidaEstoque()->getId()){
				$qtd = ($entrada->getQuantidade() * $entrada->getUnidadeMedidaEstoque()->getFator()) / $fator;
			}else{

				$qtd = ($entrada->getQuantidade() * $fator) / $entrada->getUnidadeMedidaEstoque()->getFator();
			}
			// echo '<pre>';
			// print_r($entrada->getUnidadeMedidaEstoque());
			// echo '</pre>';

			$qtdEntrada += $qtd;
		}
		return $qtdEntrada;
	}



}