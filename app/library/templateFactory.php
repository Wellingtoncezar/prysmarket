<?php
if(!defined('BASEPATH')) die('Acesso não permitido');
class templateFactory extends Library{

	public function getButton($button, $atr, $checkPermission = '') 
	{
		//se não tiver permissão de acesso ao botão retorna null
		// return $this->load->checkPermissao->check(false, $checkPermission);
		if($checkPermission != '' && $this->load->checkPermissao->check(false, $checkPermission) == false )//verifica a permissão de acesso
			return null;
		$load = new loadContent();
		$this->load->library('buttons/'.$button);
		$template = new $button();
		return $template->getContent($load,$atr);
	}

	public function getTable($table, $atr)
	{
		$load = new loadContent();
		$this->load->library('tables/'.$table);
		$template = new $table();
		return $template->getContent($load, $atr);
	}

	public function getEmail($email, $atr)
	{
		$load = new loadContent();
		$this->load->library('emails/'.$email);
		$template = new $email();
		return $template->getContent($load, $atr);
	}

}