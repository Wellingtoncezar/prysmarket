-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 20-Nov-2016 às 23:39
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `prysmarket`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `abertura_caixa`
--

CREATE TABLE IF NOT EXISTS `abertura_caixa` (
`id_abertura_caixa` int(11) NOT NULL,
  `id_caixa` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `saldo_inicial` decimal(10,2) DEFAULT NULL,
  `saldo_final` decimal(10,2) NOT NULL,
  `data_abertura_caixa` datetime NOT NULL,
  `data_fechamento_caixa` datetime NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `abertura_caixa`
--

INSERT INTO `abertura_caixa` (`id_abertura_caixa`, `id_caixa`, `id_usuario`, `saldo_inicial`, `saldo_final`, `data_abertura_caixa`, `data_fechamento_caixa`, `timestamp`) VALUES
(40, 1, 1, '100.00', '0.00', '2016-11-20 09:05:55', '2016-11-15 00:00:00', '2016-11-20 23:08:26'),
(41, 1, 1, '100.00', '0.00', '2016-11-20 09:08:33', '2016-11-22 00:00:00', '2016-11-20 23:18:50'),
(42, 1, 1, '500.00', '0.00', '2016-11-20 09:18:56', '2016-11-08 00:00:00', '2016-11-20 23:23:58'),
(43, 1, 1, '20.00', '0.00', '2016-11-20 09:24:05', '2016-11-22 00:00:00', '2016-11-21 01:03:39'),
(44, 1, 1, '10.00', '0.00', '2016-11-20 11:03:53', '2016-11-08 00:00:00', '2016-11-21 01:30:09'),
(45, 1, 1, '100.00', '100.00', '2016-11-20 11:30:16', '2016-11-09 00:00:00', '2016-11-21 01:32:29'),
(46, 1, 1, '100.00', '100.00', '2016-11-20 11:30:16', '2016-11-20 23:32:41', '2016-11-21 01:32:41'),
(47, 1, 1, '100.00', '0.00', '2016-11-20 11:30:16', '2016-11-30 00:00:00', '2016-11-21 01:34:17'),
(48, 1, 1, '500.00', '100.00', '2016-11-20 11:34:20', '2016-11-20 23:34:26', '2016-11-21 01:34:26'),
(49, 1, 1, '500.00', '300.00', '2016-11-20 11:34:39', '2016-11-20 23:34:44', '2016-11-21 01:34:44'),
(50, 1, 1, '800.00', '800.00', '2016-11-20 11:34:51', '2016-11-20 23:34:55', '2016-11-21 01:34:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_action`
--

CREATE TABLE IF NOT EXISTS `acesso_action` (
`id_acesso_action` int(11) NOT NULL,
  `id_nivel_acesso` int(11) DEFAULT NULL,
  `id_action` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acesso_action`
--

INSERT INTO `acesso_action` (`id_acesso_action`, `id_nivel_acesso`, `id_action`) VALUES
(1, 6, 6),
(2, 6, 7),
(3, 6, 8),
(4, 6, 5),
(5, 2, 13),
(6, 2, 14),
(7, 2, 16),
(8, 2, 15),
(9, 2, 17),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_modulo`
--

CREATE TABLE IF NOT EXISTS `acesso_modulo` (
`id_acesso_modulo` int(11) NOT NULL,
  `id_nivel_acesso` int(11) DEFAULT NULL,
  `id_modulo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acesso_modulo`
--

INSERT INTO `acesso_modulo` (`id_acesso_modulo`, `id_nivel_acesso`, `id_modulo`) VALUES
(1, 6, 1),
(2, 6, 2),
(3, 6, 3),
(4, 2, 5),
(5, 2, 6),
(6, 2, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_pagina`
--

CREATE TABLE IF NOT EXISTS `acesso_pagina` (
`id_acesso_pagina` int(11) NOT NULL,
  `id_nivel_acesso` int(11) DEFAULT NULL,
  `id_pagina` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acesso_pagina`
--

INSERT INTO `acesso_pagina` (`id_acesso_pagina`, `id_nivel_acesso`, `id_pagina`) VALUES
(1, 6, 3),
(2, 6, 4),
(3, 6, 2),
(4, 2, 7),
(5, 2, 8),
(6, 2, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixas`
--

CREATE TABLE IF NOT EXISTS `caixas` (
`id_caixa` int(11) NOT NULL,
  `codigo_caixa` varchar(255) DEFAULT NULL,
  `ip_maquina` varchar(255) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `caixas`
--

INSERT INTO `caixas` (`id_caixa`, `codigo_caixa`, `ip_maquina`, `data_cadastro`, `timestamp`) VALUES
(1, 'CAIXA 1', '::1', '2016-11-20 02:35:00', '2016-11-20 16:35:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE IF NOT EXISTS `cargos` (
`id_cargo` int(11) NOT NULL,
  `nome_cargo` varchar(255) DEFAULT NULL,
  `setor_cargo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `nome_cargo`, `setor_cargo`) VALUES
(1, 'Administrador do sistema', 'TI'),
(2, 'Gerente', 'Geral');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
`id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(255) DEFAULT NULL,
  `status_categoria` enum('ATIVO','INATIVO','EXCLUIDO') DEFAULT NULL,
  `data_cadastro_categoria` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_categoria`, `status_categoria`, `data_cadastro_categoria`, `timestamp`) VALUES
(1, 'Aliment&iacute;cios', 'ATIVO', '2016-11-20 10:04:48', '2016-11-20 12:04:48'),
(2, 'Bebidas', 'ATIVO', '2016-11-20 10:05:46', '2016-11-20 12:05:46'),
(3, 'Beleza e est&eacute;tica', 'ATIVO', '2016-11-20 10:06:14', '2016-11-20 12:06:14'),
(4, 'Cama mesa e banho', 'ATIVO', '2016-11-20 10:06:29', '2016-11-20 12:06:29'),
(5, 'Papelarias e livrarias', 'ATIVO', '2016-11-20 10:07:12', '2016-11-20 12:07:12'),
(6, 'Materiais de limpeza', 'ATIVO', '2016-11-20 10:07:32', '2016-11-20 12:07:32');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos_fornecedores`
--

CREATE TABLE IF NOT EXISTS `enderecos_fornecedores` (
`id_endereco` int(11) NOT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `cep_endereco` varchar(255) DEFAULT NULL,
  `rua_endereco` varchar(255) DEFAULT NULL,
  `numero_endereco` int(11) DEFAULT NULL,
  `complemento_endereco` varchar(255) DEFAULT NULL,
  `bairro_endereco` varchar(255) DEFAULT NULL,
  `cidade_endereco` varchar(255) DEFAULT NULL,
  `estado_endereco` varchar(255) DEFAULT NULL,
  `data_cadastro_endereco` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `enderecos_fornecedores`
--

INSERT INTO `enderecos_fornecedores` (`id_endereco`, `id_fornecedor`, `cep_endereco`, `rua_endereco`, `numero_endereco`, `complemento_endereco`, `bairro_endereco`, `cidade_endereco`, `estado_endereco`, `data_cadastro_endereco`, `timestamp`) VALUES
(5, 3, '08730-200', 'Rua Carmela Marmora Larotonda', 123, '', 'Vila Vit&oacute;ria', 'Mogi das Cruzes', 'SP', '2016-11-20 09:54:45', '2016-11-20 11:54:45'),
(6, 4, '08580-600', 'Rua Ataulfo Alves', 185, '', 'Jardim S&atilde;o Manoel', 'Itaquaquecetuba', 'SP', '2016-11-20 12:15:34', '2016-11-20 14:15:34');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos_funcionarios`
--

CREATE TABLE IF NOT EXISTS `enderecos_funcionarios` (
`id_endereco` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `cep_endereco` varchar(255) DEFAULT NULL,
  `rua_endereco` varchar(255) DEFAULT NULL,
  `numero_endereco` int(11) DEFAULT NULL,
  `complemento_endereco` varchar(255) DEFAULT NULL,
  `bairro_endereco` varchar(255) DEFAULT NULL,
  `cidade_endereco` varchar(255) DEFAULT NULL,
  `estado_endereco` varchar(255) DEFAULT NULL,
  `data_cadastro_endereco` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `enderecos_funcionarios`
--

INSERT INTO `enderecos_funcionarios` (`id_endereco`, `id_funcionario`, `cep_endereco`, `rua_endereco`, `numero_endereco`, `complemento_endereco`, `bairro_endereco`, `cidade_endereco`, `estado_endereco`, `data_cadastro_endereco`, `timestamp`) VALUES
(1, 1, '08580-600', 'Rua Ataulfo Alves', 123, '', 'Jardim S&atilde;o Manoel', 'Itaquaquecetuba', 'SP', '2016-11-20 01:01:16', '2016-11-20 02:34:31'),
(2, 3, '08580-000', 'Estrada do Corredor', 10, '', 'Jardim Paineira', 'Itaquaquecetuba', 'SP', '2016-11-20 12:51:12', '2016-11-20 02:51:12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE IF NOT EXISTS `estoque` (
`id_estoque` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`id_estoque`, `id_produto`, `timestamp`) VALUES
(1, 1, '2016-11-20 15:07:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE IF NOT EXISTS `fornecedores` (
`id_fornecedor` int(11) NOT NULL,
  `foto_fornecedor` varchar(255) DEFAULT NULL,
  `razao_social_fornecedor` varchar(255) DEFAULT NULL,
  `nome_fantasia_fornecedor` varchar(255) DEFAULT NULL,
  `cnpj_fornecedor` varchar(255) DEFAULT NULL,
  `cpf_fornecedor` varchar(255) DEFAULT NULL,
  `pessoa_fornecedor` varchar(255) DEFAULT NULL,
  `site_fornecedor` varchar(255) DEFAULT NULL,
  `observacoes_fornecedor` text,
  `nome_contato_fornecedor` varchar(255) DEFAULT NULL,
  `email_fornecedor` varchar(255) DEFAULT NULL,
  `telefone_fornecedor` varchar(255) DEFAULT NULL,
  `status_fornecedor` enum('ATIVO','INATIVO','EXCLUIDO') DEFAULT NULL,
  `data_cadastro_fornecedor` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id_fornecedor`, `foto_fornecedor`, `razao_social_fornecedor`, `nome_fantasia_fornecedor`, `cnpj_fornecedor`, `cpf_fornecedor`, `pessoa_fornecedor`, `site_fornecedor`, `observacoes_fornecedor`, `nome_contato_fornecedor`, `email_fornecedor`, `telefone_fornecedor`, `status_fornecedor`, `data_cadastro_fornecedor`, `timestamp`) VALUES
(3, '', 'Nova Atacado', 'Nova Atacado', '15.983.965/0001-19', '', 'PJ', '', '', 'Jo&atilde;o Barros', 'wellington-cezar@hotmail.com', '(23) 45445-4545', 'ATIVO', '2016-11-20 09:54:45', '2016-11-20 18:45:16'),
(4, '', 'Novo Fornecedor', 'nome fantasia', '05.163.630/0001-09', '', 'PJ', 'teste.com', '', 'wellington', 'wellington-cezar@hotmail.com', '(12) 13132-1231', 'ATIVO', '2016-11-20 12:15:34', '2016-11-20 18:45:09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores_agenda`
--

CREATE TABLE IF NOT EXISTS `fornecedores_agenda` (
`id_fornecedor_agenda` int(11) NOT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `titulo_agenda` varchar(255) DEFAULT NULL,
  `observacoes_agenda` text,
  `data_agenda` date DEFAULT NULL,
  `data_cadastro_agenda` datetime NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fornecedores_agenda`
--

INSERT INTO `fornecedores_agenda` (`id_fornecedor_agenda`, `id_fornecedor`, `titulo_agenda`, `observacoes_agenda`, `data_agenda`, `data_cadastro_agenda`, `timestamp`) VALUES
(1, 3, 'Visita do fornecedor para or&ccedil;amento', 'Sem observa&ccedil;&otilde;es', '2016-11-22', '2016-11-20 03:11:29', '2016-11-20 17:11:29'),
(2, 3, 'teste', 'teste', '2016-11-22', '2016-11-20 03:43:23', '2016-11-20 17:43:23'),
(3, 3, 'teste', 'teste', '2016-11-22', '2016-11-20 03:44:10', '2016-11-20 17:44:10'),
(4, 3, 'teste', 'teste', '2016-11-22', '2016-11-20 03:44:10', '2016-11-20 17:44:10'),
(5, 3, 'teste', 'teste', '2016-11-22', '2016-11-20 03:44:24', '2016-11-20 17:44:24'),
(6, 3, 'teste', 'teste', '2016-11-22', '2016-11-20 03:44:25', '2016-11-20 17:44:25'),
(7, 3, 'teste', 'teste', '2016-11-22', '2016-11-20 03:44:46', '2016-11-20 17:44:46'),
(8, 3, 'teste', 'teste', '2016-11-22', '2016-11-20 03:45:31', '2016-11-20 17:45:31'),
(9, 3, 'teste', 'teste', '2016-11-22', '2016-11-20 03:45:40', '2016-11-20 17:45:40'),
(10, 4, 'teste', 'observa&ccedil;oes', '2016-11-26', '2016-11-20 03:53:54', '2016-11-20 19:01:15'),
(11, 3, 'Visita do fornecedor para or&ccedil;amento', 'Sem observa&ccedil;&otilde;es', '2016-11-29', '2016-11-20 03:58:10', '2016-11-20 18:48:31'),
(12, 3, 'Visita do fornecedor para or&ccedil;amento', 'sem observa&ccedil;&otilde;es', '2016-11-22', '2016-11-20 03:59:41', '2016-11-20 17:59:41'),
(13, 3, 'teste', 'tese', '2016-12-01', '2016-11-20 04:54:08', '2016-11-20 18:57:52'),
(14, 3, 'teste', 'teste', '2016-11-21', '2016-11-20 04:56:29', '2016-11-20 18:56:29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores_agenda_notificado`
--

CREATE TABLE IF NOT EXISTS `fornecedores_agenda_notificado` (
`id_agenda_notificado` int(11) NOT NULL,
  `id_fornecedor_agenda` int(11) DEFAULT NULL,
  `data_notificacao` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fornecedores_agenda_notificado`
--

INSERT INTO `fornecedores_agenda_notificado` (`id_agenda_notificado`, `id_fornecedor_agenda`, `data_notificacao`) VALUES
(1, 1, '2016-11-20'),
(2, 2, '2016-11-20'),
(3, 3, '2016-11-20'),
(4, 4, '2016-11-20'),
(5, 5, '2016-11-20'),
(6, 6, '2016-11-20'),
(7, 7, '2016-11-20'),
(8, 8, '2016-11-20'),
(9, 9, '2016-11-20'),
(10, 10, '2016-11-20'),
(11, 12, '2016-11-20'),
(12, 11, '2016-11-20'),
(13, 13, '2016-11-20'),
(14, 14, '2016-11-20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE IF NOT EXISTS `funcionarios` (
`id_funcionario` int(11) NOT NULL,
  `foto_funcionario` varchar(255) DEFAULT NULL,
  `nome_funcionario` varchar(255) NOT NULL,
  `sobrenome_funcionario` varchar(255) NOT NULL,
  `data_nascimento_funcionario` date NOT NULL,
  `sexo_funcionario` char(1) NOT NULL,
  `rg_funcionario` varchar(255) DEFAULT NULL,
  `cpf_funcionario` varchar(255) NOT NULL,
  `estado_civil_funcionario` varchar(255) DEFAULT NULL,
  `escolaridade_funcionario` varchar(255) DEFAULT NULL,
  `email_funcionario` varchar(255) DEFAULT NULL,
  `telefone_funcionario` varchar(255) DEFAULT NULL,
  `codigo_funcionario` varchar(255) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `data_admissao_funcionario` date DEFAULT NULL,
  `data_demissao_funcionario` date DEFAULT NULL,
  `status_funcionario` enum('ATIVO','INATIVO','EXCLUIDO') NOT NULL DEFAULT 'ATIVO',
  `data_cadastro_funcionario` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `foto_funcionario`, `nome_funcionario`, `sobrenome_funcionario`, `data_nascimento_funcionario`, `sexo_funcionario`, `rg_funcionario`, `cpf_funcionario`, `estado_civil_funcionario`, `escolaridade_funcionario`, `email_funcionario`, `telefone_funcionario`, `codigo_funcionario`, `id_cargo`, `data_admissao_funcionario`, `data_demissao_funcionario`, `status_funcionario`, `data_cadastro_funcionario`, `timestamp`) VALUES
(1, '8e54741ba48338947adbe8d4263ec0bc.png', 'Wellington', 'C&eacute;zar Targino de s&aacute;', '1991-02-04', 'M', '', '526.618.456-66', 'Solteiro', 'Ensino Superior Completo', 'wellington.infodahora@gmail.com', '(12) 34567-8978', '201116.8852', 1, '2016-11-20', '0000-00-00', 'ATIVO', '2016-11-20 12:34:31', '2016-11-20 03:01:16'),
(3, '', 'Diego', 'Hernandes', '2016-11-20', 'M', '', '194.188.475-07', 'Solteiro', 'Ensino Superior Completo', 'diego-hernandes@hotmail.com', '(23) 4234-23432', '201116.9847', 2, '2016-11-20', '0000-00-00', 'ATIVO', '2016-11-20 12:51:11', '2016-11-20 02:51:11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `localizacao_lote`
--

CREATE TABLE IF NOT EXISTS `localizacao_lote` (
`id_localizacao_lote` int(11) NOT NULL,
  `id_produto_lote` int(11) DEFAULT NULL,
  `id_unidade_medida_produto` int(11) DEFAULT NULL,
  `localizacao` enum('ARMAZEM','PRATELEIRA','DESCARTADOS') NOT NULL DEFAULT 'ARMAZEM',
  `quantidade_localizacao` decimal(10,2) DEFAULT NULL,
  `observacoes_localizacao_lote` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `localizacao_lote`
--

INSERT INTO `localizacao_lote` (`id_localizacao_lote`, `id_produto_lote`, `id_unidade_medida_produto`, `localizacao`, `quantidade_localizacao`, `observacoes_localizacao_lote`, `timestamp`) VALUES
(1, 1, 5, 'ARMAZEM', '9.90', '', '2016-11-20 15:17:19'),
(2, 2, 4, 'ARMAZEM', '100.00', '', '2016-11-20 15:11:05'),
(3, 2, 4, 'PRATELEIRA', '0.00', '', '2016-11-20 23:21:39'),
(4, 1, 4, 'DESCARTADOS', '10.00', '', '2016-11-20 15:17:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE IF NOT EXISTS `marcas` (
`id_marca` int(11) NOT NULL,
  `nome_marca` varchar(255) DEFAULT NULL,
  `status_marca` enum('ATIVO','INATIVO','EXCLUIDO') NOT NULL DEFAULT 'ATIVO',
  `data_cadastro_marca` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nome_marca`, `status_marca`, `data_cadastro_marca`, `timestamp`) VALUES
(1, 'BAUDUCCO', 'ATIVO', '2016-11-20 10:10:00', '2016-11-20 12:15:06'),
(2, 'BOMBRIL', 'ATIVO', '2016-11-20 10:10:20', '2016-11-20 12:10:20'),
(3, 'COCA-COLA', 'ATIVO', '2016-11-20 10:10:36', '2016-11-20 12:10:36'),
(4, 'DANONINHO', 'ATIVO', '2016-11-20 10:10:45', '2016-11-20 12:10:45'),
(5, 'DONA BENTA', 'ATIVO', '2016-11-20 10:10:53', '2016-11-20 12:10:53'),
(6, 'ELEFANTE', 'ATIVO', '2016-11-20 10:11:03', '2016-11-20 12:11:03'),
(7, 'HAVAIANAS', 'ATIVO', '2016-11-20 10:11:12', '2016-11-20 12:11:12'),
(8, 'KIBON', 'ATIVO', '2016-11-20 10:11:23', '2016-11-20 12:11:23'),
(9, 'KNORR', 'ATIVO', '2016-11-20 10:11:33', '2016-11-20 12:11:33'),
(10, 'LUX', 'ATIVO', '2016-11-20 10:11:43', '2016-11-20 12:11:43'),
(11, 'MAGGI', 'ATIVO', '2016-11-20 10:11:51', '2016-11-20 12:11:51'),
(12, 'NESCAF&Eacute;', 'ATIVO', '2016-11-20 10:12:00', '2016-11-20 12:12:00'),
(13, 'NESCAU', 'ATIVO', '2016-11-20 10:12:08', '2016-11-20 12:12:08'),
(14, 'NISSIN L&Aacute;MEN', 'ATIVO', '2016-11-20 10:12:18', '2016-11-20 12:12:18'),
(15, 'OMO', 'ATIVO', '2016-11-20 10:12:27', '2016-11-20 12:12:27'),
(16, 'SEDA', 'ATIVO', '2016-11-20 10:12:45', '2016-11-20 12:12:45'),
(17, 'TURMA DA M&Ocirc;NICA', 'ATIVO', '2016-11-20 10:13:03', '2016-11-20 12:13:03'),
(18, 'UNI&Atilde;O', 'ATIVO', '2016-11-20 10:13:12', '2016-11-20 12:13:12'),
(19, 'VEJA', 'ATIVO', '2016-11-20 10:13:20', '2016-11-20 12:13:20'),
(20, 'YP&Ecirc;', 'ATIVO', '2016-11-20 10:13:33', '2016-11-20 12:13:33');

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivel_acesso`
--

CREATE TABLE IF NOT EXISTS `nivel_acesso` (
`id_nivel_acesso` int(11) NOT NULL,
  `nome_nivel_acesso` varchar(100) DEFAULT NULL,
  `tipo_permissao` enum('ADMINISTRADOR','USUARIO') NOT NULL,
  `index_access_db_name` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `nivel_acesso`
--

INSERT INTO `nivel_acesso` (`id_nivel_acesso`, `nome_nivel_acesso`, `tipo_permissao`, `index_access_db_name`, `timestamp`) VALUES
(1, 'Administrativo', 'ADMINISTRADOR', 'default', '2016-10-14 03:49:01'),
(2, 'Gerência', 'USUARIO', 'gerencia', '2016-10-14 03:49:06'),
(4, 'Caixa', 'USUARIO', 'caixa', '2016-10-14 03:49:12'),
(5, 'Suprimentos', 'USUARIO', 'suprimentos', '2016-10-14 03:49:16'),
(6, 'Estoquista', 'USUARIO', 'estoquista', '2016-10-14 03:49:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivel_estoque`
--

CREATE TABLE IF NOT EXISTS `nivel_estoque` (
`id_nivel_estoque` int(11) NOT NULL,
  `id_estoque` int(11) DEFAULT NULL,
  `quantidade_minima` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quantidade_maxima` decimal(10,2) NOT NULL DEFAULT '0.00',
  `id_unidade_medida_produto` int(11) DEFAULT NULL,
  `localizacao_estoque` enum('ARMAZEM','PRATELEIRA','DESCARTADOS') DEFAULT 'ARMAZEM'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `nivel_estoque`
--

INSERT INTO `nivel_estoque` (`id_nivel_estoque`, `id_estoque`, `quantidade_minima`, `quantidade_maxima`, `id_unidade_medida_produto`, `localizacao_estoque`) VALUES
(1, 1, '33.00', '193.00', NULL, 'ARMAZEM'),
(2, 1, '0.00', '0.00', NULL, 'PRATELEIRA'),
(3, 1, '0.00', '0.00', NULL, 'DESCARTADOS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `produtos` (
`id_produto` int(11) NOT NULL,
  `foto_produto` varchar(255) DEFAULT NULL,
  `codigo_barra_gti` varchar(20) DEFAULT NULL,
  `nome_produto` varchar(255) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `descricao_produto` text,
  `status_produto` enum('ATIVO','INATIVO','EXCLUIDO') NOT NULL,
  `data_validade_controlada` tinyint(1) NOT NULL DEFAULT '0',
  `data_cadastro_produto` datetime NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `foto_produto`, `codigo_barra_gti`, `nome_produto`, `id_marca`, `id_categoria`, `descricao_produto`, `status_produto`, `data_validade_controlada`, `data_cadastro_produto`, `timestamp`) VALUES
(1, '176990088d6ec03de0a42c282978f13d.jpg', '1213211311312', 'Biscoito Wafer Chocolate', 1, 3, 'Biscoito Wafer Chocolate - 165g', 'ATIVO', 1, '2016-11-20 10:32:46', '2016-11-20 22:19:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_preco`
--

CREATE TABLE IF NOT EXISTS `produtos_preco` (
`id_produto_preco` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `preco_produto` decimal(10,2) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `preco_padrao` tinyint(1) DEFAULT '0',
  `data_cadastro` date DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos_preco`
--

INSERT INTO `produtos_preco` (`id_produto_preco`, `id_produto`, `preco_produto`, `data_inicio`, `data_fim`, `preco_padrao`, `data_cadastro`, `timestamp`) VALUES
(1, 1, '2.99', '0000-00-00', '0000-00-00', 1, '0000-00-00', '2016-11-20 21:38:39');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_vendidos`
--

CREATE TABLE IF NOT EXISTS `produtos_vendidos` (
`id_produto_vendido` int(11) NOT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `quantidade_produto_vendido` decimal(10,2) DEFAULT NULL,
  `unidade_medida_vendido` varchar(255) DEFAULT NULL,
  `preco_vendido` decimal(10,2) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos_vendidos`
--

INSERT INTO `produtos_vendidos` (`id_produto_vendido`, `id_venda`, `id_produto`, `quantidade_produto_vendido`, `unidade_medida_vendido`, `preco_vendido`, `timestamp`) VALUES
(7, 7, 1, '1.00', '', '2.99', '2016-11-20 23:06:09'),
(8, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(9, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(10, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(11, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(12, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(13, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(14, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(15, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(16, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(17, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(18, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(19, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(20, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(21, 8, 1, '1.00', '', '2.99', '2016-11-20 23:14:57'),
(22, 9, 1, '1.00', '', '2.99', '2016-11-20 23:15:59'),
(23, 9, 1, '14.00', '', '2.99', '2016-11-20 23:15:59'),
(24, 10, 1, '1.00', '', '2.99', '2016-11-20 23:19:52'),
(25, 11, 1, '63.00', '', '2.99', '2016-11-20 23:21:39'),
(26, 12, 1, '1.00', '', '2.99', '2016-11-20 23:24:37'),
(27, 12, 1, '10.00', '', '2.99', '2016-11-20 23:24:37'),
(28, 13, 1, '1.00', '', '2.99', '2016-11-20 23:25:10');

--
-- Acionadores `produtos_vendidos`
--
DELIMITER //
CREATE TRIGGER `atualizaNivelEstoque` AFTER INSERT ON `produtos_vendidos`
 FOR EACH ROW begin
  DECLARE idlocalLote int;
    DECLARE qtdLocalAtual decimal;
    DECLARE qtdVendido decimal;
    SET qtdVendido = NEW.quantidade_produto_vendido;
  qtd_loop: LOOP
      IF qtdVendido > 0 THEN
      SELECT localizacao_lote.id_localizacao_lote, localizacao_lote.quantidade_localizacao
      INTO idlocalLote, qtdLocalAtual
      FROM localizacao_lote 
        INNER JOIN produtos ON produtos.id_produto = NEW.id_produto 
        inner join estoque on estoque.id_produto = produtos.id_produto 
        inner join produto_lote on produto_lote.id_estoque = estoque.id_estoque 
        WHERE 
      localizacao_lote.localizacao = 'PRATELEIRA' 
        AND localizacao_lote.id_produto_lote = produto_lote.id_produto_lote
        AND localizacao_lote.quantidade_localizacao > 0
        LIMIT 1;
        
        
        IF qtdLocalAtual >= qtdVendido THEN /*se a quantidade for o suficiente para retirada*/
            update localizacao_lote set quantidade_localizacao = quantidade_localizacao-qtdVendido 
              WHERE localizacao = 'PRATELEIRA' AND id_localizacao_lote = idlocalLote;
            LEAVE qtd_loop;
        ELSE /*senao faz o loop para pegar os proximas quantidades*/
            set qtdVendido = qtdVendido-qtdLocalAtual;
            update localizacao_lote set quantidade_localizacao = quantidade_localizacao-qtdLocalAtual WHERE localizacao = 'PRATELEIRA' AND id_localizacao_lote = idlocalLote;
        end IF;
    ELSE
      LEAVE qtd_loop;
    END IF; 

    END LOOP qtd_loop;
  
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_fornecedores`
--

CREATE TABLE IF NOT EXISTS `produto_fornecedores` (
`id_produto_fornecedor` int(11) NOT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto_fornecedores`
--

INSERT INTO `produto_fornecedores` (`id_produto_fornecedor`, `id_produto`, `id_fornecedor`) VALUES
(2, 1, 4),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_lote`
--

CREATE TABLE IF NOT EXISTS `produto_lote` (
`id_produto_lote` int(11) NOT NULL,
  `id_estoque` int(11) DEFAULT NULL,
  `codigo_lote` varchar(255) DEFAULT NULL,
  `codigo_barras_gti` varchar(15) DEFAULT NULL,
  `codigo_barras_gst` varchar(255) DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto_lote`
--

INSERT INTO `produto_lote` (`id_produto_lote`, `id_estoque`, `codigo_lote`, `codigo_barras_gti`, `codigo_barras_gst`, `data_validade`, `timestamp`) VALUES
(1, 1, 'LBWC1', '', '', '2016-12-31', '2016-11-20 15:07:00'),
(2, 1, 'BWC02', '', '', '2016-11-30', '2016-11-20 15:07:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_actions`
--

CREATE TABLE IF NOT EXISTS `sys_actions` (
`id_action` int(11) NOT NULL,
  `url_action` varchar(100) DEFAULT NULL,
  `nome_action` varchar(100) DEFAULT NULL,
  `status_action` varchar(100) DEFAULT NULL,
  `status_selecao_action` varchar(100) DEFAULT NULL,
  `id_pagina` int(11) DEFAULT NULL,
  `posicao_action` int(11) DEFAULT NULL,
  `data_criacao_action` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sys_actions`
--

INSERT INTO `sys_actions` (`id_action`, `url_action`, `nome_action`, `status_action`, `status_selecao_action`, `id_pagina`, `posicao_action`, `data_criacao_action`) VALUES
(1, 'index', NULL, 'INATIVO', 'INATIVO', 1, NULL, '2016-11-19 22:02:25'),
(5, 'index', 'Home', 'ATIVO', 'ATIVO', 2, NULL, '2016-11-19 22:10:59'),
(6, 'index', 'Home', 'ATIVO', 'INATIVO', 3, NULL, '2016-11-19 22:11:23'),
(7, 'index', NULL, 'ATIVO', 'INATIVO', 4, NULL, '2016-11-19 23:09:47'),
(8, 'editar', NULL, 'ATIVO', 'INATIVO', 4, NULL, '2016-11-19 23:10:15'),
(9, 'index', NULL, 'ATIVO', 'INATIVO', 5, NULL, '2016-11-19 23:22:22'),
(10, 'index', 'Home', 'ATIVO', 'INATIVO', 6, NULL, '2016-11-19 23:22:32'),
(11, 'cadastrar', NULL, 'ATIVO', 'INATIVO', 6, NULL, '2016-11-20 00:20:10'),
(12, 'editar', NULL, 'ATIVO', 'INATIVO', 6, NULL, '2016-11-20 00:39:12'),
(13, 'index', 'Home', 'ATIVO', 'INATIVO', 7, NULL, '2016-11-20 00:42:38'),
(14, 'editar', 'Editar', 'ATIVO', 'INATIVO', 7, NULL, '2016-11-20 00:42:53'),
(15, 'index', 'Home', 'ATIVO', 'INATIVO', 8, NULL, '2016-11-20 00:43:02'),
(16, 'cadastrar', 'Cadastrar', 'ATIVO', 'INATIVO', 7, NULL, '2016-11-20 00:47:13'),
(17, 'cadastrar', NULL, 'ATIVO', 'INATIVO', 8, NULL, '2016-11-20 00:48:35'),
(18, 'index', 'Home', 'ATIVO', 'INATIVO', 9, NULL, '2016-11-20 01:13:46'),
(19, 'cadastrar', 'Cadastrar', 'ATIVO', 'INATIVO', 9, NULL, '2016-11-20 01:14:22'),
(20, 'index', NULL, 'ATIVO', 'INATIVO', 10, NULL, '2016-11-20 01:23:14'),
(21, 'editar', NULL, 'ATIVO', 'INATIVO', 9, NULL, '2016-11-20 09:56:00'),
(22, 'index', 'Home', 'ATIVO', 'INATIVO', 11, NULL, '2016-11-20 10:03:02'),
(23, 'cadastrar', 'Cadastrar', 'ATIVO', 'INATIVO', 11, NULL, '2016-11-20 10:03:44'),
(24, 'index', 'Home', 'ATIVO', 'INATIVO', 12, NULL, '2016-11-20 10:08:25'),
(25, 'cadastrar', NULL, 'ATIVO', 'INATIVO', 12, NULL, '2016-11-20 10:09:08'),
(26, 'editar', NULL, 'ATIVO', 'INATIVO', 12, NULL, '2016-11-20 10:14:56'),
(27, 'cadastrar', NULL, 'ATIVO', 'INATIVO', 10, NULL, '2016-11-20 10:15:25'),
(28, 'precos', NULL, 'ATIVO', 'INATIVO', 10, NULL, '2016-11-20 10:32:53'),
(29, 'editar', NULL, 'ATIVO', 'INATIVO', 10, NULL, '2016-11-20 10:33:42'),
(30, 'index', 'Home', 'ATIVO', 'INATIVO', 13, NULL, '2016-11-20 12:59:51'),
(31, 'index', NULL, 'ATIVO', 'INATIVO', 14, NULL, '2016-11-20 13:03:05'),
(32, 'index', NULL, 'ATIVO', 'INATIVO', 15, NULL, '2016-11-20 13:03:12'),
(33, 'index', NULL, 'ATIVO', 'INATIVO', 16, NULL, '2016-11-20 13:03:17'),
(34, 'entrada', NULL, 'ATIVO', 'INATIVO', 15, NULL, '2016-11-20 13:04:06'),
(35, 'index', 'Home', 'ATIVO', 'INATIVO', 17, NULL, '2016-11-20 13:40:17'),
(36, 'cadastrar', NULL, 'INATIVO', 'INATIVO', 17, NULL, '2016-11-20 14:34:52'),
(37, 'index', NULL, 'ATIVO', 'INATIVO', 18, NULL, '2016-11-20 14:36:16'),
(38, 'index', NULL, 'ATIVO', 'INATIVO', 19, NULL, '2016-11-20 14:48:16'),
(39, 'cadastrar', NULL, 'INATIVO', 'INATIVO', 19, NULL, '2016-11-20 14:53:02'),
(40, 'index', NULL, 'INATIVO', 'INATIVO', 20, NULL, '2016-11-20 17:12:28'),
(41, 'index', NULL, 'ATIVO', 'INATIVO', 21, NULL, '2016-11-20 18:35:50'),
(42, 'index', 'Home', 'ATIVO', 'INATIVO', 22, NULL, '2016-11-20 18:40:56'),
(43, 'index', NULL, 'ATIVO', 'INATIVO', 23, NULL, '2016-11-20 18:41:04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_modulos`
--

CREATE TABLE IF NOT EXISTS `sys_modulos` (
`id_modulo` int(11) NOT NULL,
  `url_modulo` varchar(100) NOT NULL,
  `nome_modulo` varchar(100) DEFAULT NULL,
  `posicao_modulo` int(11) DEFAULT NULL,
  `status_modulo` enum('ATIVO','INATIVO','EXCLUIDO') DEFAULT NULL,
  `status_selecao_modulo` enum('ATIVO','INATIVO','EXCLUIDO') DEFAULT NULL,
  `id_modulo_pai` int(11) DEFAULT NULL,
  `icone_modulo` varchar(255) DEFAULT NULL,
  `data_criacao_modulo` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sys_modulos`
--

INSERT INTO `sys_modulos` (`id_modulo`, `url_modulo`, `nome_modulo`, `posicao_modulo`, `status_modulo`, `status_selecao_modulo`, `id_modulo_pai`, `icone_modulo`, `data_criacao_modulo`) VALUES
(0, '', 'ROOT', 0, 'ATIVO', 'INATIVO', NULL, NULL, '2016-01-20 00:00:00'),
(1, 'configuracoes', 'Configura&ccedil;&otilde;es', 8, 'ATIVO', 'INATIVO', 0, 'glyphicons glyphicons-cogwheels', '2016-11-19 22:10:59'),
(2, 'modulos', 'M&oacute;dulos', NULL, 'ATIVO', 'INATIVO', 1, NULL, '2016-11-19 22:11:23'),
(3, 'niveis_acesso', 'N&iacute;veis de acesso', NULL, 'ATIVO', 'INATIVO', 1, NULL, '2016-11-19 23:09:47'),
(4, 'empresa', NULL, NULL, 'ATIVO', 'INATIVO', 1, NULL, '2016-11-19 23:22:22'),
(5, 'funcionarios', 'Funcion&aacute;rios', 0, 'ATIVO', 'INATIVO', 0, 'glyphicons glyphicons-group', '2016-11-19 23:22:32'),
(6, 'cargos', 'Cargos', NULL, 'ATIVO', 'INATIVO', 5, NULL, '2016-11-20 00:42:38'),
(7, 'usuarios', 'Usu&aacute;rios', NULL, 'ATIVO', 'INATIVO', 5, NULL, '2016-11-20 00:43:02'),
(8, 'fornecedores', 'Fornecedores', 1, 'ATIVO', 'INATIVO', 0, 'glyphicons glyphicons-handshake', '2016-11-20 01:13:44'),
(9, 'produtos', 'Produtos', 2, 'ATIVO', 'INATIVO', 0, 'glyphicons glyphicons-package', '2016-11-20 01:23:13'),
(10, 'categorias', 'Categorias', NULL, 'ATIVO', 'INATIVO', 9, NULL, '2016-11-20 10:03:02'),
(11, 'marcas', 'Marcas', NULL, 'ATIVO', 'INATIVO', 9, NULL, '2016-11-20 10:08:25'),
(12, 'estoque', 'Estoque', 3, 'ATIVO', 'INATIVO', 0, 'glyphicons glyphicons-cargo', '2016-11-20 12:59:51'),
(13, 'prateleira', 'Prateleira', NULL, 'ATIVO', 'INATIVO', 12, NULL, '2016-11-20 13:03:05'),
(14, 'armazem', 'Armaz&eacute;m', NULL, 'ATIVO', 'INATIVO', 12, NULL, '2016-11-20 13:03:12'),
(15, 'descartados', 'Descartados', NULL, 'ATIVO', 'INATIVO', 12, NULL, '2016-11-20 13:03:17'),
(16, 'caixa', 'Caixa', 4, 'ATIVO', 'INATIVO', 0, 'glyphicons glyphicons-calculator', '2016-11-20 13:40:17'),
(17, 'checkout', 'Checkout', NULL, 'ATIVO', 'INATIVO', 16, NULL, '2016-11-20 14:36:16'),
(18, 'agenda', 'Agenda', 6, 'ATIVO', 'INATIVO', 0, 'glyphicons glyphicons-calendar', '2016-11-20 14:48:16'),
(19, 'suprimentos', 'Suprimentos', 5, 'ATIVO', 'INATIVO', 0, 'glyphicons glyphicons-transfer', '2016-11-20 17:12:27'),
(20, 'requisicoes', 'Requisi&ccedil;&otilde;es', NULL, 'ATIVO', 'INATIVO', 19, NULL, '2016-11-20 18:35:50'),
(21, 'relatorios', 'Relat&oacute;rios', 7, 'ATIVO', 'INATIVO', 0, 'glyphicons glyphicons-stats', '2016-11-20 18:40:55'),
(22, 'vendas', 'Vendas', NULL, 'ATIVO', 'INATIVO', 21, NULL, '2016-11-20 18:41:03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_paginas`
--

CREATE TABLE IF NOT EXISTS `sys_paginas` (
`id_pagina` int(11) NOT NULL,
  `url_pagina` varchar(100) DEFAULT NULL,
  `nome_pagina` varchar(100) DEFAULT NULL,
  `posicao_pagina` int(11) DEFAULT NULL,
  `status_pagina` varchar(100) DEFAULT NULL,
  `status_selecao_pagina` varchar(100) DEFAULT NULL,
  `id_modulo` int(11) DEFAULT NULL,
  `data_criacao_pagina` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sys_paginas`
--

INSERT INTO `sys_paginas` (`id_pagina`, `url_pagina`, `nome_pagina`, `posicao_pagina`, `status_pagina`, `status_selecao_pagina`, `id_modulo`, `data_criacao_pagina`) VALUES
(1, 'gerenciar', NULL, NULL, 'INATIVO', 'INATIVO', 0, '2016-11-19 22:02:25'),
(2, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 1, '2016-11-19 22:10:59'),
(3, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 2, '2016-11-19 22:11:23'),
(4, 'gerenciar', NULL, NULL, 'ATIVO', 'INATIVO', 3, '2016-11-19 23:09:47'),
(5, 'gerenciar', NULL, NULL, 'ATIVO', 'INATIVO', 4, '2016-11-19 23:22:22'),
(6, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 5, '2016-11-19 23:22:32'),
(7, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 6, '2016-11-20 00:42:38'),
(8, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 7, '2016-11-20 00:43:02'),
(9, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 8, '2016-11-20 01:13:45'),
(10, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 9, '2016-11-20 01:23:14'),
(11, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 10, '2016-11-20 10:03:02'),
(12, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 11, '2016-11-20 10:08:25'),
(13, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 12, '2016-11-20 12:59:51'),
(14, 'gerenciar', NULL, NULL, 'ATIVO', 'INATIVO', 13, '2016-11-20 13:03:05'),
(15, 'gerenciar', NULL, NULL, 'ATIVO', 'INATIVO', 14, '2016-11-20 13:03:12'),
(16, 'gerenciar', NULL, NULL, 'ATIVO', 'INATIVO', 15, '2016-11-20 13:03:17'),
(17, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 16, '2016-11-20 13:40:17'),
(18, 'gerenciar', NULL, NULL, 'ATIVO', 'INATIVO', 17, '2016-11-20 14:36:16'),
(19, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 18, '2016-11-20 14:48:16'),
(20, 'gerenciar', 'Gerenciar', NULL, 'INATIVO', 'INATIVO', 19, '2016-11-20 17:12:27'),
(21, 'gerenciar', NULL, NULL, 'ATIVO', 'INATIVO', 20, '2016-11-20 18:35:50'),
(22, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 21, '2016-11-20 18:40:56'),
(23, 'gerenciar', 'Gerenciar', NULL, 'ATIVO', 'INATIVO', 22, '2016-11-20 18:41:03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_usuarios`
--

CREATE TABLE IF NOT EXISTS `sys_usuarios` (
`id_usuario` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_nivel_acesso` int(11) DEFAULT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `login_usuario` varchar(255) NOT NULL,
  `senha_usuario` varchar(255) NOT NULL,
  `hash_acesso` text,
  `status_usuario` varchar(255) DEFAULT NULL,
  `data_criacao_usuario` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sys_usuarios`
--

INSERT INTO `sys_usuarios` (`id_usuario`, `id_funcionario`, `id_nivel_acesso`, `email_usuario`, `login_usuario`, `senha_usuario`, `hash_acesso`, `status_usuario`, `data_criacao_usuario`, `timestamp`) VALUES
(1, 1, 1, 'admin@prysmarket.com.br', 'admin', '$2a$08$MTY2MjMyMDcyMTU3MmJjNe4RI1/LIguX39aJwjjJ374Tx2TdxfSXe', '$2a$08$MTMyMTcxNjkzMjU4MzExMeuBuvewzGrFUufZGRnO6/HL2y8dgbFB6', 'ATIVO', NULL, '2016-05-06 01:17:49'),
(3, 3, 2, 'teste@teste.com', 'teste', '$2a$08$MTc5NDcwODE0MDU4MzExM.gMPRQ6mBY7KlZsQjNOrB.piaTF.nJz2', '$2a$08$MTkwNTUzMzI1NTU4MzExM.m5SxQ9AYaLujgyXhr/FTKvYypXdBRSO', 'ATIVO', '2016-11-20 12:56:18', '2016-11-20 02:56:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_usuarios_acessos`
--

CREATE TABLE IF NOT EXISTS `sys_usuarios_acessos` (
`id_usuarios_acesso` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_acesso` date DEFAULT NULL,
  `hora_acesso` time DEFAULT NULL,
  `ip_acesso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sys_usuarios_acessos`
--

INSERT INTO `sys_usuarios_acessos` (`id_usuarios_acesso`, `id_usuario`, `data_acesso`, `hora_acesso`, `ip_acesso`) VALUES
(4, 3, '2016-11-20', '00:56:58', '::1'),
(5, 1, '2016-11-20', '01:00:03', '::1'),
(6, 1, '2016-11-20', '01:01:25', '::1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidade_medida`
--

CREATE TABLE IF NOT EXISTS `unidade_medida` (
`id_unidade_medida` int(11) NOT NULL,
  `nome_unidade_medida` varchar(255) NOT NULL,
  `abreviacao_unidade_medida` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `unidade_medida`
--

INSERT INTO `unidade_medida` (`id_unidade_medida`, `nome_unidade_medida`, `abreviacao_unidade_medida`) VALUES
(1, 'Grama(s)', 'g'),
(2, 'Quilograma(s)', 'Kg'),
(7, 'Pacote(s)', 'PC'),
(10, 'Unidade(s)', 'UN'),
(11, 'Caixa(s)', 'CX'),
(12, 'Lata(s)', 'LT'),
(13, 'Dúzia(s)', 'DZ'),
(14, 'Metro(s)', 'm'),
(15, 'Centímetro(s)', 'cm'),
(16, 'Litro(s)', 'L'),
(17, 'Fardo(s)', 'FD'),
(18, 'Kit', 'KT');

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidade_medida_produto`
--

CREATE TABLE IF NOT EXISTS `unidade_medida_produto` (
`id_unidade_medida_produto` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_unidade_medida` int(11) NOT NULL,
  `fator_unidade_medida` decimal(10,2) NOT NULL,
  `para_venda` tinyint(1) NOT NULL DEFAULT '0',
  `para_estoque` tinyint(1) NOT NULL DEFAULT '0',
  `ordem` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `unidade_medida_produto`
--

INSERT INTO `unidade_medida_produto` (`id_unidade_medida_produto`, `id_produto`, `id_unidade_medida`, `fator_unidade_medida`, `para_venda`, `para_estoque`, `ordem`, `timestamp`) VALUES
(4, 1, 7, '1.00', 1, 0, 0, '2016-11-20 15:20:04'),
(5, 1, 11, '100.00', 0, 1, 1, '2016-11-20 15:20:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE IF NOT EXISTS `vendas` (
`id_venda` int(11) NOT NULL,
  `id_abertura_caixa` int(11) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `hora_venda` time DEFAULT NULL,
  `forma_pagamento` enum('DINHEIRO','CARTAODEBITO','CARTAOCREDITO') NOT NULL,
  `valor_pago` decimal(10,2) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id_venda`, `id_abertura_caixa`, `data_venda`, `hora_venda`, `forma_pagamento`, `valor_pago`, `timestamp`) VALUES
(7, 40, '2016-11-20', '21:06:09', 'DINHEIRO', '5.00', '2016-11-20 23:06:09'),
(8, 41, '2016-11-20', '21:14:57', 'CARTAOCREDITO', '0.00', '2016-11-20 23:14:57'),
(9, 41, '2016-11-20', '21:15:59', 'DINHEIRO', '45.00', '2016-11-20 23:15:59'),
(10, 42, '2016-11-20', '21:19:52', 'DINHEIRO', '3.00', '2016-11-20 23:19:52'),
(11, 42, '2016-11-20', '21:21:39', 'DINHEIRO', '200.00', '2016-11-20 23:21:39'),
(12, 43, '2016-11-20', '21:24:37', 'DINHEIRO', '50.00', '2016-11-20 23:24:37'),
(13, 43, '2016-11-20', '21:25:10', 'CARTAODEBITO', '0.00', '2016-11-20 23:25:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abertura_caixa`
--
ALTER TABLE `abertura_caixa`
 ADD PRIMARY KEY (`id_abertura_caixa`), ADD KEY `abertura_caixa_ibfk_1` (`id_caixa`), ADD KEY `abertura_caixa_ibfk_2` (`id_usuario`);

--
-- Indexes for table `acesso_action`
--
ALTER TABLE `acesso_action`
 ADD PRIMARY KEY (`id_acesso_action`), ADD KEY `acesso_action_ibfk_1` (`id_nivel_acesso`), ADD KEY `acesso_action_ibfk_2` (`id_action`);

--
-- Indexes for table `acesso_modulo`
--
ALTER TABLE `acesso_modulo`
 ADD PRIMARY KEY (`id_acesso_modulo`), ADD KEY `acesso_modulo_ibfk_1` (`id_nivel_acesso`), ADD KEY `acesso_modulo_ibfk_2` (`id_modulo`);

--
-- Indexes for table `acesso_pagina`
--
ALTER TABLE `acesso_pagina`
 ADD PRIMARY KEY (`id_acesso_pagina`), ADD KEY `acesso_pagina_ibfk_1` (`id_nivel_acesso`), ADD KEY `acesso_pagina_ibfk_2` (`id_pagina`);

--
-- Indexes for table `caixas`
--
ALTER TABLE `caixas`
 ADD PRIMARY KEY (`id_caixa`), ADD UNIQUE KEY `ip_maquina` (`ip_maquina`);

--
-- Indexes for table `cargos`
--
ALTER TABLE `cargos`
 ADD PRIMARY KEY (`id_cargo`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
 ADD PRIMARY KEY (`id_categoria`), ADD UNIQUE KEY `nome_categoria` (`nome_categoria`);

--
-- Indexes for table `enderecos_fornecedores`
--
ALTER TABLE `enderecos_fornecedores`
 ADD PRIMARY KEY (`id_endereco`), ADD KEY `id_fornecedor` (`id_fornecedor`);

--
-- Indexes for table `enderecos_funcionarios`
--
ALTER TABLE `enderecos_funcionarios`
 ADD PRIMARY KEY (`id_endereco`), ADD KEY `id_funcionario` (`id_funcionario`);

--
-- Indexes for table `estoque`
--
ALTER TABLE `estoque`
 ADD PRIMARY KEY (`id_estoque`), ADD KEY `estoque_ibfk_1` (`id_produto`);

--
-- Indexes for table `fornecedores`
--
ALTER TABLE `fornecedores`
 ADD PRIMARY KEY (`id_fornecedor`);

--
-- Indexes for table `fornecedores_agenda`
--
ALTER TABLE `fornecedores_agenda`
 ADD PRIMARY KEY (`id_fornecedor_agenda`), ADD KEY `fornecedores_agenda_ibfk_1` (`id_fornecedor`);

--
-- Indexes for table `fornecedores_agenda_notificado`
--
ALTER TABLE `fornecedores_agenda_notificado`
 ADD PRIMARY KEY (`id_agenda_notificado`), ADD KEY `fornecedores_agenda_notificado_ibfk_1` (`id_fornecedor_agenda`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
 ADD PRIMARY KEY (`id_funcionario`), ADD UNIQUE KEY `cpf_funcionario` (`cpf_funcionario`), ADD UNIQUE KEY `codigo_funcionario` (`codigo_funcionario`), ADD KEY `funcionarios_ibfk_1` (`id_cargo`);

--
-- Indexes for table `localizacao_lote`
--
ALTER TABLE `localizacao_lote`
 ADD PRIMARY KEY (`id_localizacao_lote`), ADD KEY `localizacao_lote_ibfk_1` (`id_produto_lote`), ADD KEY `localizacao_lote_ibfk_2` (`id_unidade_medida_produto`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
 ADD PRIMARY KEY (`id_marca`);

--
-- Indexes for table `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
 ADD PRIMARY KEY (`id_nivel_acesso`);

--
-- Indexes for table `nivel_estoque`
--
ALTER TABLE `nivel_estoque`
 ADD PRIMARY KEY (`id_nivel_estoque`), ADD KEY `nivel_estoque_ibfk_1` (`id_estoque`), ADD KEY `nivel_estoque_ibfk_2` (`id_unidade_medida_produto`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
 ADD PRIMARY KEY (`id_produto`), ADD KEY `produtos_ibfk_1` (`id_marca`), ADD KEY `produtos_ibfk_2` (`id_categoria`);

--
-- Indexes for table `produtos_preco`
--
ALTER TABLE `produtos_preco`
 ADD PRIMARY KEY (`id_produto_preco`), ADD KEY `produtos_preco_ibfk_1` (`id_produto`);

--
-- Indexes for table `produtos_vendidos`
--
ALTER TABLE `produtos_vendidos`
 ADD PRIMARY KEY (`id_produto_vendido`), ADD KEY `produtos_vendidos_ibfk_1` (`id_venda`), ADD KEY `produtos_vendidos_ibfk_2` (`id_produto`);

--
-- Indexes for table `produto_fornecedores`
--
ALTER TABLE `produto_fornecedores`
 ADD PRIMARY KEY (`id_produto_fornecedor`), ADD KEY `produto_fornecedores_ibfk_1` (`id_produto`), ADD KEY `produto_fornecedores_ibfk_2` (`id_fornecedor`);

--
-- Indexes for table `produto_lote`
--
ALTER TABLE `produto_lote`
 ADD PRIMARY KEY (`id_produto_lote`), ADD UNIQUE KEY `codigo_lote` (`codigo_lote`), ADD KEY `produto_lote_ibfk_1` (`id_estoque`);

--
-- Indexes for table `sys_actions`
--
ALTER TABLE `sys_actions`
 ADD PRIMARY KEY (`id_action`), ADD KEY `sys_actions_ibfk_1` (`id_pagina`);

--
-- Indexes for table `sys_modulos`
--
ALTER TABLE `sys_modulos`
 ADD PRIMARY KEY (`id_modulo`), ADD KEY `id_modulo_pai` (`id_modulo_pai`);

--
-- Indexes for table `sys_paginas`
--
ALTER TABLE `sys_paginas`
 ADD PRIMARY KEY (`id_pagina`), ADD KEY `sys_paginas_ibfk_1` (`id_modulo`);

--
-- Indexes for table `sys_usuarios`
--
ALTER TABLE `sys_usuarios`
 ADD PRIMARY KEY (`id_usuario`), ADD UNIQUE KEY `email_usuario` (`email_usuario`), ADD UNIQUE KEY `login_usuario` (`login_usuario`), ADD UNIQUE KEY `id_funcionario_2` (`id_funcionario`), ADD KEY `sys_usuarios_ibfk_2` (`id_nivel_acesso`);

--
-- Indexes for table `sys_usuarios_acessos`
--
ALTER TABLE `sys_usuarios_acessos`
 ADD PRIMARY KEY (`id_usuarios_acesso`), ADD KEY `sys_usuarios_acessos_ibfk_1` (`id_usuario`);

--
-- Indexes for table `unidade_medida`
--
ALTER TABLE `unidade_medida`
 ADD PRIMARY KEY (`id_unidade_medida`), ADD UNIQUE KEY `abreviacao_unidade_medida` (`abreviacao_unidade_medida`);

--
-- Indexes for table `unidade_medida_produto`
--
ALTER TABLE `unidade_medida_produto`
 ADD PRIMARY KEY (`id_unidade_medida_produto`), ADD KEY `unidade_medida_produto_ibfk_1` (`id_produto`), ADD KEY `unidade_medida_produto_ibfk_2` (`id_unidade_medida`);

--
-- Indexes for table `vendas`
--
ALTER TABLE `vendas`
 ADD PRIMARY KEY (`id_venda`), ADD KEY `vendas_ibfk_1` (`id_abertura_caixa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abertura_caixa`
--
ALTER TABLE `abertura_caixa`
MODIFY `id_abertura_caixa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `acesso_action`
--
ALTER TABLE `acesso_action`
MODIFY `id_acesso_action` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `acesso_modulo`
--
ALTER TABLE `acesso_modulo`
MODIFY `id_acesso_modulo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `acesso_pagina`
--
ALTER TABLE `acesso_pagina`
MODIFY `id_acesso_pagina` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `caixas`
--
ALTER TABLE `caixas`
MODIFY `id_caixa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cargos`
--
ALTER TABLE `cargos`
MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `enderecos_fornecedores`
--
ALTER TABLE `enderecos_fornecedores`
MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `enderecos_funcionarios`
--
ALTER TABLE `enderecos_funcionarios`
MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `estoque`
--
ALTER TABLE `estoque`
MODIFY `id_estoque` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fornecedores`
--
ALTER TABLE `fornecedores`
MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fornecedores_agenda`
--
ALTER TABLE `fornecedores_agenda`
MODIFY `id_fornecedor_agenda` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `fornecedores_agenda_notificado`
--
ALTER TABLE `fornecedores_agenda_notificado`
MODIFY `id_agenda_notificado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `localizacao_lote`
--
ALTER TABLE `localizacao_lote`
MODIFY `id_localizacao_lote` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
MODIFY `id_nivel_acesso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `nivel_estoque`
--
ALTER TABLE `nivel_estoque`
MODIFY `id_nivel_estoque` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `produtos_preco`
--
ALTER TABLE `produtos_preco`
MODIFY `id_produto_preco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `produtos_vendidos`
--
ALTER TABLE `produtos_vendidos`
MODIFY `id_produto_vendido` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `produto_fornecedores`
--
ALTER TABLE `produto_fornecedores`
MODIFY `id_produto_fornecedor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `produto_lote`
--
ALTER TABLE `produto_lote`
MODIFY `id_produto_lote` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sys_actions`
--
ALTER TABLE `sys_actions`
MODIFY `id_action` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `sys_modulos`
--
ALTER TABLE `sys_modulos`
MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `sys_paginas`
--
ALTER TABLE `sys_paginas`
MODIFY `id_pagina` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `sys_usuarios`
--
ALTER TABLE `sys_usuarios`
MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sys_usuarios_acessos`
--
ALTER TABLE `sys_usuarios_acessos`
MODIFY `id_usuarios_acesso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `unidade_medida`
--
ALTER TABLE `unidade_medida`
MODIFY `id_unidade_medida` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `unidade_medida_produto`
--
ALTER TABLE `unidade_medida_produto`
MODIFY `id_unidade_medida_produto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vendas`
--
ALTER TABLE `vendas`
MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `abertura_caixa`
--
ALTER TABLE `abertura_caixa`
ADD CONSTRAINT `abertura_caixa_ibfk_1` FOREIGN KEY (`id_caixa`) REFERENCES `caixas` (`id_caixa`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `abertura_caixa_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `sys_usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `acesso_action`
--
ALTER TABLE `acesso_action`
ADD CONSTRAINT `acesso_action_ibfk_1` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `nivel_acesso` (`id_nivel_acesso`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `acesso_action_ibfk_2` FOREIGN KEY (`id_action`) REFERENCES `sys_actions` (`id_action`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `acesso_modulo`
--
ALTER TABLE `acesso_modulo`
ADD CONSTRAINT `acesso_modulo_ibfk_1` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `nivel_acesso` (`id_nivel_acesso`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `acesso_modulo_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `sys_modulos` (`id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `acesso_pagina`
--
ALTER TABLE `acesso_pagina`
ADD CONSTRAINT `acesso_pagina_ibfk_1` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `nivel_acesso` (`id_nivel_acesso`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `acesso_pagina_ibfk_2` FOREIGN KEY (`id_pagina`) REFERENCES `sys_paginas` (`id_pagina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `enderecos_fornecedores`
--
ALTER TABLE `enderecos_fornecedores`
ADD CONSTRAINT `enderecos_fornecedores_fk1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `enderecos_funcionarios`
--
ALTER TABLE `enderecos_funcionarios`
ADD CONSTRAINT `enderecos_funcionarios_fk1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `fornecedores_agenda`
--
ALTER TABLE `fornecedores_agenda`
ADD CONSTRAINT `fornecedores_agenda_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `fornecedores_agenda_notificado`
--
ALTER TABLE `fornecedores_agenda_notificado`
ADD CONSTRAINT `fornecedores_agenda_notificado_ibfk_1` FOREIGN KEY (`id_fornecedor_agenda`) REFERENCES `fornecedores_agenda` (`id_fornecedor_agenda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `localizacao_lote`
--
ALTER TABLE `localizacao_lote`
ADD CONSTRAINT `localizacao_lote_ibfk_1` FOREIGN KEY (`id_produto_lote`) REFERENCES `produto_lote` (`id_produto_lote`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `localizacao_lote_ibfk_2` FOREIGN KEY (`id_unidade_medida_produto`) REFERENCES `unidade_medida_produto` (`id_unidade_medida_produto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `nivel_estoque`
--
ALTER TABLE `nivel_estoque`
ADD CONSTRAINT `nivel_estoque_ibfk_1` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `nivel_estoque_ibfk_2` FOREIGN KEY (`id_unidade_medida_produto`) REFERENCES `unidade_medida_produto` (`id_unidade_medida_produto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Limitadores para a tabela `produtos_preco`
--
ALTER TABLE `produtos_preco`
ADD CONSTRAINT `produtos_preco_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produtos_vendidos`
--
ALTER TABLE `produtos_vendidos`
ADD CONSTRAINT `produtos_vendidos_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `vendas` (`id_venda`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `produtos_vendidos_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produto_fornecedores`
--
ALTER TABLE `produto_fornecedores`
ADD CONSTRAINT `produto_fornecedores_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `produto_fornecedores_ibfk_2` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produto_lote`
--
ALTER TABLE `produto_lote`
ADD CONSTRAINT `produto_lote_ibfk_1` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `sys_actions`
--
ALTER TABLE `sys_actions`
ADD CONSTRAINT `sys_actions_ibfk_1` FOREIGN KEY (`id_pagina`) REFERENCES `sys_paginas` (`id_pagina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `sys_modulos`
--
ALTER TABLE `sys_modulos`
ADD CONSTRAINT `sys_modulos_ibfk_1` FOREIGN KEY (`id_modulo_pai`) REFERENCES `sys_modulos` (`id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `sys_paginas`
--
ALTER TABLE `sys_paginas`
ADD CONSTRAINT `sys_paginas_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `sys_modulos` (`id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `sys_usuarios`
--
ALTER TABLE `sys_usuarios`
ADD CONSTRAINT `sys_usuarios_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE CASCADE,
ADD CONSTRAINT `sys_usuarios_ibfk_2` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `nivel_acesso` (`id_nivel_acesso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `sys_usuarios_acessos`
--
ALTER TABLE `sys_usuarios_acessos`
ADD CONSTRAINT `sys_usuarios_acessos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `sys_usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `unidade_medida_produto`
--
ALTER TABLE `unidade_medida_produto`
ADD CONSTRAINT `unidade_medida_produto_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `unidade_medida_produto_ibfk_2` FOREIGN KEY (`id_unidade_medida`) REFERENCES `unidade_medida` (`id_unidade_medida`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`id_abertura_caixa`) REFERENCES `abertura_caixa` (`id_abertura_caixa`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
