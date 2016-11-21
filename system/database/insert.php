<?php
/**
* Classe para insert do banco.
* @author Wellington cézar
* @since 18/06/2014
* @version 2.0
*
*/
if(!defined('BASEPATH')) die('Acesso não permitido');
class insert implements IDbCrud{
	private $paramArray;
	private $sql;
	public function __construct($elements)
	{

		$campos='';
		$valores = '';
		$param = '';
		$n = count($elements['valores']);
		$i = 0;

		foreach($elements['valores'] AS $key => $val)
		{
			$key = trim($key);
			if( $i < $n-1 )
			{
				$campos .= $key.", ";
				$param .= ":".htmlentities($key).", ";
			}
			else
			{
				$campos .= $key."";
				$param .= ":".htmlentities($key)."";
			}
			$this->paramArray[":".$key.""]= filter_var(trim(htmlentities($val)));
			$i++;
		}
		$this->sql  = "INSERT INTO ".$elements['tabela']." (".$campos.") VALUES (".$param.")";
	}

	public function getQuery()
	{
		return $this->sql;
	}

	public function getParamArray()
	{
		return $this->paramArray;
	}
}
