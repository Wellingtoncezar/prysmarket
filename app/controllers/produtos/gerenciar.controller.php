<?php
/*
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class gerenciar extends Controller{
	public function __construct(){
		parent::__construct();
		$this->load->dao('fornecedores/fornecedoresDao');
		$this->load->dao('produtos/produtosDao');
		$this->load->dao('produtos/marcasDao');
		$this->load->dao('produtos/categoriasDao');
		$this->load->dao('produtos/unidademedidaDao');
		$this->load->model('produtos/produtosModel');
		$this->load->dao('produtos/iConsultaProduto');
		$this->load->dao('produtos/consultaPorId');
		$this->load->dao('produtos/precosDao');

	}


	/*---------------------------
	- PÁGINAS
	=============================*/
	/**
	*Página index
	*/
	public function index()
	{
		try{

			$saveRouter = new saveRouter;
			$saveRouter->saveModule();
			$saveRouter->saveAction();
			$this->load->checkPermissao->check();

			$produtosDao = new produtosDao();
			$produtos = $produtosDao->listar(); 
			$data = array(
				'titlePage' => 'Produtos',
				'produtos' => $produtos
			);
			
			$this->load->view('includes/header',$data);
			$this->load->view('produtos/home',$data);
			$this->load->view('includes/footer',$data);
		}catch(dbException $e)
		{
			$this->http->response($e->getMessageError());
		}
	}

	public function cadastrar()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();

		$data = array(
			'titlePage' => 'Cadastrar Produtos'
		);

		//marcas -- obtendo a lista das marcas
		$marcas = new marcasDao;
		$data['marcas']=$marcas->listar();

		//categorias -- obtendo a lista das categorias
		$categorias = new categoriasDao;
		$data['categorias']=$categorias->listar();

		//unidades de medida -- obtendo a lista das unidades de medida
		$unidademedida = new unidademedidaDao;
		$data['unidademedida']= $unidademedida->listar();

		//fornecedores -- obtendo a lista dos fornecedores
		$fornecedores = new fornecedoresDao;
		$data['fornecedores'] = $fornecedores->listar(Array(status::ATIVO));
		
		$this->load->view('includes/header',$data);
		$this->load->view('produtos/cadastro',$data);
		$this->load->view('includes/footer',$data);
	}

	public function editar()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();

		
		$data = array(
			'titlePage' => 'Editar Produto'
		);
		if($this->load->url->getSegment(3) == false)
			$this->http->redirect(URL.'error404');

		$idProduto = (int) $this->load->url->getSegment(3);
		
		
		$produtosModel = new produtosModel();
		$produtosModel->setId($idProduto);
		$produtos = new produtosDao();
		$produto = $produtos->consultar(new consultaPorId(), $produtosModel, Array(status::ATIVO,status::INATIVO));

		//PRECOS -- Obtendo a lista de preços
		$precosDao = new precosDao();
		$produto->setPrecos($precosDao->listar($produto));


		foreach($produto->getFornecedores() as $fornecProd)
		{
			$fornec = new fornecedoresModel();
			//fornecedores dao -- consultando o fornecedor
			$fornecedores = new fornecedoresDao;
			$fornec = $fornecedores->consultar($fornecProd->getFornecedor());
			$fornecProd->setFornecedor($fornec);
		}

		//marcas -- obtendo a lista de marcas e os dados da marca do produto
		$marcas = new marcasDao;
		$produto->setMarca($marcas->consultar($produto->getMarca()));
		$data['marcas'] = $marcas->listar();

		//categorias -- obtendo a lista das categorias
		$categorias = new categoriasDao;
		$produto->setCategoria($categorias->consultar($produto->getCategoria()));
		$data['categorias'] = $categorias->listar();

		//fornecedores -- obtendo a lista dos fornecedores
		$fornecedores = new fornecedoresDao;
		$data['fornecedores'] = $fornecedores->listar(Array(status::ATIVO));

		//unidades de medida -- obtendo a lista das unidades de medida
		$unidademedida = new unidademedidaDao;
		$data['unidademedida']= $unidademedida->listar();
		

		$data['produto'] = $produto;

		$this->load->view('includes/header',$data);
		$this->load->view('produtos/editar',$data);
		$this->load->view('includes/footer',$data);
	}




	public function precos()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();

		$this->load->model('produtos/produtosModel');
		$this->load->dao('produtos/produtosDao');
		$this->load->dao('produtos/iConsultaProduto');
		$this->load->dao('produtos/consultaPorId');
		$this->load->dao('produtos/precosDao');

		$idProduto = (int) $this->load->url->getSegment(3);
		$data = array(
			'titlePage' => 'Tabela de preços',
			'idProduto' => $idProduto,
			'dataFormat' => new dataFormat()
		);
		$produtosModel = new produtosModel();
		$produtosModel->setId($idProduto);

		//obtendo o produto
		$produtos = new produtosDao();
		$produtosModel = $produtos->consultar(new consultaPorId(), $produtosModel, Array(status::ATIVO, status::INATIVO));

		//obtendo os preços do produto
		$precos = new precosDao();

		//setando os preços no produto
		$produtosModel->setPrecos($precos->listar($produtosModel));
		$data['produtoPreco'] = $produtosModel;
		

		$this->load->view('includes/header',$data);
		$this->load->view('produtos/precos/home',$data);
		$this->load->view('includes/footer',$data);
	}

	public function cadastrarprecos()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();
		$this->load->checkPermissao->check();

		$idProduto = (int) $this->load->url->getSegment(3);
		$data = array(
			'titlePage' => 'Cadastrar preços',
			'idProduto' => $idProduto
		);


		$this->load->view('includes/header',$data);
		$this->load->view('produtos/precos/cadastro',$data);
		$this->load->view('includes/footer',$data);
	}

	public function inserirPreco()
	{
		try {
			if(!$this->load->checkPermissao->check(false,URL.'produtos/gerenciar/cadastrarprecos')){
				$this->http->response("Ação não permitida");
				return false;
			}
			//carregamento das classes
			$this->load->library('dataFormat');
			$this->load->library('dataValidator');
			$this->load->model('produtos/produtosModel');
			$this->load->model('produtos/precosModel');
			$this->load->dao('produtos/precosDao');
			$dataFormat = new dataFormat();

			//obtenção dos dados
			$idProduto 	= (int) $this->http->getRequest('idProduto');
			$preco 		= (double) $dataFormat->formatar($this->http->getRequest('preco'),'decimal','banco');
			$padrao 	= (Boolean) $this->http->getRequest('padrao');
			$de 		= $dataFormat->formatar($this->http->getRequest('de'), 'data', 'banco');
			$ate 		= $dataFormat->formatar($this->http->getRequest('ate'), 'data', 'banco');


			//validação dos dados
			$dataValidator = new dataValidator();
			$dataValidator->set('Preço', $preco, 'preco')->is_required()->is_num();
			if($padrao == false)
			{
				$dataValidator->set('De', $de, 'de')->is_required()->is_date('Y-m-d');
				$dataValidator->set('Até', $ate, 'ate')->is_required()->is_date('Y-m-d');
			}
			
			if ($dataValidator->validate())
			{

				//PRODUTOS
				$produtosModel = new produtosModel();
				$produtosModel->setId($idProduto);
				
				//PREÇOS MODEL
				$precosModel = new precosModel();
				$precosModel->setPreco($preco);
				$precosModel->setDataInicio($de);
				$precosModel->setDataFim($ate);
				$precosModel->setPadrao($padrao);
				$precosModel->setDataCadastro(date('Y-m-d'));

				//PRECOS DAO
				$precosDao = new precosDao();
				$this->http->response($precosDao->inserir($produtosModel, $precosModel));
			}else
		    {
				$todos_erros = $dataValidator->get_errors();
				$this->http->response(json_encode($todos_erros));
		    }

		} catch (dbException $e) {
			$this->http->response($e->getMessageError());
		}
	}






	

	public function inserir()
	{
		try {
			if(!$this->load->checkPermissao->check(false,URL.'produtos/gerenciar/cadastrar'))
			{
				$this->http->response("Ação não permitida");
				return false;
			}


			$this->load->model('produtos/produtosModel');
			$this->load->model('produtos/marcasModel');
			$this->load->model('produtos/categoriasModel');
			$this->load->model('produtos/unidadeMedidaModel');
			$this->load->model('produtos/unidadeMedidaEstoqueModel');
			$this->load->model('produtos/precosModel');
			$this->load->dao('produtos/precosDao');
			$this->load->dao('produtos/produtosDao');


			//obtendo os dados enviados pela requisição
			$dataFormat = new dataFormat();
			$foto 					= isset($_FILES['foto']) ? $_FILES['foto'] : '';
			$nome 					= $this->http->getRequest('nome');
			$codigoBarra 			= $this->http->getRequest('codigobarras');
			$marca 					= $this->http->getRequest('marca');
			$categoria 				= $this->http->getRequest('categoria');
			$preco 					= $dataFormat->formatar($this->http->getRequest('preco'), 'decimal', 'banco');
	        $controlarvalidade 		= (boolean)$this->http->getRequest('controlarvalidade');
	        $descricao 				= $this->http->getRequest('descricao');
			$fornecedores 			= (Array) $this->http->getRequest('fornecedores');
			$unidadeMedidaEstoque 	= $this->http->getRequest('unidadeMedidaEstoque');


			//validação dos dados
			$dataValidator = new dataValidator();
			$dataValidator->set('Nome', $nome, 'nome')->is_required()->min_length(3);
			$dataValidator->set('Marca', $marca, 'marca')->is_required();
			$dataValidator->set('Categoria', $categoria, 'categoria')->is_required();
			$dataValidator->set('Preço', $preco, 'preco')->is_required();
			$dataValidator->set('Fornecedores', $fornecedores, 'fornecedores')->is_required();//->min_value(3);
			$dataValidator->set('Unidades de medidas de estoque', $unidadeMedidaEstoque, 'unidadeMedidaEstoque')->is_required();


			if ($dataValidator->validate())
			{
				//PRODUTOS
				$produtosModel = new produtosModel();

				//MARCA
				$marcasModel = new marcasModel();
				$marcasModel->setId($marca);

				//CATEGORIA
				$categoriasModel = new categoriasModel();
				$categoriasModel->setId($categoria);
				


				//UNIDADES DE MEDIDA DE ESTOQUE -- obtendo as unidades de medida 
				foreach ($unidadeMedidaEstoque as $unidade)
				{
					$unidade['venda'] = $unidade['venda']== "true" ? true : false;
					$unidade['estoque'] = $unidade['estoque']== "true" ? true : false;
					$fator = $dataFormat->formatar($unidade['fator_unidade'],'decimal','banco');

					$unidadeMedidaModel = new unidadeMedidaModel();
					$unidadeMedidaModel->setId($unidade['idUnidadeMedida']);

					$unidadeMedidaEstoqueModel = new unidadeMedidaEstoqueModel();
					$unidadeMedidaEstoqueModel->setId($unidade['idUnidadeMedidaProduto']);
					$unidadeMedidaEstoqueModel->setUnidadeMedida($unidadeMedidaModel);
					$unidadeMedidaEstoqueModel->setParaVenda($unidade['venda']);
					$unidadeMedidaEstoqueModel->setParaEstoque($unidade['estoque']);
					$unidadeMedidaEstoqueModel->setFator($fator);
					$unidadeMedidaEstoqueModel->setOrdem($unidade['ordem']);
					//adicionando as unidades no produto
					$produtosModel->addUnidadeMedidaEstoque($unidadeMedidaEstoqueModel);
				}

				//FORNECEDORES -- obtendo os fonecedores do produto
				$this->load->model('fornecedores/fornecedoresModel');
				$this->load->model('produtos/produtofornecedorModel');
				foreach ($fornecedores as $fornec)
				{
					$fornecedoresModel = new fornecedoresModel();
					$fornecedoresModel->setId($fornec['id']);
					
					$produtofornecedorModel = new produtofornecedorModel();
					$produtofornecedorModel->setFornecedor($fornecedoresModel);
					//adicionando os fornecedores ao produto
					$produtosModel->addFornecedor($produtofornecedorModel);
				}

				//IMAGEM
				//obtendo a imagem e realizando o upload
				$nome_foto = '';
				if(!empty($foto))
				{
					//obtendo o tamanho do corte da imagem
					$cropValues = Array(
						'w' => $this->http->getRequest('w'),
						'h' => $this->http->getRequest('h'),
						'x1' => $this->http->getRequest('x1'),
						'y1' => $this->http->getRequest('y1')
					);

					//definindo o tamanho da imagem após o upload
					$tamanho = Array(
						'p' =>array(
								'w' => 404,
								'h' =>  158
							)
					);
					//renomeando a imagem
					$nome_foto = md5(date('dmYHis'));

					// realizando o upload
					$this->load->library('uploadFoto');
					$upload = new uploadFoto('produtos', $foto, $nome_foto, $tamanho, $cropValues);
					$nome_foto = $upload->getNomeArquivo();
				
				}

				// //FORMATAÇÃO DOS DADOS
				$produtosModel->setFoto($nome_foto);
				$produtosModel->setCodigoBarra($codigoBarra);
				$produtosModel->setNome($nome);
				$produtosModel->setMarca($marcasModel);
				$produtosModel->setCategoria($categoriasModel);
				$produtosModel->setDescricao($descricao);
				$produtosModel->setDataCadastro(date('Y-m-d h:i:s'));
				//definindo controle de validade
				if($controlarvalidade == true)
					$produtosModel->ativarControleValidade();
				else
					$produtosModel->desativarControleValidade();
				//adicionando o preço padrão ao produto
				$precosModel = new precosModel();
				$precosModel->setPreco($preco);
				$precosModel->setPadrao(true);
				

				//PRODUTOS DAO
				$produtosDao = new produtosDao();
				$produtosModel = $produtosDao->inserir($produtosModel);
				//se o produto foi cadastrado corretamente
				if($produtosModel->getId() != '')
				{
					//insere o preço padrão
					$precosDao = new precosDao();
					$precosDao->inserir($produtosModel, $precosModel);
					$this->http->response(true);
				}
			}else
		    {
		    	//exibindo os erro de validação
				$this->http->response(json_encode($dataValidator->get_errors()));
		    }
		}catch (dbException $e) {
			//se tiver algum erro no banco
			$this->http->response($e->getMessageError());
			return false;
		}catch (Exception $e) {
			//se tiver algum erro no envio da imagem ou outro erro que seja diferente do banco
			$this->http->response($e->getMessage());
			return false;
		}

	}




	public function atualizar()
	{
		try {
			if(!$this->load->checkPermissao->check(false,URL.'produtos/gerenciar/editar'))
			{
				$this->http->response("Ação não permitida");
				return false;
			}


			$this->load->model('produtos/produtosModel');
			$this->load->model('produtos/marcasModel');
			$this->load->model('produtos/categoriasModel');
			$this->load->model('produtos/unidadeMedidaModel');
			$this->load->model('produtos/unidadeMedidaEstoqueModel');
			$this->load->model('produtos/precosModel');
			$this->load->dao('produtos/precosDao');
			$this->load->dao('produtos/produtosDao');


			//obtendo os dados enviados pela requisição
			$dataFormat = new dataFormat();
			$id_produto 			= (int) $this->http->getRequest('id_produto');
			$foto 					= isset($_FILES['foto']) ? $_FILES['foto'] : '';
			$nome_foto 				= filter_var($this->http->getRequest('nome_foto'));
			$nome 					= $this->http->getRequest('nome');
			$codigoBarra 			= $this->http->getRequest('codigobarras');
			$marca 					= $this->http->getRequest('marca');
			$categoria 				= $this->http->getRequest('categoria');
			$preco 					= $dataFormat->formatar($this->http->getRequest('preco'), 'decimal', 'banco');
	        $controlarvalidade 		= (boolean)$this->http->getRequest('controlarvalidade');
	        $descricao 				= $this->http->getRequest('descricao');
			$fornecedores 			= (Array) $this->http->getRequest('fornecedores');
			$unidadeMedidaEstoque 	= $this->http->getRequest('unidadeMedidaEstoque');


			//validação dos dados
			$dataValidator = new dataValidator();
			$dataValidator->set('Nome', $nome, 'nome')->is_required()->min_length(3);
			$dataValidator->set('Marca', $marca, 'marca')->is_required();
			$dataValidator->set('Categoria', $categoria, 'categoria')->is_required();
			$dataValidator->set('Preço', $preco, 'preco')->is_required();
			$dataValidator->set('Fornecedores', $fornecedores, 'fornecedores')->is_required();//->min_value(3);
			$dataValidator->set('Unidades de medidas de estoque', $unidadeMedidaEstoque, 'unidadeMedidaEstoque')->is_required();


			if ($dataValidator->validate())
			{
				//PRODUTOS
				$produtosModel = new produtosModel();

				//MARCA
				$marcasModel = new marcasModel();
				$marcasModel->setId($marca);

				//CATEGORIA
				$categoriasModel = new categoriasModel();
				$categoriasModel->setId($categoria);
				
				//UNIDADES DE MEDIDA DE ESTOQUE -- obtendo as unidades de medida 
				foreach ($unidadeMedidaEstoque as $unidade)
				{
					$unidade['venda'] = $unidade['venda']== "true" ? true : false;
					$unidade['estoque'] = $unidade['estoque']== "true" ? true : false;
					$fator = $dataFormat->formatar($unidade['fator_unidade'],'decimal','banco');

					$unidadeMedidaModel = new unidadeMedidaModel();
					$unidadeMedidaModel->setId($unidade['idUnidadeMedida']);

					$unidadeMedidaEstoqueModel = new unidadeMedidaEstoqueModel();
					$unidadeMedidaEstoqueModel->setId($unidade['idUnidadeMedidaProduto']);
					$unidadeMedidaEstoqueModel->setUnidadeMedida($unidadeMedidaModel);
					$unidadeMedidaEstoqueModel->setParaVenda($unidade['venda']);
					$unidadeMedidaEstoqueModel->setParaEstoque($unidade['estoque']);
					$unidadeMedidaEstoqueModel->setFator($fator);
					$unidadeMedidaEstoqueModel->setOrdem($unidade['ordem']);
					//adicionando as unidades no produto
					$produtosModel->addUnidadeMedidaEstoque($unidadeMedidaEstoqueModel);
				}

				//FORNECEDORES -- obtendo os fonecedores do produto
				$this->load->model('fornecedores/fornecedoresModel');
				$this->load->model('produtos/produtofornecedorModel');
				foreach ($fornecedores as $fornec)
				{
					$fornecedoresModel = new fornecedoresModel();
					$fornecedoresModel->setId($fornec['id']);
					
					$produtofornecedorModel = new produtofornecedorModel();
					$produtofornecedorModel->setId($fornec['idFornecedorProduto']);
					$produtofornecedorModel->setFornecedor($fornecedoresModel);
					//adicionando os fornecedores ao produto
					$produtosModel->addFornecedor($produtofornecedorModel);
				}

				//IMAGEM
				//obtendo a imagem e realizando o upload
				if(!empty($foto))
				{
					//obtendo o tamanho do corte da imagem
					$cropValues = Array(
						'w' => $this->http->getRequest('w'),
						'h' => $this->http->getRequest('h'),
						'x1' => $this->http->getRequest('x1'),
						'y1' => $this->http->getRequest('y1')
					);

					//definindo o tamanho da imagem após o upload
					$tamanho = Array(
						'p' =>array(
								'w' => 404,
								'h' =>  158
							)
					);
					//renomeando a imagem
					if($nome_foto == '')
						$nome_foto = md5(date('dmYHis'));

					// realizando o upload
					$this->load->library('uploadFoto');
					$upload = new uploadFoto('produtos', $foto, $nome_foto, $tamanho, $cropValues);
					$nome_foto = $upload->getNomeArquivo();
				
				}

				// //FORMATAÇÃO DOS DADOS
				$produtosModel->setId($id_produto);
				$produtosModel->setFoto($nome_foto);
				$produtosModel->setCodigoBarra($codigoBarra);
				$produtosModel->setNome($nome);
				$produtosModel->setMarca($marcasModel);
				$produtosModel->setCategoria($categoriasModel);
				$produtosModel->setDescricao($descricao);
				$produtosModel->setDataCadastro(date('Y-m-d h:i:s'));
				//definindo controle de validade
				if($controlarvalidade == true)
					$produtosModel->ativarControleValidade();
				else
					$produtosModel->desativarControleValidade();
				//adicionando o preço padrão ao produto
				$precosModel = new precosModel();
				$precosModel->setPreco($preco);
				$precosModel->setPadrao(true);



				//PRODUTOS DAO
				$produtosDao = new produtosDao();
				$produtosDao->atualizar($produtosModel);

				$precosDao = new precosDao();
				$precosDao->atualizarPrecoPadrao( $precosModel, $produtosModel );

				$this->http->response(true);
			}else
		    {
		    	//exibindo os erro de validação
				$this->http->response(json_encode($dataValidator->get_errors()));
		    }
		}catch (dbException $e) {
			//se tiver algum erro no banco
			$this->http->response($e->getMessageError());
			return false;
		}catch (Exception $e) {
			//se tiver algum erro no envio da imagem ou outro erro que seja diferente do banco
			$this->http->response($e->getMessage());
			return false;
		}
	}

	/**
	 * Ãção de atualizar status
	 */
	public function atualizarStatus()
	{
		$idProduto = intval($_POST['id']);
		$status = filter_var($_POST['status']);

		//PRODUTOS MODEL
		$this->load->model('produtos/produtosModel');
		$produtosModel = new produtosModel();
		$produtosModel->setId( $idProduto );
		$produtosModel->setStatus( status::getAttribute($status));

		//PRODUTOS DAO
		$this->load->dao('produtos/produtosDao');
		$produtosDao = new produtosDao();
		echo $produtosDao->atualizarStatus($produtosModel);

	}

	public function excluir()
	{
		$saveRouter = new saveRouter;
		$saveRouter->saveModule();
		$saveRouter->saveAction();

		if(!$this->load->checkPermissao->check(false,URL.'produtos/gerenciar/excluir'))
		{
			echo "Ação não permitida";
			return false;
		}
		$this->atualizarStatus();
	}
}

/**
*
*class: home
*
*location : controllers/home.controller.php
*/
