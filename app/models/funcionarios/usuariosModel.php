<?php
/**
*@author Wellington cezar, Diego Hernandes.
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class usuariosModel{
	/**
	 * @id
     * @Column(type="integer", name="id_usuario")
     * @var int
     */
	private $id;
	/**
	 * @funcionario
     * @var funcionariosModel
     */
	private $funcionario;
	/**
	 * @login
     * @Column(type="varchar", name="login_usuario")
     * @var string
     */
	private $login;
	/**
	 * @senha
     * @Column(type="varchar", name="senha_usuario")
     * @var string
     */
	private $senha;
	/**
	 * @email
     * @Column(type="varchar", name="email_usuario")
     * @var string
     */
	private $email;
	/**
	 * @nivelAcesso
     * @var niveisAcessoModel
     */
	private $nivelAcesso;
	/**
	 * @status
     * @Column(type="enum('ATIVO', 'INATIVO', 'EXCLUIDO')", name="status_usuario")
     * @var status
     */
	private $status = status::ATIVO;
	/**
	 * @dataCadastro
     * @Column(type="datetime", name="data_criacao_usuario")
     * @var date
     */
	private $dataCadastro;
	/**
	 * @hash
     * @Column(type="varchar", name="hash_acesso")
     * @var string
     */
	private $hash;

		

 	//SETERS
 	public function setId($id)
 	{
 		$this->id = $id;
 	}
 	public function setFuncionario(funcionariosModel $funcionario)
	{
		$this->funcionario = $funcionario;
	}
    public function setLogin($login)
	{
		$this->login = $login;
	}
	public function setSenha($senha)
	{
		$this->senha = $senha;
	}
	public function setNivelAcesso (niveisAcessoModel $nivelAcesso)
	{
		$this->nivelAcesso = $nivelAcesso;
	}
	public function setEmail ($email)
	{
		$this->email = $email;
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

	public function setDataCadastro($dataCadastro)
	{	
		$this->dataCadastro = $dataCadastro;
	}
	public function setHash($hash)
	{	
		$this->hash = $hash;
	}


	//GETERS
	public function getId()
	{
		return $this->id;
	}
	public function getFuncionario()
	{
		return $this->funcionario;
	}
	public function getLogin()
	{
		return $this->login;
	}
	public function getSenha()
	{
		return $this->senha;
	}
	public function getNivelAcesso()
	{
		return $this->nivelAcesso;
	}
	public function getEmail()
	{
		return $this->email;
	}

	public function getStatus()
	{
		return $this->status;
	}
	public function getDataCadastro()
	{	
		return $this->dataCadastro;
	}
	public function getHash($hash)
	{	
		return $this->hash;
	}



}