<?php
/**
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class logTransferenciaLoteModel{
	private $id;
	private $usuario;
	private $produtolote;
	private $localizacao = localizacoes::ARMAZEM;
	private $quantidade;
	private $unidademedida;
	private $observacoes;
	private $aprovado = true;
	private $ultimaAtualizacao;
	
	public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getUsuario(){
		return $this->usuario;
	}

	public function setUsuario(usuariosModel $usuario){
		$this->usuario = $usuario;
	}

	public function getProdutoLote(){
		return $this->produtolote;
	}

	public function setProdutoLote(lotesModel $produtolote){
		$this->produtolote = $produtolote;
	}

	public function getLocalizacao(){
		return $this->localizacao;
	}

	public function setLocalizacao($localizacao){
		$this->localizacao = $localizacao;
	}

	public function armazenar()
	{
		$this->localizacao = localizacoes::ARMAZEM; 
	}

	public function emprateleirar()
	{
		$this->localizacao = localizacoes::PRATELEIRA; 
	}

	public function descartar()
	{
		$this->localizacao = localizacoes::DESCARTADOS;
	}

	public function getQuantidade(){
		return $this->quantidade;
	}

	public function setQuantidade($quantidade){
		$this->quantidade = $quantidade;
	}

	public function getUnidademedida(){
		return $this->unidademedida;
	}

	public function setUnidademedida($unidademedida){
		$this->unidademedida = $unidademedida;
	}

	public function getObservacoes(){
		return $this->observacoes;
	}

	public function setObservacoes($observacoes){
		$this->observacoes = $observacoes;
	}

	public function getAprovado(){
		return $this->aprovado;
	}

	public function setAprovado($aprovado){
		$this->aprovado = $aprovado;
	}

	public function getUltimaAtualizacao(){
		return $this->ultimaAtualizacao;
	}

	public function setUltimaAtualizacao($ultimaAtualizacao){
		$this->ultimaAtualizacao = $ultimaAtualizacao;
	}



}
