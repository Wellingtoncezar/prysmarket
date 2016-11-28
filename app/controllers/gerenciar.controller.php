<?php
/**
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class gerenciar extends Controller{
	public function __construct(){
		parent::__construct();
		$this->load->dao('estoque/estoqueDao');
		$this->load->dao('estoque/iListagemEstoque');
		$this->load->dao('estoque/listarArmazem');

	}


	/********************************************/
	/****PÁGINAS****/
	

	/**
	*Página index
	*/

	public function index()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();


		$estoqueDao = new estoqueDao();
		$estoque = $estoqueDao->listar(new listarArmazem());

		$data = array(
			'titlePage' => '',
			'produtosBaixos' => $estoque
		);


		
		$this->load->view('includes/header',$data);
		$this->load->view('home',$data);
		$this->load->view('includes/footer',$data);
	}

}


/**
*
*class: home
*
*location : controllers/home.controller.php
*/
