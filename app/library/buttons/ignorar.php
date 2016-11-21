<?php
if(!defined('BASEPATH')) die('Acesso não permitido');
class ignorar implements ITemplate {
	private $atrDefault;
	public function getContent(loadContent $load,Array $atr = null)
	{
		$this->atrDefault = array(
			'title' => 'Excluir',
			'href' => 'javascript:void(0)',
			'id' => '',
			'moreContent' => ''
		);


		if(!empty($atr))
		{
			foreach ($atr as $key => $value) {
				if(array_key_exists($key, $this->atrDefault))
					$this->atrDefault[$key] = $value;
			}
		}

		return $load->load('template/actions_buttons/excluir',$this->atrDefault);
	}
}