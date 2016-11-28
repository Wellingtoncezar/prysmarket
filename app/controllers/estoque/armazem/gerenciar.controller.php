<?php
/*
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class gerenciar extends Controller{
	public function __construct(){
		parent::__construct();

		$this->load->model('estoque/estoqueModel');
		$this->load->model('estoque/lotesModel');
		$this->load->model('estoque/localizacaoLoteModel');
		$this->load->model('produtos/unidadeMedidaEstoqueModel');
		$this->load->model('estoque/nivelEstoqueModel');
		$this->load->dao('estoque/estoqueDao');
		$this->load->dao('produtos/produtosDao');
		$this->load->dao('estoque/iListagemEstoque');
		$this->load->dao('estoque/listarArmazem');
		$this->load->library('dataValidator');

	}


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
			'titlePage' => 'Armazém - Estoque'
		);
		
		$this->load->view('includes/header',$data);
		$this->load->view('estoque/armazem/home',$data);
		$this->load->view('includes/footer',$data);
	}

	public function entrada()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();

		$data = array(
			'titlePage' => 'Entrada no Armazém - Estoque'
		);

		
		$produtosDao = new produtosDao();
		$produtos = $produtosDao->listarAtivos();
		$data['produtos'] = $produtos;
		
		$this->load->view('includes/header',$data);
		$this->load->view('estoque/armazem/cadastro',$data);
		$this->load->view('includes/footer',$data);
	}

	public function getjsonlote()
	{
		$estoqueDao = new estoqueDao();
		$estoque = $estoqueDao->listar(new listarArmazem());
		$this->http->response($this->getJsonEstoque($estoque));
	}


	public function getJsonEstoque($estoque)
	{
		$this->load->library('dataformat');
		$dataformat = new dataformat();
		$_arEstoque = Array();

		//loop de listagem de produtos no estoque
		foreach ($estoque as $estoqueProd):
			$foto = $estoqueProd->getProduto()->getFoto() != '' ? URL.'skin/uploads/produtos/p/'.$estoqueProd->getProduto()->getFoto() : URL.'skin/img/imagens/forn.jpg';
			$aux = array(
				    	'id'=> $estoqueProd->getId(),
				    	'codigobarras' => $estoqueProd->getProduto()->getCodigoBarra(),
						'produto'=> $estoqueProd->getProduto()->getNome(),
						'foto'=> $foto,
						'qtdtotal'=> $dataformat->formatar($estoqueProd->getQuantidadeTotal(),'decimalinteiro').' '.$estoqueProd->getProduto()->getUnidadeMedidaParaEstoque()->getUnidadeMedida()->getNome(),
						'unformatedqtdtotal'=> (int)$estoqueProd->getQuantidadeTotal(),
						'min'=> (int)$estoqueProd->getNivelEstoque()->getQuantidadeMinima(),
						'max'=> (int)$estoqueProd->getNivelEstoque()->getQuantidadeMaxima(),
						'minUnformated'=> $estoqueProd->getNivelEstoque()->getQuantidadeMinima(),
						'maxUnformated'=> $estoqueProd->getNivelEstoque()->getQuantidadeMaxima(),
						'nivel'=> $estoqueProd->getQuantidadeTotal(),//(($estoqueProd->getQuantidadeTotal()- $estoqueProd->getNivelEstoque()->getQuantidadeMinima()) * 100) / ($estoqueProd->getNivelEstoque()->getQuantidadeMaxima() - $estoqueProd->getNivelEstoque()->getQuantidadeMinima()),
						'progressclass' => "progress-bar-success",
						'linkAlterarLimites' => URL."estoque/armazem/gerenciar/limitar",
						'acoes'=> "",
				      	'lotes'=> array()
				    );
			$arrLotes = array();


			//loop de listagem dos lotes
			foreach ($estoqueProd->getLotes() as $lotes){
				
				
		        $aux2 = array(
		        			'idEstoque' => $estoqueProd->getId(),
				        	'id' => $lotes->getId(),
				        	'idProduto' => $estoqueProd->getId(),
							'codigo' => $lotes->getCodigoLote(),
							'codigogti' => ($lotes->getCodigoBarrasGti() != '') ? $lotes->getCodigoBarrasGti() : $estoqueProd->getProduto()->getCodigoBarra(),
							'codigogst' => $lotes->getCodigoBarrasGst(),
							'validade' => $dataformat->formatar($lotes->getDataValidade(),'data'),
							'quantidade' => $lotes->getQuantidadeLotePorLocalizacao(). ' '.$lotes->getLocalizacao()[0]->getUnidadeMedidaEstoque()->getUnidadeMedida()->getNome(),
							'qtdConvertido' => $lotes->getQuantidadeLotePorLocalizacao(),
							'nomeUnidadeConvertido' => $lotes->getLocalizacao()[0]->getUnidadeMedidaEstoque()->getUnidadeMedida()->getNome(),
							'qtdNaoConvertido' => $lotes->getQuantidadeLotePorLocalizacao(false),
							'acoes' => "",
							'idUnidadeMedidaPraVenda' => $estoqueProd->getProduto()->getUnidadeMedidaParaVenda()->getId(),
							'nomeUnidadeMedida' => $estoqueProd->getProduto()->getUnidadeMedidaParaVenda()->getUnidadeMedida()->getNome(),
							'linkemprateleirar' => URL."estoque/armazem/gerenciar/emprateleirar",
							'linkdescartar' => URL."estoque/armazem/gerenciar/descartar"
				    	);

				array_push($aux['lotes'], $aux2);
			}

			array_push($_arEstoque, $aux);
        endforeach;

        return json_encode($_arEstoque);
	}


	//trasferencia de lotes para a prateleira
	public function emprateleirar()
	{
		

		$idEstoque				= (int) $this->http->getRequest('idEstoque');
		$idlote 				= (int) $this->http->getRequest('idlote');
		$idUnidadeMedidaVenda  	= (int) $this->http->getRequest('idUnidadeMedidaVenda');
		$quantidade 			= (double) $this->http->getRequest('quantidade');
		$observacoes 			= $this->http->getRequest('observacoes');
		
		//validação dos dados
		$dataValidator= new dataValidator();
		$dataValidator->set('Quantidade', $quantidade, 'quantidade')->is_required()->is_num();
		if ($dataValidator->validate())
		{
			//UNIDADE MEDIDA ESTOQUE MODEL
			$unidadeMedidaEstoqueModel = new unidadeMedidaEstoqueModel();
			$unidadeMedidaEstoqueModel->setId($idUnidadeMedidaVenda);

			//LOCALIZACAO LOTE MODEL
			$localizacaoLoteModel = new localizacaoLoteModel();
			$localizacaoLoteModel->setUnidadeMedidaEstoque($unidadeMedidaEstoqueModel);
			$localizacaoLoteModel->setQuantidade($quantidade);
			$localizacaoLoteModel->setObservacoes($observacoes);
			$localizacaoLoteModel->emprateleirar();

			//LOTES MODEL
			$lotesModel = new lotesModel();
			$lotesModel->setId($idlote);
			$lotesModel->addLocalizacao($localizacaoLoteModel);

			//ESTOQUE MODEL
			$estoqueModel = new estoqueModel();
			$estoqueModel->setId($idEstoque);
			$estoqueModel->addLote($lotesModel);

			//ESTOQUE DAO
			$estoqueDao = new estoqueDao();	
			$lotePertoVencer = $estoqueDao->verificaDataValidade($estoqueModel);
			if($lotePertoVencer != null)
			{
				$mensagem = "O lote '".$lotePertoVencer->getCodigoLote()."' está com validade mais próxima, trasfira-o primeiro";
				$this->http->response($mensagem);
			}else
			{
				if(!$estoqueDao->verificaQuantidadeTransferencia($estoqueModel, localizacoes::ARMAZEM)){
					$mensagem = "Quantidade insuficiente para realizar a transferência";
					$this->http->response($mensagem);
				}else{
					$this->http->response($estoqueDao->transferir($estoqueModel, localizacoes::ARMAZEM));
				}
			}
			
				
		}else
	    {
			$todos_erros = $dataValidator->get_errors();
			$this->http->response(json_encode($todos_erros));
	    }
	}


	/**
	* Define o limite máximo e mínimo do estoque
	*/
	public function limitar()
	{
	
		$this->load->library('dataformat');
		$dataformat = new dataformat();
		$idEstoque 	= (int) $this->http->getRequest('idEstoque');
		$qtdMax 	= $dataformat->formatar($this->http->getRequest('qtdMax'), 'decimal', 'banco');
		$qtdMin 	= $dataformat->formatar($this->http->getRequest('qtdMin'), 'decimal', 'banco');

		//validação dos dados
		$this->load->library('dataValidator', null, true);
		$this->load->dataValidator->set('Quantidade mínima', $qtdMin, 'qtdMin')->is_required()->is_num();
		$this->load->dataValidator->set('Quantidade máxima', $qtdMax, 'qtdMax')->is_required()->is_num();
		if ($this->load->dataValidator->validate())
		{
			$estoqueModel = new estoqueModel();
			$estoqueModel->setId($idEstoque);

			$nivelEstoqueModel = new nivelEstoqueModel();
			$nivelEstoqueModel->setQuantidadeMinima($qtdMin);
			$nivelEstoqueModel->setQuantidadeMaxima($qtdMax);
			
			
			$estoqueModel->setNivelEstoque($nivelEstoqueModel);
			
			$estoqueDao = new estoqueDao();
			$this->http->response($estoqueDao->limitar($estoqueModel));
		}else
	    {
			$todos_erros = $this->load->dataValidator->get_errors();
			$this->http->response(json_encode($todos_erros));
	    }
	}



	public function descartar()
	{
		try{

			$idEstoque				= (int) $this->http->getRequest('idEstoque');
			$idlote 				= (int) $this->http->getRequest('idlote');
			$idUnidadeMedidaVenda  	= (int) $this->http->getRequest('idUnidadeMedidaVenda');
			$quantidade 			= (double) $this->http->getRequest('quantidade');
			$observacoes 			= $this->http->getRequest('observacoes');
			
			//validação dos dados
			$dataValidator= new dataValidator();
			$dataValidator->set('Quantidade', $quantidade, 'quantidade')->is_required()->is_num();
			if ($dataValidator->validate())
			{
				//UNIDADE MEDIDA ESTOQUE MODEL
				$unidadeMedidaEstoqueModel = new unidadeMedidaEstoqueModel();
				$unidadeMedidaEstoqueModel->setId($idUnidadeMedidaVenda);

				//LOCALIZACAO LOTE MODEL
				$localizacaoLoteModel = new localizacaoLoteModel();
				$localizacaoLoteModel->setUnidadeMedidaEstoque($unidadeMedidaEstoqueModel);
				$localizacaoLoteModel->setQuantidade($quantidade);
				$localizacaoLoteModel->setObservacoes($observacoes);
				$localizacaoLoteModel->descartar();

				//LOTES MODEL
				$lotesModel = new lotesModel();
				$lotesModel->setId($idlote);
				$lotesModel->addLocalizacao($localizacaoLoteModel);

				//ESTOQUE MODEL
				$estoqueModel = new estoqueModel();
				$estoqueModel->setId($idEstoque);
				$estoqueModel->addLote($lotesModel);

				//ESTOQUE DAO
				$estoqueDao = new estoqueDao();	
				$lotePertoVencer = $estoqueDao->verificaDataValidade($estoqueModel);
				
				if(!$estoqueDao->verificaQuantidadeTransferencia($estoqueModel, localizacoes::ARMAZEM)){
					$mensagem = "Quantidade insuficiente para realizar o descarte";
					$this->http->response($mensagem);
				}else{
					$usuario = unserialize($_SESSION['user']);
					$estoqueDao->transferir($estoqueModel, localizacoes::ARMAZEM);
					$estoqueDao->registraLogTransferencia($estoqueModel, $usuario);
					$this->http->response(true);
				}
			}else
		    {
				$todos_erros = $dataValidator->get_errors();
				$this->http->response(json_encode($todos_erros));
		    }
		}catch(dbException $e){
			$this->http->response($e->getMessageError());
		}
	}


	public function listarEstoqueBaixo()
	{
		$estoqueDao = new estoqueDao();
		$estoque = $estoqueDao->listar(new listarArmazem());
		$prod = '';
		$corpomensagem = '';
		foreach ($estoque as $est){
			if($est->getQuantidadeTotal() < $est->getNivelEstoque()->getQuantidadeMinima())
			{
				$corpomensagem .= '
					<p><strong>Produto:<strong>'.$est->getProduto()->getNome().' | Qtd.: '.$est->getQuantidadeTotal().' '.$est->getProduto()->getUnidadeMedidaParaEstoque()->getUnidadeMedida()->getNome().'</p>
				';
			}
		}




		//obtendo o corpo do email
		$templateFactory = new templateFactory();
		$corpoEmail = $templateFactory->getEmail("emailPadrao", array('assunto'=>'Produtos com estoque baixo', 'mensagem' => $corpomensagem) );

		//enviando os emails
		$sendMail = new sendMail();
		
		//email do sistema
		$sendMail->send('wellington-cezar@hotmail.com', 'Produtos com estoque baixo', $corpoEmail);//
	}



}

