<?php
/**
* @author Wellington Cézar, Diego Hernandes
* */
if(!defined('URL')) die('Acesso não permitido');
class menu extends Library{
	/**
	 * @_usuario
	 * @var usuariosModel
	 * */
	private $_usuario;


	public function __construct()
	{
		parent::__construct();
		$this->load->dao('configuracoes/modulosDao');
		$this->load->dao('configuracoes/niveisAcessoDao');

		if(isset($_SESSION['user'])){
			$this->_usuario = unserialize($_SESSION['user']);
		}
		
		
	}


	/**
	* Cria o menu a partir do array gerado pela permissão
	*/
	public function geraMenu()
	{	

		$modulosDao = new modulosDao();
		$modulosModel = $modulosDao->listar();

		$niveisAcessoDao = new niveisAcessoDao();
		$this->_usuario->setNivelAcesso($niveisAcessoDao->getNivelAcesso($this->_usuario->getNivelAcesso(), $modulosModel));

		// echo '<pre>';
		// print_r($this->_usuario->getNivelAcesso()->getPermissoes());
		// echo '</pre>';
		$url = new url();
		$activeHome = ( $url->getSegment(0) == false || strtolower($url->getSegment(0)) == 'home') ? 'active' : '';
		$menu = '<ul class="nav navbar-nav">';
			//percorre todos os módulos
        	foreach ($this->_usuario->getNivelAcesso()->getPermissoes() as $modulo):
        		//verifica se há permissão de acesso
        		if(!$modulo->getAcesso() && $this->_usuario->getNivelAcesso()->getTipoPermissao() == tipopermissao::USUARIO)
        			continue;
        		if($modulo->getStatus() != status::ATIVO)
        			continue;
        		$aux = $modulo->getUrl();
				$$aux = '';
				if($url->getSegment(0) == $modulo->getUrl()){
					$aux = $modulo->getUrl();
					$$aux = 'active';
				}

				if(!empty($modulo->getPaginas()) || !empty($modulo->getSubModulos())):
					
					$menu .= '<li class="dropdown">';
			            $menu .= '<a href="'.URL.$modulo->getUrl().'" class="dropdown-toggle '.$$aux.'" title="'.$modulo->getNome().'" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="'.$modulo->getIcone().'"></span><p>'.$modulo->getNome().'</p><span class="caret"></span></a>';
		            		//inicion do submenu
		            		$menu .= '<ul class="dropdown-menu">';
					if(!empty($modulo->getPaginas())):
			            foreach ($modulo->getPaginas() as $pag):
			            	if($pag->getStatus() != status::ATIVO)
        						continue;
			            	if(!$pag->getAcesso() && $this->_usuario->getNivelAcesso()->getTipoPermissao() == tipopermissao::USUARIO)
        						continue;
			                $menu .='<li><a href="'.URL.$modulo->getUrl().'/'.$pag->getUrl().'">'.$pag->getNome().'</a></li>';
			            endforeach;
					endif;
					if(!empty($modulo->getModulos())):
				        foreach ($modulo->getModulos() as $subMod):
				        	if(!$subMod->getAcesso() && $this->_usuario->getNivelAcesso()->getTipoPermissao() == tipopermissao::USUARIO)
        						continue;
        					if($subMod->getStatus() != status::ATIVO)
        						continue;
							
							$menu .='<li><a href="'.URL.$modulo->getUrl().'/'.$subMod->getUrl().'" title="'.$subMod->getNome().'">'.$subMod->getNome().'</a></li>';
				        endforeach;

					endif;
			        		$menu .= '</ul>';

			        $menu .= '</li>';
				else:
					$menu .= '<li class="'.$$aux.'"><a href="'.URL.$modulo->getUrl().'" title="'.$modulo->getNome().'"><span class="'.$modulo->getFotoModulo().'"></span><p>'.$modulo->getNome().'</p></a></li>';
				endif;
			endforeach; 
        $menu .= '</ul>';
		return $menu;
	}
}



/**
*
*class: menu
*
*location : library/menu.class.php
*/
		