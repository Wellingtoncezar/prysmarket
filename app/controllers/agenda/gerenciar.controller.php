	<?php
/**
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
	 * Página index
	 */
	public function index()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();
		$data = array(
			'titlePage' => 'Agenda de fornecedores'
		);
		
		$this->load->view('includes/header',$data);
		$this->load->view('agenda/home',$data);
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
			'titlePage' => 'Cadastrar agenda'
		);
		

		$this->load->dao('fornecedores/fornecedoresDao');
		$fornecedores = new fornecedoresDao();
		$data['fornecedores'] = $fornecedores->listar(Array(status::ATIVO));

		$this->load->view('includes/header',$data);
		$this->load->view('agenda/cadastro',$data);
		$this->load->view('includes/footer',$data);
	}


	public function listar()
	{
		$ano = isset($_POST['ano']) ? intval($_POST['ano']) : date('Y');
		if($ano !=  0)
		{
			$agendaList = array();

			//AGENDA DAO
			$this->load->dao('agendas/agendaDao');
			$agendaDao = new agendaDao();
			$agendas = $agendaDao->listar($ano);

			//FORMATAÇÃO DOS DADOS
			$this->load->library('dataFormat', null, true);
			foreach ($agendas as $agenda) 
			{
				list ($ano,$mes,$dia) = explode('-', $agenda->getData());
				
				$aux = array(
					'date' => $this->formatarData($agenda->getData()),
					'title' => '',
					'link' => URL.'agenda/gerenciar/listarCompromissosAgendados/'.$dia.'/'.$mes.'/'.$ano,
					'color' => 'green'
				);
				array_push($agendaList, $aux);
				//unset($aux);
			}

			echo json_encode($agendaList);
		}else
			echo json_encode(array());

		//echo '[{"date":"2\/2\/2015","title":"Getting Contacts Barcelona - test1","link":"http:\/\/gettingcontacts.com\/events\/view\/barcelona","color":"red"}]';
	}

	



	/*----------------------------
	- AÇÕES
	=============================*/
	public function notificar()
	{
		//AGENDA DAO
		$this->load->dao('agendas/agendaDao');
		$agendaDao = new agendaDao();
		$agendamentos = $agendaDao->getDataNotificar();
		$notificacoes = array();


		$this->load->library('dataFormat', null, true);

		if(!empty($agendamentos))
		{
			foreach ($agendamentos as $agenda)
			{
				$aux['data'] = $this->load->dataFormat->formatar($agenda->getData(),'data');
				$aux['titulo'] = $agenda->getTitulo();
				$aux['nome_fornecedor'] = $agenda->getFornecedor()->getNomeFantasia();
				array_push($notificacoes, $aux);
			}
		}
		$this->http->response(json_encode($notificacoes));
	}




	private function formatarData($data)
	{
		$data = explode('-',$data);
		$dia = ltrim($data[2], "0");
		$mes = ltrim($data[1], "0");
		$ano = ltrim($data[0], "0");

		return $dia.'/'.$mes.'/'.$ano;
	}
	
	/**
	 * Ação do cadastrar
	 */
	public function inserir()
	{
		$dataformat = new dataformat();

		$fornecedor 	= (int) $this->http->getRequest('fornecedores');
		$data 			= $dataformat->formatar($this->http->getRequest('data'), 'data', 'banco');
		$titulo 		= $this->http->getRequest('titulo');
		$observacoes 	= $this->http->getRequest('observacoes');


		//validação dos dados
		$dataValidator = new dataValidator();
		$dataValidator->set('Fornecedor', $fornecedor, 'fornecedores')->is_required();
		$dataValidator->set('Data', $data, 'data')->is_required();
		$dataValidator->set('Título', $titulo, 'titulo')->is_required();


		if ($dataValidator->validate())
		{
			//FORNECEDOR
			$this->load->model('fornecedores/fornecedoresModel');
			$fornecedoresModel = new fornecedoresModel();
			$fornecedoresModel->setId($fornecedor);
			
			//AGENDA
			$this->load->model('agenda/agendaModel');
			$agendaModel = new agendaModel();
			$agendaModel->setTitulo($titulo);
			$agendaModel->setData($data);
			$agendaModel->setObservacoes($observacoes);
			$agendaModel->setDataCadastro(date('Y-m-d h:i:s'));
			$agendaModel->setFornecedor($fornecedoresModel);


			//AGENDA DAO
			$this->load->dao('agendas/agendaDao');
			$agendaDao = new agendaDao();
			if($agendaDao->inserir($agendaModel))
			{

				//FORNECEDORES DAO -- consultando os dados do fornecedor para obter o email
				$this->load->dao('fornecedores/fornecedoresDao');
				$fornecedoresDao = new fornecedoresDao();
				$fornecedor = $fornecedoresDao->consultar($fornecedoresModel);

				//ENVIO DOS EMAILS
				$dataAgendamento = $dataformat->formatar($data, 'data');
				//corpo da mensagem
				$corpomensagem = '
					<p>Novo Agendamento cadastrado para o dia '.$dataAgendamento.'</p>
				';

				//obtendo o corpo do email
				$templateFactory = new templateFactory();
				$corpoEmail = $templateFactory->getEmail("emailPadrao", array('assunto'=>'Novo agendamento marcado', 'mensagem' => $corpomensagem) );

				//enviando os emails
				$sendMail = new sendMail();
				//email do fornecedor
				$sendMail->send(trim($fornecedor->getEmail()), 'Novo agendamento marcado', $corpoEmail);
				//email do sistema
				$sendMail->send('prysmarket@gmail.com', 'Novo agendamento marcado', $corpoEmail);

				$this->http->response(true);
			}
		}else
	    {
			$todos_erros = $dataValidator->get_errors();
			$this->http->response(json_encode($todos_erros));
	    }

	}


	public function listarCompromissosAgendados()
	{
		$dia = $this->load->url->getSegment(3);
		$mes = $this->load->url->getSegment(4);
		$ano = $this->load->url->getSegment(5);
		
		$this->load->dao('agendas/agendaDao');
		$agendaDao = new agendaDao();
		$agendaCompromissos = $agendaDao->listar($ano, $mes, $dia);
		$data = array(
			"compromissosagendados" => $agendaCompromissos,
			'dataFormat' => new dataFormat()
		);
		$this->load->view('agenda/compromissos_agendados',$data);

	}
	public function adiarCompromissos()
	{

		$this->load->model('agenda/agendaModel');
		$this->load->dao('agendas/agendaDao');

		$id_agenda = isset($_POST['id_agenda']) ? filter_var(trim($_POST['id_agenda'])) : '';
		$data = isset($_POST['data']) ? filter_var(trim($_POST['data'])) : '';

		$agendaModel = new agendaModel();
		$agendaModel->setId($id_agenda);
		$agendaModel->setData($data);

		$agendaDao = new agendaDao();
		if($agendaDao->adiarCompromissos($agendaModel))
		{
			//consultando os dados da agenda pra poder obter os dados do fornecedor
			$agendaModel = $agendaDao->consultar($agendaModel);
	
			//FORNECEDORES DAO -- consultando os dados do fornecedor para obter o email
			$this->load->dao('fornecedores/fornecedoresDao');
			$fornecedoresDao = new fornecedoresDao();
			$fornecedor = $fornecedoresDao->consultar($agendaModel->getFornecedor());

			//ENVIO DOS EMAILS
			$dataformat = new dataformat();
			$dataAgendamento = $dataformat->formatar($data, 'data');
			//corpo da mensagem
			$corpomensagem = '
				<p>Agendamento remarcado para o dia '.$dataAgendamento.' do fornecedor '.$fornecedor->getNomeFantasia().'</p>
			';

			//obtendo o corpo do email
			$templateFactory = new templateFactory();
			$corpoEmail = $templateFactory->getEmail("emailPadrao", array('assunto'=>'Alteração da data de agendamento', 'mensagem' => $corpomensagem) );

			//enviando os emails
			$sendMail = new sendMail();
			//email do fornecedor
			$sendMail->send($fornecedor->getEmail(), 'Alteração da data de agendamento', $corpoEmail);
			//email do sistema
			$sendMail->send('prysmarket@gmail.com', 'Mudança de data do agendamento', $corpoEmail);

			$this->http->response(true);
		}
	}


}