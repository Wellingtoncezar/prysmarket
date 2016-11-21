<?php
/**
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class gerenciar extends Controller{
	public function __construct(){
		parent::__construct();
		//DAO
		//configuracoes
		$this->load->dao('configuracoes/niveisAcessoDao');
		$this->load->dao('configuracoes/modulosDao');
		//funcionarios
		$this->load->dao('funcionarios/IListagemFuncionarios');
		$this->load->dao('funcionarios/consultaFuncionarioPorId');
		$this->load->dao('funcionarios/consultaFuncionarioPorUsuario');
		$this->load->dao('funcionarios/listarAtivos');
		$this->load->dao('funcionarios/funcionariosDao');
		//usuarios
		$this->load->dao('funcionarios/iUsuarios');
		$this->load->dao('funcionarios/consultaUsuarioPorId');
		$this->load->dao('funcionarios/usuariosDao');

		//MODEL
		//configuracoes
		$this->load->model('configuracoes/modulos/modulosModel');
		$this->load->model('configuracoes/niveis_acesso/niveisAcessoModel');
		//usuarios
		$this->load->model('funcionarios/usuariosModel');
		
	}


	/*---------------------------
	- PÁGINAS
	=============================*/

	/**
	 * Página index
	 */
	public function index()
	{	
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();

		$data = array(
			'titlePage' => 'Usuários'
		);
		//usuarios Dao - listagem dos usuários
		$usuarios = new usuariosDao();
		$usuariosModel = $usuarios->listar();

		foreach ($usuariosModel as $user)
		{
			//modulos Dao - listagem dos módulos
			$modulosDao = new modulosDao();
			$modulosModel = $modulosDao->listar();

			//niveis acesso Dao - consultando o nivel de acesso
			$niveisAcessoDao = new niveisAcessoDao();
			$user->setNivelAcesso($niveisAcessoDao->getNivelAcesso($user->getNivelAcesso(), $modulosModel));
			
			//funcionarios Dao - consultando os dados do funcionario
			$funcionariosDao = new funcionariosDao();
			$funcionariosModel = $funcionariosDao->consultar(new consultaFuncionarioPorId(), $user->getFuncionario(), array(status::ATIVO, status::INATIVO));

			$user->setFuncionario($funcionariosModel);

		}

		$data['usuarios'] = $usuariosModel;

		$this->load->view('includes/header',$data);
		$this->load->view('funcionarios/usuarios/home', $data);
		$this->load->view('includes/footer',$data);

	}


	/**
	 * Página de cadastro
	 */
	public function cadastrar()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();
		$data = array(
			'titlePage' => 'Cadastrar Usuários',
			'template' => new templateFactory()
		);

		//funcionarios dao
		$funcionarios = new funcionariosDao;
		$data['funcionarios'] = $funcionarios->listar(new listarAtivos());

		//niveis acesso dao
		$niveisAcesso = new niveisAcessoDao;
		$data['niveisAcesso']=$niveisAcesso->listar();
	
		$this->load->view('includes/header',$data);
		$this->load->view('funcionarios/usuarios/cadastro',$data);
		$this->load->view('includes/footer',$data);
	}


	/**
	 * Página de edição
	 */
	public function editar()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();
		$data = array(
			'titlePage' => 'Editar Usuários'
		);

		//ID -- obtendo o id na url -  caso não tenha redireciona para página de erro
		if($this->load->url->getSegment(4) == false)
			$this->http->redirect(URL.'error404');

		$idUsuario = intval($this->load->url->getSegment(4));
		
		//USUARIO MODEL
		$usuariosModel = new usuariosModel();
		$usuariosModel->setId($idUsuario);

		//USUARIO DAO -- consultando o usuário a partir do id
		$usuariosDao = new usuariosDao();
		$usuariosModel = $usuariosDao->consultar(new consultaUsuarioPorId(), $usuariosModel, array(status::ATIVO, status::INATIVO));


		//Funcionários - consultando o funcionario a partir do usuário
		$funcionarios = new funcionariosDao;
		$funcionariosModel = $funcionarios->consultar(new consultaFuncionarioPorUsuario($usuariosModel), new funcionariosModel(), array(status::ATIVO, status::INATIVO));
		
		//setando o funcionário em usuário
		$usuariosModel->setFuncionario($funcionariosModel);

		//Nível Acesso - listagem de todos os níveis de acesso
		$niveisAcesso = new niveisAcessoDao;

		$data['usuario'] = $usuariosModel;
		$data['niveisAcesso'] = $niveisAcesso->listar();

		$this->load->view('includes/header',$data);
		$this->load->view('funcionarios/usuarios/editar',$data);
		$this->load->view('includes/footer',$data);
	}





	/*----------------------------
	- AÇÕES
	=============================*/
	/**
	 * Ação do cadastrar
	 */
	public function inserir()
	{
		try{
		    $nivel 			= (int) $this->http->getRequest('nivel');
			$funcionario 	= $this->http->getRequest('funcionario');
			$email 			= $this->http->getRequest('email');
			$login 			= $this->http->getRequest('login');
			$senha 			= $this->http->getRequest('senha');

			//validação dos dados
			$this->load->library('dataValidator',null,true);
			
			$this->load->dataValidator->set('Nível de acesso', $nivel, 'nivel')->is_required();
			$this->load->dataValidator->set('Funcionário', $funcionario, 'funcionario')->is_required();
			$this->load->dataValidator->set('Email', $email, 'email')->is_required()->is_email();
			$this->load->dataValidator->set('Login', $login, 'login')->is_required();
			$this->load->dataValidator->set('Senha', $senha, 'senha')->is_required();
			

			if ($this->load->dataValidator->validate())
			{
				$funcionariosModel = new funcionariosModel();
				$funcionariosModel->setId($funcionario);

				$nivelAcesso = new niveisAcessoModel();
				$nivelAcesso->setId($nivel);

	            //USUARIO
				$usuariosModel = new usuariosModel();
				$usuariosModel->setNivelAcesso($nivelAcesso);
				$usuariosModel->setFuncionario($funcionariosModel);
				$usuariosModel->setEmail($email);
				$usuariosModel->setLogin($login);
				$usuariosModel->setSenha($senha);
				$usuariosModel->setDataCadastro(date('Y-m-d h:i:s'));
	            
				$usuariosDao = new usuariosDao();
				if($usuariosDao->checkFuncionarioDuplicado($funcionariosModel))
					$this->http->response("Funcionário já possui um usuário cadastrado");
				else
					$this->http->response($usuariosDao->inserir($usuariosModel));
			}else
		    {
				$todos_erros = $this->load->dataValidator->get_errors();
				$this->http->response(json_encode($todos_erros));
		    }
		}catch (dbException $e) {
			$this->http->response($e->getMessageError());
		}
	}



	/**
	 * Ação do editar
	 */
	public function atualizar()
	{
		$id_usuario 	= (int) $this->http->getRequest('id_usuario');
		$nivel 			= $this->http->getRequest('nivel');
		$funcionario 	= $this->http->getRequest('funcionario');
		$email 			= $this->http->getRequest('email');

		//validação dos dados
		$this->load->library('dataValidator',null,true);
		$this->load->dataValidator->set('Nível de acesso', $nivel, 'nivel')->is_required();
		// $this->load->dataValidator->set('Funcionário', $funcionario, 'funcionario')->is_required();
		$this->load->dataValidator->set('Email', $email, 'email')->is_required()->is_email();
		
		

		if ($this->load->dataValidator->validate())
		{
			
			$nivelAcesso = new niveisAcessoModel();
			$nivelAcesso->setId($nivel);

            //USUARIO
			$usuariosModel = new usuariosModel();
			$usuariosModel->setId($id_usuario);
			$usuariosModel->setNivelAcesso($nivelAcesso);
			$usuariosModel->setEmail($email);

			//USUARIO DAO
			$usuariosDao = new usuariosDao();
			$this->http->response($usuariosDao->atualizar($usuariosModel));
		}else
	    {
			$todos_erros = $this->load->dataValidator->get_errors();
			$this->http->response(json_encode($todos_erros));
	    }

	}

	/**
	 * Ãção de atualizar status
	 */
	public function atualizarStatus()
	{
		$idUsuario = (int) $this->http->getRequest('id');
		$status = $this->http->getRequest('status');

		//FUNCIONARIO MODEL
		$usuariosModel = new usuariosModel();
		$usuariosModel->setId( $idUsuario );
		$usuariosModel->setStatus( status::getAttribute($status));

		//FUNCIONARIO DAO
		$usuariosDao = new usuariosDao();
		$this->http->response($usuariosDao->atualizarStatus($usuariosModel));
	}

	public function excluir()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();
		$this->atualizarStatus();
	}

}