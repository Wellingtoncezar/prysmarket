<?php
/**
*@author Wellington cezar - wellington-cezar@hotmail.com
*/
if(!defined('URL')) die('Acesso negado');
class gerenciar extends Controller{
	private $error = array();
	private $countError = 0;
	
	public function __construct(){
		parent::__construct();
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

		$data = array(
			'titulo' => 'Módulos do sistema',
		);

		$this->load->dao('configuracoes/modulosDao');
		$modulos = new modulosDao();
		$data['modulos'] = $modulos->listar(0);
		
		$this->load->view('includes/header',$data);
		$this->load->view('configuracoes/modulos/home',$data);
		$this->load->view('includes/footer',$data);

	}


	/********************************************/
	/****FUNÇÕES DE ALTERAÇÕES DE REGISTROS****/

	/**
	* Atualização de um registro
	*/
	public function atualizarNome()
	{

		$tipo = isset($_POST['tipo']) ? filter_var($_POST['tipo']) : '';
		$id = isset($_POST['id']) ? filter_var($_POST['id']) : '';
		$campo = isset($_POST['campo']) ? filter_var($_POST['campo']) : '';
		$valor = isset($_POST['valor']) ? filter_var($_POST['valor']) : '';

		$this->load->dao('configuracoes/modulosDao');
		$modulosDao = new modulosDao();

		if($tipo == 'modulo' || $tipo == 'submodulo')
		{
			$this->load->model('configuracoes/modulos/modulosModel');
			$modulosModel = new modulosModel();
			$modulosModel->setId($id);
			$modulosModel->setNome($valor);
			$this->http->response($modulosDao->atualizarNomeModulo($modulosModel));
		}
		else
		if($tipo == 'pagina')
		{
			$this->load->model('configuracoes/modulos/paginasModel');
			$paginaModel = new paginasModel();
			$paginaModel->setId($id);
			$paginaModel->setNome($valor);
			$this->http->response($modulosDao->atualizarNomePagina($paginaModel));
		}else
		if($tipo == 'acao')
		{
			$this->load->model('configuracoes/modulos/actionsModel');
			$actionModel = new actionsModel();
			$actionModel->setId($id);
			$actionModel->setNome($valor);
			$this->http->response($modulosDao->atualizarNomeAction($actionModel));
		}
	}



	public function atualizarStatus()
	{
		$tipo = isset($_POST['tipo']) ? filter_var($_POST['tipo']) : '';
		$id = isset($_POST['id']) ? filter_var($_POST['id']) : '';
		$campo = isset($_POST['campo']) ? filter_var($_POST['campo']) : '';
		$valor = isset($_POST['valor']) ? filter_var($_POST['valor']) : '';

		$this->load->dao('configuracoes/modulosDao');
		$modulosDao = new modulosDao();

		if($tipo == 'modulo' || $tipo == 'submodulo')
		{
			$this->load->model('configuracoes/modulos/modulosModel');
			$modulosModel = new modulosModel();
			$modulosModel->setId($id);
			if($valor == 'ATIVO')
				$modulosModel->ativar();
			else
				$modulosModel->inativar();
			$this->http->response($modulosDao->atualizarStatusModulo($modulosModel));
		}
		else
		if($tipo == 'pagina')
		{
			$this->load->model('configuracoes/modulos/paginasModel');
			$paginaModel = new paginasModel();
			$paginaModel->setId($id);
			if($valor == 'ATIVO')
				$paginaModel->ativar();
			else
				$paginaModel->inativar();
			$this->http->response($modulosDao->atualizarStatusPagina($paginaModel));
		}else
		if($tipo == 'acao')
		{
			$this->load->model('configuracoes/modulos/actionsModel');
			$actionModel = new actionsModel();
			$actionModel->setId($id);
			if($valor == 'ATIVO')
				$actionModel->ativar();
			else
				$actionModel->inativar();
			$this->http->response($modulosDao->atualizarStatusAction($actionModel));
		}
	}

	public function atualizarStatusSelecao()
	{
		$tipo = isset($_POST['tipo']) ? filter_var($_POST['tipo']) : '';
		$id = isset($_POST['id']) ? filter_var($_POST['id']) : '';
		$campo = isset($_POST['campo']) ? filter_var($_POST['campo']) : '';
		$valor = isset($_POST['valor']) ? filter_var($_POST['valor']) : '';

		$this->load->dao('configuracoes/modulosDao');
		$modulosDao = new modulosDao();

		if($tipo == 'modulo' || $tipo == 'submodulo')
		{
			$this->load->model('configuracoes/modulos/modulosModel');
			$modulosModel = new modulosModel();
			$modulosModel->setId($id);
			if($valor == 'ATIVO')
				$modulosModel->ativarSelecao();
			else
				$modulosModel->inativarSelecao();
			$this->http->response($modulosDao->atualizarStatusSelecaoModulo($modulosModel));
		}
		else
		if($tipo == 'pagina')
		{
			$this->load->model('configuracoes/modulos/paginasModel');
			$paginaModel = new paginasModel();
			$paginaModel->setId($id);
			if($valor == 'ATIVO')
				$paginaModel->ativarSelecao();
			else
				$paginaModel->inativarSelecao();
			$this->http->response($modulosDao->atualizarStatusSelecaoPagina($paginaModel));
		}else
		if($tipo == 'acao')
		{
			$this->load->model('configuracoes/modulos/actionsModel');
			$actionModel = new actionsModel();
			$actionModel->setId($id);
			if($valor == 'ATIVO')
				$actionModel->ativarSelecao();
			else
				$actionModel->inativarSelecao();
			$this->http->response($modulosDao->atualizarStatusSelecaoAction($actionModel));
		}
	}




	/**
	* Atualiza a posição dos menus para visualização
	*/
	public function updatePosition()
	{
		$positions = $_POST['ordem'];
		$this->load->dao('configuracoes/modulosDao');
		$modulosDao = new modulosDao();
		$this->http->response($modulosDao->updatePosition($positions));
	}
}
