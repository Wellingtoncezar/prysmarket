<?php
/**
 * Classe DAO de fornecedores
 * @author Wellington cezar, Diego Hernandes
 */
if(!defined('BASEPATH')) die('Acesso não permitido');
class fornecedoresDao extends Dao{
	private $nomeArquivoFoto;
	private $nUpdates = 0;
	public function __construct(){
		parent::__construct();
	}


	/**
	 * Lista os registros dos fornecedores
	 * @return Array
	 */
	public function listar($status = Array())
	{
		if(empty($status))
		{
			$status = Array(
				status::ATIVO,
				status::INATIVO
			);
		}

		$condStatus = implode("', '", $status);

		$this->load->model('fornecedores/fornecedoresModel');
		$fornecedores = Array();

		$this->db->clear();
		$this->db->setTabela('fornecedores');
		$this->db->setCondicao(" status_fornecedor in('".$condStatus."') ");
		$campos = array('id_fornecedor','foto_fornecedor','nome_fantasia_fornecedor','razao_social_fornecedor','cpf_fornecedor','cnpj_fornecedor','status_fornecedor');
		$this->db->select($campos);
		if($this->db->rowCount() > 0):
			$result = $this->db->resultAll();
			foreach ($result as $value)
			{
				$fornecedoresModel = new fornecedoresModel();
				$fornecedoresModel->setId($value['id_fornecedor']);
				$fornecedoresModel->setFoto($value['foto_fornecedor']);
				$fornecedoresModel->setNomeFantasia($value['nome_fantasia_fornecedor']);
				$fornecedoresModel->setRazaoSocial($value['razao_social_fornecedor']);
				$fornecedoresModel->setCpf($value['cpf_fornecedor']);
				$fornecedoresModel->setCnpj($value['cnpj_fornecedor']);
				$fornecedoresModel->setStatus(status::getAttribute($value['status_fornecedor']));
				array_push($fornecedores, $fornecedoresModel);
				unset($fornecedoresModel);
			}
			return $fornecedores;
		else:
			return $fornecedores;
		endif;
	}


	/**
	 * Retorna a consulta de um fornecedores pelo id
	 * @return object [fornecedoresModel]
	 */
	public function consultar(fornecedoresModel $fornecedor)
	{
		$this->db->clear();
		$this->db->setTabela('fornecedores AS A, enderecos_fornecedores AS B');
		$this->db->setCondicao("A.id_fornecedor = '".$fornecedor->getId()."' AND A.id_fornecedor = B.id_fornecedor");
		$this->db->select();

		//fornecedor
		if($this->db->rowCount() > 0):
			$result = $this->db->result();

			$this->load->model('enderecoModel');
			$endereco = new enderecoModel();
			$endereco->setId($result['id_endereco']);
			$endereco->setCep($result['cep_endereco']);
			$endereco->setNumero($result['numero_endereco']);
			$endereco->setComplemento($result['complemento_endereco']);
			$endereco->setLogradouro($result['rua_endereco']);
			$endereco->setBairro($result['bairro_endereco']);
			$endereco->setCidade($result['cidade_endereco']);
			$endereco->setEstado($result['estado_endereco']);


			$fornecedor->setFoto($result['foto_fornecedor']);
			$fornecedor->setRazaoSocial($result['razao_social_fornecedor']);
			$fornecedor->setNomeFantasia($result['nome_fantasia_fornecedor']);
			$fornecedor->setCnpj($result['cnpj_fornecedor']);
			$fornecedor->setCpf($result['cpf_fornecedor']);
			$fornecedor->setPessoa($result['pessoa_fornecedor']);
			$fornecedor->setSite($result['site_fornecedor']);
			$fornecedor->setObservacoes($result['observacoes_fornecedor']);
			$fornecedor->setNomeContato($result['nome_contato_fornecedor']);
			$fornecedor->setEndereco($endereco);
			$fornecedor->setTelefone($result['telefone_fornecedor']);
			$fornecedor->setEmail($result['email_fornecedor']);
			$fornecedor->setStatus(status::getAttribute($result['status_fornecedor']));
			return $fornecedor;
		else:
			
			return $fornecedoresModel;
		endif;
	}



	/**
	 * Insere novos fornecedores
	 * @return boolean, json
	 */
 	public function inserir(fornecedoresModel $fornecedores)
 	{
		$data = array(
 			'foto_fornecedor' => $fornecedores->getFoto(),
 			'razao_social_fornecedor' => $fornecedores->getRazaoSocial(),
 			'nome_fantasia_fornecedor' => $fornecedores->getNomeFantasia(),
 			'cnpj_fornecedor' => $fornecedores->getCnpj(),
 			'cpf_fornecedor' => $fornecedores->getCpf(),
 			'pessoa_fornecedor' => $fornecedores->getPessoa(),
 			'site_fornecedor' => $fornecedores->getSite(),
 			'observacoes_fornecedor' => $fornecedores->getObservacoes(),
 			'nome_contato_fornecedor' => $fornecedores->getNomeContato(),
 			'email_fornecedor' => $fornecedores->getEmail(),
 			'telefone_fornecedor' => $fornecedores->getTelefone(),

 			'status_fornecedor' => $fornecedores->getStatus(),
 			'data_cadastro_fornecedor' => $fornecedores->getDataCadastro()
 		);


 		$this->db->clear();
		$this->db->setTabela('fornecedores');
		try {
			if($this->db->insert($data))
			{
				$fornecedores->setId($this->db->getUltimoId()); //RETORNA O ID INSERIDO
				$this->atualizaEndereco($fornecedores);
				return true;
	 		}else
	 		{
	 			return $this->db->getError();
	 		}
		} catch (dbException $e) {
			return $e->getMessageError();
		}


	}

	/**
	 * Atualiza fornecedores
	 * @return boolean, json
	 */
 	public function atualizar(fornecedoresModel $fornecedor)
 	{
		$data = array(
 			'foto_fornecedor' => $fornecedor->getFoto(),
 			'razao_social_fornecedor' => $fornecedor->getRazaoSocial(),
 			'nome_fantasia_fornecedor' => $fornecedor->getNomeFantasia(),
 			'cnpj_fornecedor' => $fornecedor->getCnpj(),
 			'cpf_fornecedor' => $fornecedor->getCpf(),
 			'pessoa_fornecedor' => $fornecedor->getPessoa(),
 			'site_fornecedor' => $fornecedor->getSite(),
 			'email_fornecedor' => $fornecedor->getEmail(),
 			'telefone_fornecedor' => $fornecedor->getTelefone(),
 			'observacoes_fornecedor' => $fornecedor->getObservacoes(),
 			'nome_contato_fornecedor' => $fornecedor->getNomeContato()
 		);

		try {
	 		$this->db->clear();
			$this->db->setTabela('fornecedores');
			$this->db->setCondicao("id_fornecedor = ?");
			$this->db->setParameter(1, $fornecedor->getId());

			if($this->db->update($data))
				$this->nUpdates++;
			
			//ENDEREÇO
			$this->atualizaEndereco($fornecedor);

	 		if($this->nUpdates > 0)
				return true;
	 		else
	 		{
	 			return $this->db->getError();
	 		}
	 	} catch (dbException $e) {
			return $e->getMessageError();
		}

	}






 	/**
 	 * Atualiza ou insere o endereço
 	 * @return void
 	 * */
 	public function atualizaEndereco(fornecedoresModel $fornecedor)
 	{
 		try{
		 	$this->db->clear();
			$this->db->setTabela('enderecos_fornecedores');
			$data = array(
				'id_fornecedor' => $fornecedor->getId(),
				'cep_endereco' => $fornecedor->getEndereco()->getCep(),
				'rua_endereco' => $fornecedor->getEndereco()->getLogradouro(),
				'numero_endereco' => $fornecedor->getEndereco()->getNumero(),
				'complemento_endereco' => $fornecedor->getEndereco()->getComplemento(),
				'bairro_endereco' => $fornecedor->getEndereco()->getBairro(),
				'cidade_endereco' => $fornecedor->getEndereco()->getCidade(),
				'estado_endereco' => $fornecedor->getEndereco()->getEstado(),
				'data_cadastro_endereco' => date('Y-m-d h:i:s')
			);
			

			if($fornecedor->getEndereco()->getId() != '')//verifica se o id existe para poder atualiza-lo - utilizado para o editar
			{
				$this->db->setCondicao('id_endereco = "'.$fornecedor->getEndereco()->getId().'"');
				$this->db->update($data);
			}else
			{
				$this->db->insert($data);
			}

			if($this->db->rowCount() > 0)
				$this->nUpdates++;
			else
				return false;
		} catch (dbException $e) {
			return $e->getMessageError();
		}
 	}

	/**
 	 * Atualiza o status
 	 * @return boolean
 	 */
	public function atualizarStatus(fornecedoresModel $fornecedor)
	{
		$data = array('status_fornecedor'=>$fornecedor->getStatus());
		$this->db->clear();
		$this->db->setTabela('fornecedores');
		$this->db->setCondicao("id_fornecedor = '".$fornecedor->getId()."'");
		$this->db->update($data);
		if($this->db->rowCount()>0)
			return true;
		else
			return false;
	}

}