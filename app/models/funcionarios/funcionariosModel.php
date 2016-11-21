<?php
/**
*@author Wellington cezar, Diego Hernandes
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class funcionariosModel{
	/**
	 * @id
     * @Column(type="integer", name="id_funcionario")
     * @var int
     */
	private $id;
	/**
	 * @foto
     * @Column(type="varchar", name="foto_funcionario")
     * @var string
     */
	private $foto;
	/**
	 * @nome
     * @Column(type="varchar", name="nome_funcionario")
     * @var string
     */
	private $nome;
	/**
	 * @sobrenome
     * @Column(type="varchar", name="sobrenome_funcionario")
     * @var string
     */
	private $sobrenome;
	/**
	 * @dataNascimento
     * @Column(type="date", name="data_nascimento_funcionario")
     * @var date
     */
	private $dataNascimento;
	/**
	 * @sexo
     * @Column(type="char", name="sexo_funcionario")
     * @var string
     */
	private $sexo;
	/**
	 * @rg
     * @Column(type="varchar", name="rg_funcionario")
     * @var string
     */
	private $rg;
	/**
	 * @cpf
     * @Column(type="varchar", name="cpf_funcionario")
     * @var string
     */
	private $cpf;
	/**
	 * @estadoCivil
     * @Column(type="varchar", name="estado_civil_funcionario")
     * @var string
     */
	private $estadoCivil;
	/**
	 * @escolaridade
     * @Column(type="varchar", name="escolaridade_funcionario")
     * @var string
     */
	private $escolaridade;
	/**
	 * @edereco
     * @var ederecoModel
     */
	private $endereco;
	/**
	 * @telefone
     * @Column(type="varchar", name="telefone_funcionario")
     * @var string
     */
	private $telefone;
	/**
	 * @email
     * @Column(type="varchar", name="email_funcionario")
     * @var string
     */
	private $email;
	/**
	 * @codigo
     * @Column(type="varchar", name="codigi_funcionario")
     * @var string
     */
	private $codigo;
	/**
	 * @cargo
     * @var cargoModel
     */
	private $cargo;
	/**
	 * @dataAdmissao
     * @Column(type="date", name="data_admissao_funcionario")
     * @var date
     */
	private $dataAdmissao;
	/**
	 * @dataDemissao
     * @Column(type="date", name="data_demissao_funcionario")
     * @var date
     */
	private $dataDemissao;
	/**
	 * @status
     * @Column(type="enum('ATIVO', 'INATIVO', 'EXCLUIDO')", name="status_funcionario")
     * @var status
     */
	private $status = status::ATIVO;
	/**
	 * @dataCadastro
     * @Column(type="datetime", name="data_cadastro_funcionario")
     * @var date
     */
	private $dataCadastro;
	/**
	 * @dataAtualizacao
     * @Column(type="timestamp", name="timestamp")
     * @var date
     */
	private $dataAtualizacao;
	/**
	 * @usuario
     * @var usuariosModel
     */
	private $usuario;

 	//SETERS
 	public function setId($id)
 	{
 		$this->id = $id;
 	}
 	public function setFoto($foto)
	{
		$this->foto = $foto;
	}
	public function setNome($nome)
	{
		$this->nome = $nome;
	}
	public function setSobrenome($sobrenome)
	{
		$this->sobrenome = $sobrenome;
	}
	public function setDataNascimento($dataNascimento)
	{
		$this->dataNascimento = $dataNascimento;
	}
	public function setSexo($sexo)
	{
		$this->sexo = $sexo;
	}
	public function setRg($rg)
	{
		$this->rg = $rg;
	}
	public function setCpf($cpf)
	{
		$this->cpf = $cpf;
	}
	public function setEstadoCivil($estadoCivil)
	{
		$this->estadoCivil = $estadoCivil;
	}
	public function setEscolaridade($escolaridade)
	{
		$this->escolaridade = $escolaridade;
	}
	public function setEndereco(enderecoModel $endereco)
	{
		$this->endereco = $endereco;
	}
	public function setTelefone($telefone)
	{
		$this->telefone = $telefone;
	}

	public function setEmail($email)
	{
		$this->email = $email;
	}

	public function setCodigo($codigo)
	{
		$this->codigo = $codigo;
	}
	public function setCargo($cargo)
	{
		$this->cargo = $cargo;
	}
	public function setDataAdmissao($dataAdmissao)
	{
		$this->dataAdmissao = $dataAdmissao;
	}
	public function setDataDemissao($dataDemissao)
	{
		$this->dataDemissao = $dataDemissao;
	}
	public function setDataCadastro($dataCadastro)
	{	
		$this->dataCadastro = $dataCadastro;
	}
	public function setDataAtualizacao($dataAtualizacao)
	{	
		$this->dataAtualizacao = $dataAtualizacao;
	}
	public function setStatus($status)
	{
		$this->status = $status;
	}
	public function ativar()
	{
		$this->status = status::ATIVO;
	}
	public function inativar()
	{
		$this->status = status::INATIVO;
	}
	public function excluir()
	{
		$this->status = status::EXCLUIDO;
	}

	public function setUsuario(usuariosModel $usuario)
	{
		$this->usuario = $usuario;
	}

	//GETERS
	public function getId()
	{
		return $this->id;
	}
	public function getFoto()
	{
		return $this->foto;
	}
	public function getNome()
	{
		return $this->nome;
	}
	public function getSobrenome()
	{
		return $this->sobrenome;
	}
	public function getDataNascimento()
	{
		return $this->dataNascimento;
	}
	public function getSexo()
	{
		return $this->sexo;
	}
	public function getRg()
	{
		return $this->rg;
	}
	public function getCpf()
	{
		return $this->cpf;
	}
	public function getEstadoCivil()
	{
		return $this->estadoCivil;
	}
	public function getEscolaridade()
	{
		return $this->escolaridade;
	}
	public function getEndereco()
	{
		return $this->endereco;
	}
	public function getTelefone()
	{
		return $this->telefone;
	}
	public function getEmail()
	{
		return $this->email;
	}
	public function getCodigo()
	{
		return $this->codigo;
	}
	public function getCargo()
	{
		return $this->cargo;
	}
	public function getDataAdmissao()
	{
		return $this->dataAdmissao;
	}
	public function getDataDemissao()
	{
		return $this->dataDemissao;
	}
	public function getStatus()
	{
		return $this->status;
	}
	public function getDataCadastro()
	{	
		return $this->dataCadastro;
	}
	public function getDataAtualizacao()
	{	
		return $this->dataAtualizacao;
	}

	public function getUsuario()
	{
		return $this->usuario;
	}
}