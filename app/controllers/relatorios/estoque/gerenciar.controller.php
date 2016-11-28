<?php
/*
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class gerenciar extends Controller{
	public function __construct(){
		parent::__construct();
	}


	/*---------------------------
	- PÁGINAS
	=============================*/


	/**
	*Página index
	*/
	public function index()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();

		$data = array(
			'titlePage' => 'Relatórios do estoque'
		);
		
		$this->load->view('includes/header',$data);
		$this->load->view('relatorios/estoque/home',$data);
		$this->load->view('includes/footer',$data);
	}


	public function consultaRelatorio()
	{
		try {
			$this->load->dao('estoque/estoqueDao');
			$this->load->dao('estoque/iListagemEstoque');
			$this->load->dao('estoque/listarDescartados');
			$this->load->dao('estoque/logEntradaEstoqueDao');
			$this->load->dao('produtos/produtosDao');
			$this->load->model('estoque/logEntradaEstoqueModel');
			$this->load->model('produtos/unidadeMedidaModel');
			$this->load->model('produtos/unidadeMedidaEstoqueModel');
			$this->load->model('produtos/produtosModel');
			
			$estoqueDao = new estoqueDao();
			$estoque = $estoqueDao->listar(new listarDescartados());

			$arr_prod = array();



			$json = Array();
			foreach ($estoque as $estoqueProd)
			{
				// echo '<p>'.$estoqueProd->getProduto()->getNome().': ';
				// echo ''.$estoqueProd->getQuantidadeTotal().'<p>';
				// echo $estoqueProd->getProduto()->getUnidadeMedidaParaEstoque()->getUnidadeMedida()->getNome();

				$logEntradaEstoqueModel = new logEntradaEstoqueModel();
				$logEntradaEstoqueModel->setEstoque($estoqueProd);

				$logEntradaEstoqueDao = new logEntradaEstoqueDao();
				$log = $logEntradaEstoqueDao->consultaLogEntrada($logEntradaEstoqueModel);


				$estoqueProd->setLogEntrada($log);
				// echo $estoqueProd->getQuantidadeEntradas();

				$aux = Array();
				$aux['produto'] = $estoqueProd->getProduto()->getNome();
				$aux['qtdDescarte'] = $estoqueProd->getQuantidadeTotal();
				$aux['qtdtotal'] = $estoqueProd->getQuantidadeEntradas();
				$aux['qtdProduto'] = $estoqueProd->getQuantidadeTotal();
				$aux['unidadeMedida'] = $estoqueProd->getProduto()->getUnidadeMedidaParaEstoque()->getUnidadeMedida()->getNome();
				$aux['media'] = '';//$dataformat->formatar(($produtoVendido->getQtdTotalProdutos() / $produtoVendido->getQtdVendas()), 'decimalinteiro';

				array_push($json, $aux);

			}


			$this->http->response(json_encode($json));

		} catch (dbException $e) {
			$this->http->response($e->getMessageError());
		}
	} 
	
}

/**
*
*class: home
*
*location : controllers/home.controller.php
*/
