<?php
/**
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class login extends Controller{
	public function __construct(){
		parent::__construct();
		if(!isset($_SESSION['ntentativaLogin']))
			$_SESSION['ntentativaLogin'] = 0;

		//echo $_SESSION['login_adm']['token'];
	}

	/********************************************/
	/****PÁGINAS****/


	/**
	*Página index
	*/
	public function index()
	{
		$data = array(
			'titlePage' => 'Login',
			'keywords' => '',
			'description' => ''
		);

		$this->load->view('login',$data);
	}



	



	/**
	* login
	*@return boolean | json
	* Validação dos campos formulário
	*/
	public function logar()
	{
		$login = isset($_POST['login']) ? filter_var($_POST['login']) : '';
		$senha = isset($_POST['senha']) ? filter_var($_POST['senha']) : '';
		$captcha = isset($_POST['captcha']) ? filter_var($_POST['captcha']) : '';

		//validação dos dados
		$this->load->library('dataValidator', null, true);
		$this->load->dataValidator->set('Login', $login, 'login')->is_required();
		$this->load->dataValidator->set('Senha', $senha, 'senha')->is_required();
		if ($this->load->dataValidator->validate())
		{
			if($_SESSION['ntentativaLogin'] >=5)
			{
			    if (empty($_SESSION['captcha']) || trim(strtolower($captcha)) != $_SESSION['captcha']) 
			    {
			    	$error = array(
						'errorcaptcha'=>'Código incorreto',
						'captcha' => TRUE
					);
					echo json_encode($error);
			    }else
			    {
			    	echo $this->validLogin($login, $senha);
			    }
			}else{
				echo $this->validLogin($login,$senha);
			}
		}
		else{
			echo json_encode($this->load->dataValidator->get_errors());
		}
	}

	private function validLogin($login, $senha)
	{
		
		$this->load->model('funcionarios/usuariosModel');
		$this->load->dao('configuracoes/niveisAcessoDao');
		$this->load->dao('configuracoes/modulosDao');
		$this->load->dao('configuracoes/modulos/modulosModel');
		$usuariosModel = new usuariosModel();
		$usuariosModel->setLogin($login);
		$usuariosModel->setSenha($senha);

		$this->load->dao('loginDao');
		$loginDao = new loginDao();
		$usuariosModel = $loginDao->validLogin($usuariosModel);




		if($usuariosModel == null){
			$_SESSION['ntentativaLogin']++;
			$error = array(
				'error'=>'Login incorreto',
				'captcha' => FALSE
			);
			return json_encode($error);
		}else
		{
			$modulosDao = new modulosDao();
			$modulosModel = $modulosDao->listar();

			$niveisAcessoDao = new niveisAcessoDao();
			$usuariosModel->setNivelAcesso($niveisAcessoDao->getNivelAcesso($usuariosModel->getNivelAcesso(), $modulosModel));

			$_SESSION['user'] = serialize($usuariosModel);
			return true;
		}
	}








	/**
	* Cria o captcha caso o número de tentativas de login falhos seja maior ou igual a 5
	*/
	public function captcha()
	{
		$captcha = new captcha();
		if($_SESSION['ntentativaLogin'] >= 5)
		{
			$captcha->CreateImage();

		}else
			echo false;
	}

	/**
	*verifica números de tentativa falhas de login
	*/
	public function verificaNTentativaLogin()
	{
		if($_SESSION['ntentativaLogin'] >= 5)
			echo true;
		else
			echo false;
	}


	/**
	* Encerra a sessão
	*/
	public function sair()
	{
		session_destroy();
		header('Location: '.URL.'login');
	}
	

}