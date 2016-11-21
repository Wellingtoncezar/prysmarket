<?php
/**
 * Classe DAO de funcionários
 * @author Wellington cezar, Diego Hernandes
 */
if(!defined('BASEPATH')) die('Acesso não permitido');
class funcionariosDao extends Dao{
	private $nomeArquivoFoto;
	private $nUpdates = 0;
	public function __construct(){
		parent::__construct();
		$this->load->model('funcionarios/funcionariosModel');
		$this->load->model('funcionarios/cargosModel');
	}


	/**
	 * Lista os registros dos funcionarios
	 * @return Array
	 */

	public function listar(iListagemFuncionarios $listafuncionarios)
	{
		$funcionarios = Array();
		$result = $listafuncionarios->listar($this->db);

		if($result != null):
			foreach ($result as $value)
			{
				$funcionariosModel = new funcionariosModel();
				$funcionariosModel->setId($value['id_funcionario']);
				$funcionariosModel->setFoto($value['foto_funcionario']);
				$funcionariosModel->setNome($value['nome_funcionario']);
				$funcionariosModel->setSobrenome($value['sobrenome_funcionario']);
				$funcionariosModel->setCpf($value['cpf_funcionario']);
				$funcionariosModel->setCodigo($value['codigo_funcionario']);
				$funcionariosModel->setStatus(status::getAttribute($value['status_funcionario']));
				$funcionariosModel->setDataAtualizacao($value['timestamp']);

				//cargo
				$cargo = new cargosModel();
				$cargo->setId($value['id_cargo']);
				$funcionariosModel->setCargo($cargo);

				array_push($funcionarios, $funcionariosModel);
				unset($funcionariosModel);
			}
		endif;
		return $funcionarios;
	}

	/**
	 * Retorna a consulta de um funcionário pelo id
	 * @return object [funcionariosModel]
	 */
	public function consultar(IlistagemFuncionarios $ifuncionario, funcionariosModel $func, $status)
	{
		$funcionario = new funcionariosModel();
		
		$result = $ifuncionario->consultar($this->db, $func, $status);

		//FUNCIONARIO
		if($result != null):

						
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
	
			//setando os dados do funcionario
			$funcionario->setId($result['id_funcionario']);
			$funcionario->setFoto($result['foto_funcionario']);
			$funcionario->setNome($result['nome_funcionario']);
			$funcionario->setSobrenome($result['sobrenome_funcionario']);
			$funcionario->setDataNascimento($result['data_nascimento_funcionario']);
			$funcionario->setSexo($result['sexo_funcionario']);
			$funcionario->setRg($result['rg_funcionario']);
			$funcionario->setCpf($result['cpf_funcionario']);
			$funcionario->setEstadoCivil($result['estado_civil_funcionario']);
			$funcionario->setEscolaridade($result['escolaridade_funcionario']);
			$funcionario->setEndereco($endereco);
			$funcionario->setEmail($result['email_funcionario']);
			$funcionario->setTelefone($result['telefone_funcionario']);
			
			//setando os dados do cargo
			$this->load->model('funcionarios/cargosModel');
			$cargosModel = new cargosModel();
			$cargosModel->setId($result['id_cargo']);
			$funcionario->setCargo($cargosModel);
			$funcionario->setDataAdmissao($result['data_admissao_funcionario']);
			$funcionario->setDataDemissao($result['data_demissao_funcionario']);
			$funcionario->setStatus(status::getAttribute($result['status_funcionario']));

			return $funcionario;
		else:
			return $funcionario;
		endif;
	}



	/**
	 * Insere novos funcionários
	 * @return boolean
	 */
 	public function inserir(funcionariosModel $funcionario)
 	{

		$this->load->library('geracodigo');
		$geracodigo = new geracodigo();	
		$codigoFuncionario = date('dmy').'.'.$geracodigo->setTamanho(4)->gerar();


 		$data = array(
 			'foto_funcionario' => $funcionario->getFoto(),
 			'nome_funcionario' => $funcionario->getNome(),
 			'sobrenome_funcionario' => $funcionario->getSobrenome(),
 			'data_nascimento_funcionario' => $funcionario->getDataNascimento(),
 			'sexo_funcionario' => $funcionario->getSexo(),
 			'rg_funcionario' => $funcionario->getRg(),
 			'cpf_funcionario' => $funcionario->getCpf(),
 			'estado_civil_funcionario' => $funcionario->getEstadoCivil(),
 			'escolaridade_funcionario' => $funcionario->getEscolaridade(),
 			'email_funcionario' => $funcionario->getEmail(),
 			'telefone_funcionario' => $funcionario->getTelefone(),
 			'codigo_funcionario' => $codigoFuncionario,
 			'id_cargo' => $funcionario->getCargo()->getId(),
 			'data_admissao_funcionario' => $funcionario->getDataAdmissao(),
 			'data_demissao_funcionario' => $funcionario->getDataDemissao(),
 			'status_funcionario' => $funcionario->getStatus(),
 			'data_cadastro_funcionario' => $funcionario->getDataCadastro()
 		);

 		$this->db->clear();
		$this->db->setTabela('funcionarios');
		try {
			if($this->db->insert($data))
			{
				$funcionario->setId($this->db->getUltimoId()); //RETORNA O ID INSERIDO

				$this->atualizaEndereco($funcionario);
				
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
	 * Atualiza funcionários
	 * @return boolean
	 */
 	public function atualizar(funcionariosModel $funcionario)
 	{

		$data = array(
 			'foto_funcionario' => $funcionario->getFoto(),
 			'nome_funcionario' => $funcionario->getNome(),
 			'sobrenome_funcionario' => $funcionario->getSobrenome(),
 			'data_nascimento_funcionario' => $funcionario->getDataNascimento(),
 			'sexo_funcionario' => $funcionario->getSexo(),
 			'rg_funcionario' => $funcionario->getRg(),
 			'cpf_funcionario' => $funcionario->getCpf(),
 			'estado_civil_funcionario' => $funcionario->getEstadoCivil(),
 			'escolaridade_funcionario' => $funcionario->getEscolaridade(),
 			'email_funcionario' => $funcionario->getEmail(),
 			'telefone_funcionario' => $funcionario->getTelefone(),
 			'id_cargo' => $funcionario->getCargo()->getId(),
 			'data_admissao_funcionario' => $funcionario->getDataAdmissao(),
 			'data_demissao_funcionario' => $funcionario->getDataDemissao()
 		);

		try {
	 		$this->db->clear();
			$this->db->setTabela('funcionarios');
			$this->db->setCondicao("id_funcionario = ?");
			$this->db->setParameter(1, $funcionario->getId());
			if($this->db->update($data))
			{
				$this->nUpdates++;
			}
		} catch (dbException $e) {
			return $e->getMessageError();
		}

		
		
		//ENDEREÇO
		$this->atualizaEndereco($funcionario);
 		if($this->nUpdates > 0)
			return true;
 		else
 		{
 			return json_encode(array('erro'=>'Erro ao editar registro'));
 		}
	}





 	/**
 	 * Atualiza ou insere o endereço
 	 * @return boolean
 	 * */
 	public function atualizaEndereco(funcionariosModel $funcionario)
 	{

	 	$this->db->clear();
		$this->db->setTabela('enderecos_funcionarios');
		$data = array(
			'id_funcionario' => $funcionario->getId(),
			'cep_endereco' => $funcionario->getEndereco()->getCep(),
			'rua_endereco' => $funcionario->getEndereco()->getLogradouro(),
			'numero_endereco' => $funcionario->getEndereco()->getNumero(),
			'complemento_endereco' => $funcionario->getEndereco()->getComplemento(),
			'bairro_endereco' => $funcionario->getEndereco()->getBairro(),
			'cidade_endereco' => $funcionario->getEndereco()->getCidade(),
			'estado_endereco' => $funcionario->getEndereco()->getEstado(),
			'data_cadastro_endereco' => date('Y-m-d h:i:s')
		);
		

		if($funcionario->getEndereco()->getId() != '')//verifica se o id existe para poder atualiza-lo - utilizado para o editar
		{
			$this->db->setCondicao('id_endereco = "'.$funcionario->getEndereco()->getId().'"');
			$this->db->update($data);
		}else{
			$this->db->insert($data);
		}

		if($this->db->rowCount() > 0){
			$this->nUpdates++;
			return true;
		}
		else
			return false;
 	}


	/**
 	 * Atualiza o status
 	 * @return boolean
 	 */
	public function atualizarStatus(funcionariosModel $funcionario)
	{
		try {
			$this->db->clear();
			$this->db->setTabela('funcionarios');
			$this->db->setCondicao("id_funcionario = ?");
			$this->db->setParameter(1, $funcionario->getId());
			$data = array('status_funcionario'=>$funcionario->getStatus());
			if($this->db->update($data))
				return true;
			else
				return false;
		} catch (dbException $e) {
			return $e->getMessageError();
		}
	}

}