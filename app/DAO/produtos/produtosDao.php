<?php
/**
 * Classe DAO de Produtos
 * @author Wellington cezar, Diego Hernandes
 */
if(!defined('BASEPATH')) die('Acesso não permitido');
class produtosDao extends Dao{
	private $nomeArquivoFoto;
	private $nUpdates = 0;
	public function __construct(){
		parent::__construct();
	}


	/**
	 * Lista os registros dos produtos
	 * @return Array
	 */
	public function listar($condStatus = array())
	{
		$this->db->clear();
		$this->load->model('produtos/produtosModel');

		$this->load->model('produtos/categoriasModel');
		$this->load->model('produtos/marcasModel');
		$this->load->model('produtos/unidademedidaModel');
		$this->load->model('produtos/unidadeMedidaEstoqueModel');
		$this->load->model('produtos/unidadeMedidaModel');

		$produtos = Array();

		if(empty($condStatus))
		{
			$condStatus = array(
				status::ATIVO,
				status::INATIVO
			);
		}
		
		$cond = "";
		$n = 1;
		foreach ($condStatus as $value) {
			$this->db->setParameter($n,$value); //seta os parametros no sql
			if(count($condStatus) == $n)
				$cond .= "?";
			else
				$cond .= "?,";
			$n++;
		}

		$cond = "A.status_produto in(".$cond.") ";

		$this->db->setTabela('produtos as A');
		$this->db->setCondicao($cond);

		$campos = array('A.id_produto','A.foto_produto', 'A.codigo_barra_gti','A.nome_produto','A.id_marca','A.id_categoria','status_produto');
		if($this->db->select($campos)):
			$result = $this->db->resultAll();
			foreach ($result as $value)
			{
				$produtosModel = new produtosModel();
				$produtosModel->setId($value['id_produto']);
				$produtosModel->setFoto($value['foto_produto']);
				$produtosModel->setCodigoBarra($value['codigo_barra_gti']);
				$produtosModel->setNome($value['nome_produto']);
				$produtosModel->setStatus(status::getAttribute($value['status_produto']));

				$categoriasModel = new categoriasModel();
				$categoriasModel->setId($value['id_categoria']);
				$produtosModel->setCategoria($categoriasModel);
				
				$marcasModel = new marcasModel();
				$marcasModel->setId($value['id_marca']);
				$produtosModel->setMarca($marcasModel);

				$this->consultaUnidadesMedida($produtosModel);
				$this->consultaProdutoFornecedor($produtosModel);

				array_push($produtos, $produtosModel);
				unset($produtosModel);
			}
			return $produtos;
		else:
			return $produtos;
		endif;
	}

	/**
	 * Retorna lista de produtos ativos
	 * @return object [produtosModel]
	 */
	public function listarAtivos()
	{
		$condStatus = array(
			status::ATIVO
		);
		return $this->listar($condStatus);
	}

	/**
	 * Retorna a consulta de um produto
	 * @return object [produtosModel]
	 */

	public function consultar(IConsultaProduto $consultaProduto, produtosModel $produto, $status)
	{
		try {
			$result = $consultaProduto->consultar($this->db, $produto, $status);
			if($result != null):
				$produto = new produtosModel();


				//CATEGORIA
				$this->load->model('produtos/categoriasModel');
				$categoriasModel= new categoriasModel();
				$categoriasModel->setId($result['id_categoria']);

				//MARCA
	            $this->load->model('produtos/marcasModel');
	            $marcasModel= new marcasModel();
				$marcasModel->setId( $result['id_marca'] );

				//PRODUTO
				$produto->setId($result['id_produto']);
				$produto->setFoto($result['foto_produto']);
				$produto->setCodigoBarra($result['codigo_barra_gti']);
				$produto->setNome($result['nome_produto']);
				$produto->setMarca($marcasModel);
				$produto->setCategoria($categoriasModel);
				$produto->setDescricao($result['descricao_produto']);
				$produto->setStatus(status::getAttribute($result['status_produto']));
				$produto->setDataCadastro($result['data_cadastro_produto']);
				if((boolean)$result['data_validade_controlada'])
					$produto->ativarControleValidade();
				else
					$produto->desativarControleValidade();

				$this->consultaUnidadesMedida($produto);
				$this->consultaProdutoFornecedor($produto);
				return $produto;
			else:
				return NULL;
			endif;
		} catch (dbException $e) {
			return $e->getMessageError();
		}
	}


	public function consultaUnidadesMedida(produtosModel $produto)
	{
		$this->db->clear();
		$this->db->setTabela('unidade_medida as A, unidade_medida_produto AS B');
		$this->db->setCondicao("B.id_produto = ? AND A.id_unidade_medida = B.id_unidade_medida");
		$this->db->setParameter(1, $produto->getId());
		if($this->db->select())
		{
			$this->load->model('produtos/unidadeMedidaModel');	
			$this->load->model('produtos/unidadeMedidaEstoqueModel');	
			//UNIDADE DE MEDIDA
			$unidadeMedida = $this->db->resultAll();
			foreach ($unidadeMedida as $unidade)
			{
				$unidadeMedidaModel = new unidadeMedidaModel();
				$unidadeMedidaModel->setId($unidade['id_unidade_medida']);
				$unidadeMedidaModel->setNome($unidade['nome_unidade_medida']);
				$unidadeMedidaEstoqueModel = new unidadeMedidaEstoqueModel();
				$unidadeMedidaEstoqueModel->setId($unidade['id_unidade_medida_produto']);
				$unidadeMedidaEstoqueModel->setUnidadeMedida($unidadeMedidaModel);
				$unidadeMedidaEstoqueModel->setParaVenda((boolean)$unidade['para_venda']);
				$unidadeMedidaEstoqueModel->setParaEstoque((boolean)$unidade['para_estoque']);
				$unidadeMedidaEstoqueModel->setFator((double)$unidade['fator_unidade_medida']);
				$unidadeMedidaEstoqueModel->setOrdem($unidade['ordem']);
				$produto->addUnidadeMedidaEstoque($unidadeMedidaEstoqueModel);
			}
		}
	}



	private function consultaProdutoFornecedor(produtosModel $produto)
	{
		$this->load->model('fornecedores/fornecedoresModel');
		$this->load->model('produtos/produtofornecedorModel');
		
		$this->db->clear();
		$this->db->setTabela('produto_fornecedores');
		$this->db->setCondicao("id_produto = ?");
		$this->db->setParameter(1, $produto->getId());
		if($this->db->select())
		{
			$result = $this->db->resultAll();
			foreach ($result as $fornecprod)
			{
				$fornecedoresModel = new fornecedoresModel();
				$fornecedoresModel->setId($fornecprod['id_fornecedor']);
				
				$produtofornecedorModel = new produtofornecedorModel();
				$produtofornecedorModel->setId($fornecprod['id_produto_fornecedor']);
				$produtofornecedorModel->setFornecedor($fornecedoresModel);
				//adicionando os fornecedores ao produto
				$produto->addFornecedor($produtofornecedorModel);
			}
		}
	}

	


	/**
	 * Insere novos produtos
	 * @return boolean, json
	 */
 	public function inserir(produtosModel $produto)
 	{
 		$data = array(
 			'foto_produto' => $produto->getFoto(),
 			'codigo_barra_gti' => $produto->getCodigoBarra(),
 			'nome_produto' => $produto->getNome(),
 			'id_marca' => $produto->getMarca()->getId(),
 			'id_categoria' => $produto->getCategoria()->getId(),
 			'descricao_produto' => $produto->getDescricao(),
 			'status_produto' => $produto->getStatus(),
 			'data_validade_controlada' => $produto->getControleValidade(),
 			'data_cadastro_produto' => $produto->getDataCadastro()
 		);

 		$this->db->clear();
		$this->db->setTabela('produtos');
		$this->db->insert($data);
		if($this->db->rowCount() > 0)
		{
			$produto->setId($this->db->getUltimoId()); //RETORNA O ID INSERIDO

			//UNIDADE MEDIDA ESTOQUE
			if(!empty($produto->getUnidadeMedidaEstoque()))
			 	$this->atualizaUnidadeMedidaEstoque($produto);

			//FORNECEDORES
			if(!empty($produto->getFornecedores()))
			 	$this->atualizaFornecedores($produto);
			return $produto;
 		}else
 		{
 			throw new Exception($this->db->getError(), 1);

 		}
	}

	/**
	 * Atualiza produtos
	 * @return boolean, json
	 */
 	public function atualizar(produtosModel $produto)
 	{
 		$data = array(
 			'foto_produto' => $produto->getFoto(),
 			'codigo_barra_gti' => $produto->getCodigoBarra(),
 			'nome_produto' => $produto->getNome(),
 			'id_marca' => $produto->getMarca()->getId(),
 			'id_categoria' => $produto->getCategoria()->getId(),
 			'descricao_produto' => $produto->getDescricao(),
 			'data_validade_controlada' => $produto->getControleValidade(),
 		);

 		$this->db->clear();
		$this->db->setTabela('produtos');
		$this->db->setCondicao("id_produto = ?");
		$this->db->setParameter(1, $produto->getId());
		$this->db->update($data);
		//UNIDADE MEDIDA ESTOQUE
	 	$this->atualizaUnidadeMedidaEstoque($produto);

		//FORNECEDORES
	 	$this->atualizaFornecedores($produto);
		return true;
	}



 	/**
 	 * 
 	 * @return void
 	 */
 	private function atualizaUnidadeMedidaEstoque(produtosModel $produto)
	{
		try{
			//excluir
			$naoExcluirUnidade = array();
			foreach ($produto->getUnidadeMedidaEstoque() as $unidade)
			{
				if($unidade->getId() != '')
					array_push($naoExcluirUnidade, $unidade->getId());
			}
			$cond = '';
			if(!empty($naoExcluirUnidade))
			{
				$naoExcluirUnidade = implode(',', $naoExcluirUnidade);
				$this->db->clear();
				$cond = " AND id_unidade_medida_produto not in (".$naoExcluirUnidade.")";
			}
			$sql = "DELETE FROM unidade_medida_produto WHERE id_produto = '".$produto->getId()."' $cond";
			$this->db->query($sql);
			if($this->db->rowCount() > 0)

			$this->db->clear();
			$this->db->setTabela('unidade_medida_produto');
			foreach ($produto->getUnidadeMedidaEstoque() as $unidade)
			{
				if(!empty($unidade))
				{
					$data = array(
						'id_produto' => $produto->getId(),
						'id_unidade_medida' => $unidade->getUnidadeMedida()->getId(),
						'fator_unidade_medida' => $unidade->getFator(),
						'para_venda' => $unidade->getParaVenda(),
						'para_estoque' => $unidade->getparaEstoque(),
						'ordem' => $unidade->getOrdem()
					);

					if($unidade->getId() != '')//verifica se o id existe para poder atualiza-lo - utilizado para o editar
					{
						$this->db->setCondicao('id_unidade_medida_produto = "'.$unidade->getId().'"');
						$this->db->update($data);
					}else{
						$this->db->insert($data);
					}

					if($this->db->rowCount() > 0)
						$this->nUpdates++;
				}
			}
		}catch(dbException $e){
			return $e->getMessageError();
		}
	}



	/**
 	 * 
 	 * Atualiza ou insere os fornecedores
 	 * @return void
 	 */
 	private function atualizaFornecedores(produtosModel $produto)
	{
		try{
			//excluindo os fornecedores não listados 
			$fornecedorExcluir = array();
			foreach ($produto->getFornecedores() as $fornecedor)
			{
				if($fornecedor->getId() != '')
					array_push($fornecedorExcluir,$fornecedor->getFornecedor()->getId());
			}
			$cond = '';
			if(!empty($fornecedorExcluir))
			{
				$fornecedorExcluir = implode(',', $fornecedorExcluir);
				$this->db->clear();
				$cond = " AND id_fornecedor not in (".$fornecedorExcluir.")";
			}
			$sql = "DELETE FROM produto_fornecedores WHERE id_produto = '".$produto->getId()."' $cond";
			$this->db->query($sql);
			if($this->db->rowCount() > 0)
			$this->db->clear();
			$this->db->setTabela('produto_fornecedores');
			foreach ($produto->getFornecedores() as $fornecedor)
			{

				if(!empty($fornecedor))
				{
					$data = array(
						'id_produto' => $produto->getId(),
						'id_fornecedor' => $fornecedor->getFornecedor()->getId()
					);


					if($fornecedor->getId() != '')//verifica se o id existe para poder atualiza-lo - utilizado para o editar
					{
						$this->db->setCondicao('id_produto_fornecedor = "'.$fornecedor->getId().'"');
						$this->db->update($data);
					}else{
						$this->db->insert($data);
					}
					if($this->db->rowCount() > 0)
						$this->nUpdates++;
				}
			}
		}catch(dbException $e){
			return $e->getMessageError();
		}
	}


	/**
 	 * Atualiza o status
 	 * @return boolean
 	 */
	public function atualizarStatus(produtosModel $produto)
	{
		$data = array('status_produto'=>$produto->getStatus());
		$this->db->clear();
		$this->db->setTabela('produtos');
		$this->db->setCondicao("id_produto = '".$produto->getId()."'");
		$this->db->update($data);
		if($this->db->rowCount()>0)
			return true;
		else
			return false;
	}


	/**
 	 * faz o upload do arquivo
 	 * @return boolean, String
 	 */
	public function uploadFoto($nomeArquivo, $arquivo)
	{
		//verifica se o diretório existe
		if(is_dir(BASEPATH.'skin/uploads/produtos/'))
		{
			$destino = BASEPATH.'skin/uploads/produtos/';
			$destino_p = BASEPATH.'skin/uploads/produtos/p/';

			if(!is_dir($destino))
				mkdir($destino);

			if(!is_dir($destino_p))
				mkdir($destino_p);

			$img = new upload($arquivo,$destino, $nomeArquivo);
			
			if($img->getError() == false)
			{
				$dest = $destino.$img->getArquivo();
				$dest_p = $destino_p.$img->getArquivo();
				if(
					(isset($_POST['w']) && $_POST['w'] != '') ||
					(isset($_POST['h']) && $_POST['h'] != '') ||
					(isset($_POST['x1']) && $_POST['x1'] != '') ||
					(isset($_POST['y1']) && $_POST['y1'] != '')
					){
						$w = $_POST['w'] ;
						$h =  $_POST['h'];
						$x1 = $_POST['x1'];
						$y1 = $_POST['y1'];
						
						$crop = new crop_image();
						$crop->setImage($dest,$dest_p,$w, $h,$x1, $y1,404, 158);
						$crop->cropResize();
						$crop->setImage($dest,$dest,$w, $h,$x1, $y1,1349, 527);
						$crop->cropResize();
					}else
					{
						$w = $_POST['w'] ;
						$h =  $_POST['h'];
						$x1 = $_POST['x1'];
						$y1 = $_POST['y1'];

						$crop = new crop_image();
						$crop->setImage($dest,$dest_p,$w, $h,$x1, $y1,404, 158);
						$crop->setImage($dest,$dest,$w, $h,$x1, $y1,1349, 527);
						$crop->resize();
					}

				$this->nomeArquivoFoto = $img->getArquivo();
				return true;
			
			}else
				return $img->getError();
		}else
			return 'Erro ao efetuar o upload. O diretório não existe';


	}


}