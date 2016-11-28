<?php
/**
 * @author Wellington cezar, Diego Hernandes
 */
if(!defined('BASEPATH')) die('Acesso não permitido');
class logEntradaEstoqueDao extends Dao{
	public function __construct(){
		parent::__construct();
		$this->load->model('produtos/unidadeMedidaEstoqueModel');
		$this->load->model('estoque/logEntradaEstoqueModel');
	}

	public function consultaLogEntrada(logEntradaEstoqueModel $logentrada)
	{
		$this->db->clear();
		$this->db->setTabela('log_entrada_estoque');
		$this->db->setCondicao('id_estoque = ? ');
		$this->db->setParameter(1, $logentrada->getEstoque()->getId());
		$arrlog = Array();
		if($this->db->select())
		{
			$result = $this->db->resultAll();
			foreach ($result as $value)
			{
				$unidadeMedidaEstoqueModel = new unidadeMedidaEstoqueModel();
				$unidadeMedidaEstoqueModel->setId($value['id_unidade_medida_produto']);

				$logEntradaEstoqueModel = new logEntradaEstoqueModel();
				$logEntradaEstoqueModel->setId($value['id_log_entrada']);
				$logEntradaEstoqueModel->setUnidadeMedidaEstoque($unidadeMedidaEstoqueModel);
				$logEntradaEstoqueModel->setQuantidade($value['quantidade']);
				$logEntradaEstoqueModel->setDataEntrada($value['data_entrada']);
				$arrlog[] = $logEntradaEstoqueModel;
			}
		}

		return $arrlog;
	}

}