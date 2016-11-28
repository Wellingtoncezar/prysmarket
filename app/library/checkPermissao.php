<?php
/**
*@author Wellington cezar - wellington-cezar@hotmail.com
*/
if(!defined('URL')) die('Acesso negado');
class checkPermissao extends Library{
	private  $permissoes = null;
	private $lastArray = Array();
	private $lastType ;
	public function __construct(){
		parent::__construct();
		$this->lastType = 'modulo';
	}

	private function searchInModule($modulo, $slug)
	{
		foreach ($modulo as $key => $value) 
		{
			if($value->getUrl() == $slug && $value->getAcesso() == true)
			{
				$this->lastArray = $value;
				return true;
			}
			
		}
		return false;
	}
	private function searchInPage($pagina, $slug)
	{
		foreach ($pagina as $key => $value) 
		{
			if($value->getUrl() == $slug && $value->getAcesso() == true)
			{
				$this->lastArray = $value;
				return true;
			}
			
		}
		return false;
	}
	private function searchInAction($action, $slug)
	{
		foreach ($action as $key => $value) 
		{
			if($value->getUrl() == $slug && $value->getAcesso() == true)
			{
				$this->lastArray = $value;
				
				return true;
			}
			
		}
		return false;
	}

	private function checkpermissaoAcesso($slug)
	{
		if($this->searchInModule($this->lastArray, $slug)){
			$this->lastType = 'modulo';
			return true;
		}

		if(method_exists($this->lastArray, 'getModulos')){
			if($this->searchInModule($this->lastArray->getModulos(), $slug)){
				$this->lastType = 'modulo';
				return true;
			}
		}

		if(method_exists($this->lastArray, 'getPaginas')){
			if($this->searchInPage($this->lastArray->getPaginas(), $slug)){
				$this->lastType = 'pagina';
				return true;
			}
		}
				
		if(method_exists($this->lastArray, 'getActions')){
			if($this->searchInAction($this->lastArray->getActions(), $slug)){
				$this->lastType = 'action';
				return true;
			}
		}
		
		return false;
	}

	/**
	* Checa a permissão da página
	*/
	public function check($redirect = true, $url = '')
	{	
		$this->lastType = 'modulo';
		//verifica se está logado, se existe usuário na sessão
		if($redirect== true && !isset($_SESSION['user']) ){
			session_destroy();
			header('Location: '.URL.'login');
			return false;
		}

		if(!isset($_SESSION['user']) && $redirect == false )
		{
			return false;
		}

		if(unserialize($_SESSION['user'])->getNivelAcesso()->gettipoPermissao() != tipopermissao::ADMINISTRADOR){
			$this->permissoes = unserialize($_SESSION['user'])->getNivelAcesso()->getPermissoes();
			$this->lastArray = $this->permissoes;	
			
		}
		else
			return true;


		$this->load->url = new url($url);
		$retorno = false;

		// print_r($this->load->url->getCurrentUrl());
		//se for diferente da tela inicial 
		if(!empty($this->load->url->getUrl())){
			//percorre todos os segmentos da url par verificação da permissão

			foreach ($this->load->url->getUrl() as $key => $value) 
			{
				
				if(empty($this->lastArray)){
					break;
				}
				if($this->lastType == 'action'){
					break;
				}
				// //verifica a permissão e define o retorno
				if($this->checkpermissaoAcesso($value) == true){
					$retorno = true;
				}
				else{
					$retorno = false;
					break;
				}

			}
		}else{
			$retorno = true;
		}
		// echo $this->lastType;

		//se o retorno for false
		if($retorno == false)
		{	
			// e o redirecionamento for true, faz o redirecionamento e para tudo o que for executado depois do redirecionamento
			if($redirect == true){
				header('Location:'.URL.'acesso_negado');
				exit;
			}else{
				return false;
			}
		}else
			return true;
		// var_dump($retorno);		
	}

}
