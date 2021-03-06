<?php
/*
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class gerenciar extends Controller{
	public function __construct(){
		parent::__construct();
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
			'titlePage' => 'Descartados - Estoque'
		);
		
		$this->load->view('includes/header',$data);
		$this->load->view('estoque/descartados/home',$data);
		$this->load->view('includes/footer',$data);
	}

	public function getjsonlote()
	{
		$this->load->dao('estoque/estoqueDao');
		$this->load->dao('estoque/iListagemEstoque');
		$this->load->dao('estoque/listarDescartados');
		$estoqueDao = new estoqueDao();
		$estoque = $estoqueDao->listar(new listarDescartados());
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
						'linkAlterarLimites' => URL."estoque/descartados/gerenciar/limitar",
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
							// 'linkemprateleirar' => URL."estoque/descartados/gerenciar/emprateleirar",
							// 'linkdescartar' => URL."estoque/descartados/gerenciar/descartar"
				    	);

				array_push($aux['lotes'], $aux2);
			}

			array_push($_arEstoque, $aux);
        endforeach;

        return json_encode($_arEstoque);
	}



	/**
	* Define o limite máximo e mínimo do estoque
	*/
	public function limitar()
	{
		$this->load->dao('estoque/estoqueDao');
		$this->load->model('estoque/estoqueModel');
		$this->load->model('estoque/nivelEstoqueModel');
		
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
			$nivelEstoqueModel->descartar();
			
			$estoqueModel->setNivelEstoque($nivelEstoqueModel);
			
			$estoqueDao = new estoqueDao();
			$this->http->response($estoqueDao->limitar($estoqueModel));
		}else
	    {
			$todos_erros = $this->load->dataValidator->get_errors();
			$this->http->response(json_encode($todos_erros));
	    }
	}



	

}

