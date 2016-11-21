<?php
/**
 * realiza a consulta do funcionario pelo id
 * @author Wellington cezar, Diego Hernandes
 */
if(!defined('BASEPATH')) die('Acesso não permitido');
class consultaFuncionarioPorId implements IListagemFuncionarios{
	public function listar(db $db){

	}

	public function consultar(db $db, funcionariosModel $funcionario, $status)
	{
		$db->clear();
		$db->setTabela('funcionarios as A, enderecos_funcionarios AS B');
		$db->setCondicao("A.id_funcionario = ? and A.status_funcionario in ('".implode("','", $status)."') AND A.id_funcionario = B.id_funcionario");
		$db->setParameter(1, $funcionario->getId());
		if($db->select())
		{
			return $db->result();
		}else
			return null;
	}
}