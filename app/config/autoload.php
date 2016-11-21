<?php
if(!defined('BASEPATH')) die('Acesso não permitido');
$autoload['libraries'] = array(
	'checknivelacesso',
	'checkPermissao',
	'url',
	'menu', 
	'templateFactory'
);

$autoload['model'] = array(
	'funcionarios/usuariosModel', 
	'funcionarios/funcionariosModel', 
	'configuracoes/niveis_acesso/niveisAcessoModel',
	'configuracoes/modulos/modulosModel',
	'configuracoes/modulos/paginasModel',
	'configuracoes/modulos/actionsModel'
);

$autoload['dao'] = array();