<?php
/**
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class logEntradaEstoqueModel{
	private $id;
	private $estoque;
	private $quantidade;
	private $dataEntrada;
	private $unidadeMedidaEstoque;
	
	//SET
	public function setId($id)
	{
		$this->id = $id;
	}
	public function setEstoque(estoqueModel $estoque)
	{
		$this->estoque = $estoque;
	}

	public function setUnidadeMedidaEstoque(unidadeMedidaEstoqueModel $unidadeMedidaEstoque)
	{
		$this->unidadeMedidaEstoque = $unidadeMedidaEstoque;
	}
	
	public function setQuantidade($quantidade)
	{
		$this->quantidade = $quantidade; 
	}

	public function setDataEntrada($dataEntrada)
	{
		$this->dataEntrada = $dataEntrada;
	}
	

	//GET
	public function getId()
	{
		return $this->id;
	}
	public function getEstoque()
	{
		return $this->estoque;
	}
	public function getUnidadeMedidaEstoque()
	{
		return $this->unidadeMedidaEstoque;
	}
	
	public function getQuantidade()
	{
		return $this->quantidade;
	}
	
	public function getDataEntrada()
	{
		return $this->dataEntrada;
	}
}
