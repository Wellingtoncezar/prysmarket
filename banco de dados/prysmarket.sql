-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 26-Nov-2016 às 17:51
-- Versão do servidor: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `prysmarket`
--

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
(50, 1, 1, '800.00', '800.00', '2016-11-20 11:34:51', '2016-11-20 23:34:55', '2016-11-21 01:34:55'),
(51, 1, 1, '500.00', '600.00', '2016-11-21 03:29:59', '2016-11-21 15:31:25', '2016-11-21 14:31:25'),
(52, 1, 1, '800.00', '900.00', '2016-11-25 12:11:29', '2016-11-25 00:12:20', '2016-11-24 23:12:20'),
(53, 1, 1, '900.00', '900.00', '2016-11-25 12:14:16', '2016-11-25 00:14:32', '2016-11-24 23:14:32'),
(54, 1, 1, '800.00', '98798798.00', '2016-11-25 12:15:21', '2016-11-25 00:16:53', '2016-11-24 23:16:53');

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
(12, 2, 12),
(13, 4, 37);

--
-- Extraindo dados da tabela `acesso_modulo`
--

INSERT INTO `acesso_modulo` (`id_acesso_modulo`, `id_nivel_acesso`, `id_modulo`) VALUES
(1, 6, 1),
(2, 6, 2),
(3, 6, 3),
(4, 2, 5),
(5, 2, 6),
(6, 2, 7),
(7, 4, 16),
(8, 4, 17);

--
-- Extraindo dados da tabela `acesso_pagina`
--

INSERT INTO `acesso_pagina` (`id_acesso_pagina`, `id_nivel_acesso`, `id_pagina`) VALUES
(1, 6, 3),
(2, 6, 4),
(3, 6, 2),
(4, 2, 7),
(5, 2, 8),
(6, 2, 6),
(7, 4, 18);

--
-- Extraindo dados da tabela `caixas`
--

INSERT INTO `caixas` (`id_caixa`, `codigo_caixa`, `ip_maquina`, `data_cadastro`, `timestamp`) VALUES
(1, 'CAIXA 1', '::1', '2016-11-20 02:35:00', '2016-11-20 16:35:00');

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `nome_cargo`, `setor_cargo`) VALUES
(1, 'Administrador do sistema', 'TI'),
(2, 'Gerente', 'Geral'),
(3, 'Estoquista', 'Suprimentos'),
(4, 'Operador de Caixa', 'Caixa'),
(5, 'Assistente', 'Suprimentos');

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_categoria`, `status_categoria`, `data_cadastro_categoria`, `timestamp`) VALUES
(1, 'Aliment&iacute;cios', 'ATIVO', '2016-11-20 10:04:48', '2016-11-20 12:04:48'),
(2, 'Bebidas', 'ATIVO', '2016-11-20 10:05:46', '2016-11-20 12:05:46'),
(3, 'Beleza e est&eacute;tica', 'ATIVO', '2016-11-20 10:06:14', '2016-11-20 12:06:14'),
(4, 'Cama mesa e banho', 'ATIVO', '2016-11-20 10:06:29', '2016-11-20 12:06:29'),
(5, 'Papelarias e livrarias', 'ATIVO', '2016-11-20 10:07:12', '2016-11-20 12:07:12'),
(6, 'Materiais de limpeza', 'ATIVO', '2016-11-20 10:07:32', '2016-11-20 12:07:32'),
(7, 'Acess&oacute;rios', 'ATIVO', '2016-11-22 12:23:13', '2016-11-21 23:23:13');

--
-- Extraindo dados da tabela `enderecos_fornecedores`
--

INSERT INTO `enderecos_fornecedores` (`id_endereco`, `id_fornecedor`, `cep_endereco`, `rua_endereco`, `numero_endereco`, `complemento_endereco`, `bairro_endereco`, `cidade_endereco`, `estado_endereco`, `data_cadastro_endereco`, `timestamp`) VALUES
(5, 3, '08730-200', 'Rua Carmela Marmora Larotonda', 123, '', 'Vila Vit&oacute;ria', 'Mogi das Cruzes', 'SP', '2016-11-20 09:54:45', '2016-11-20 11:54:45'),
(6, 4, '08580-600', 'Rua Ataulfo Alves', 185, '', 'Jardim S&atilde;o Manoel', 'Itaquaquecetuba', 'SP', '2016-11-20 12:15:34', '2016-11-20 14:15:34'),
(7, 5, '07241-310', 'Rua Carlo Bauducco', 200, '', 'Vila Para&iacute;so', 'Guarulhos', 'SP', '2016-11-22 12:14:04', '2016-11-21 23:14:04'),
(8, 6, '07215-070', 'Rua Bataguassu', 200, '', 'Jardim Santo Afonso', 'Guarulhos', 'SP', '2016-11-22 12:19:58', '2016-11-21 23:19:58'),
(9, 7, '03050-000', 'Rua Gomes Cardim', 235, '', 'Br&aacute;s', 'S&atilde;o Paulo', 'SP', '2016-11-22 12:32:02', '2016-11-21 23:32:02'),
(10, 8, '04551-080', 'Rua S&atilde;o Tom&eacute;', 350, '', 'Vila Ol&iacute;mpia', 'S&atilde;o Paulo', 'SP', '2016-11-22 12:42:28', '2016-11-21 23:42:28'),
(11, 9, '03050-000', 'Rua Gomes Cardim', 855, '', 'Br&aacute;s', 'S&atilde;o Paulo', 'SP', '2016-11-22 12:48:09', '2016-11-21 23:48:09');

--
-- Extraindo dados da tabela `enderecos_funcionarios`
--

INSERT INTO `enderecos_funcionarios` (`id_endereco`, `id_funcionario`, `cep_endereco`, `rua_endereco`, `numero_endereco`, `complemento_endereco`, `bairro_endereco`, `cidade_endereco`, `estado_endereco`, `data_cadastro_endereco`, `timestamp`) VALUES
(1, 1, '08580-600', 'Rua Ataulfo Alves', 123, '', 'Jardim S&atilde;o Manoel', 'Itaquaquecetuba', 'SP', '2016-11-24 11:31:49', '2016-11-20 02:34:31'),
(2, 3, '08572-290', 'Rua Resende', 35, '', 'Vila S&atilde;o Roberto', 'Itaquaquecetuba', 'SP', '2016-11-23 10:40:01', '2016-11-20 02:51:12'),
(3, 4, '08676-000', 'Avenida Ant&ocirc;nio Marques Figueira', 355, '', 'Vila Figueira', 'Suzano', 'SP', '2016-11-23 10:36:26', '2016-11-23 21:33:21'),
(4, 5, '08710-060', 'Pra&ccedil;a Jo&atilde;o Pessoa', 84, '', 'Centro', 'Mogi das Cruzes', 'SP', '2016-11-23 10:38:58', '2016-11-23 21:38:40'),
(5, 6, '08780-911', 'Avenida C&acirc;ndido Xavier de Almeida e Souza', 255, '', 'Vila Partenio', 'Mogi das Cruzes', 'SP', '2016-11-23 10:43:01', '2016-11-23 21:43:01'),
(6, 7, '08773-020', 'Avenida Jos&eacute; Benedito Braga', 82, '', 'Vila Mogilar', 'Mogi das Cruzes', 'SP', '2016-11-23 10:47:01', '2016-11-23 21:47:01');

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`id_estoque`, `id_produto`, `timestamp`) VALUES
(1, 1, '2016-11-20 15:07:00'),
(2, 5, '2016-11-24 23:14:03');

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id_fornecedor`, `foto_fornecedor`, `razao_social_fornecedor`, `nome_fantasia_fornecedor`, `cnpj_fornecedor`, `cpf_fornecedor`, `pessoa_fornecedor`, `site_fornecedor`, `observacoes_fornecedor`, `nome_contato_fornecedor`, `email_fornecedor`, `telefone_fornecedor`, `status_fornecedor`, `data_cadastro_fornecedor`, `timestamp`) VALUES
(3, '', 'Nova Atacado', 'Nova Atacado', '15.983.965/0001-19', '', 'PJ', '', '', 'Jo&atilde;o Barros', 'wellington-cezar@hotmail.com', '(23) 45445-4545', 'EXCLUIDO', '2016-11-20 09:54:45', '2016-11-23 21:49:52'),
(4, '', 'Novo Fornecedor', 'nome fantasia', '05.163.630/0001-09', '', 'PJ', 'teste.com', '', 'wellington', 'wellington-cezar@hotmail.com', '(12) 13132-1231', 'EXCLUIDO', '2016-11-20 12:15:34', '2016-11-21 16:35:03'),
(5, 'bauducco-2013.jpg', 'Pandurata Alimentos', 'F&aacute;brica Bauducco', '46.545.613/2168-54', '', 'PJ', 'www.bauducco.com.br', '', 'Anderson Pinheiro', 'AndersonP@bauducco.com', '(11) 99454-7554', 'ATIVO', '2016-11-22 12:14:03', '2016-11-21 23:14:03'),
(6, 'bauducco-2013.jpg', 'Bauducco &amp; Cia', 'Bauducco', '65.496.453/1654-65', '', 'PJ', '', '', 'Cesar Arantes', 'CesarArantes@bauducco.com', '(11) 2483-1209', 'ATIVO', '2016-11-22 12:19:57', '2016-11-21 23:19:58'),
(7, 'Avacy.jpg', 'Avacy Distribuidora e Com&eacute;rcio de Cal&ccedil;ados Ltda', 'Avacy', '61.234.829/0001-43', '', 'PJ', 'www.avacy.com.br', '', 'Ana Claudia Bertolo', 'contato@avacy.com.br', '(11) 2693-0222', 'ATIVO', '2016-11-22 12:32:02', '2016-11-21 23:32:02'),
(8, 'NOva gera&ccedil;&atilde;o.jpg', 'Distribuidora Nova Gera&ccedil;&atilde;o', 'Nova Gera&ccedil;&atilde;o', '54.646.156/4646-54', '', 'PJ', 'www.distribuidoranovageracao.com.br', '', 'Roberto Limeira', '', '', 'EXCLUIDO', '2016-11-22 12:42:28', '2016-11-21 23:46:35'),
(9, 'NOva gera&ccedil;&atilde;o.jpg', 'Distribuidora Nova Gera&ccedil;&atilde;o', 'Nova Gera&ccedil;&atilde;o', '00.886.764/5079-87', '', 'PJ', '', '', 'Roberto Limeira', 'RobertoLimeira@nova.com', '(11) 16464-6464', 'EXCLUIDO', '2016-11-22 12:48:09', '2016-11-21 23:48:35');

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
(14, 14, '2016-11-20'),
(15, 14, '2016-11-21'),
(16, 1, '2016-11-21'),
(17, 2, '2016-11-21'),
(18, 3, '2016-11-21'),
(19, 4, '2016-11-21'),
(20, 5, '2016-11-21'),
(21, 6, '2016-11-21'),
(22, 7, '2016-11-21'),
(23, 8, '2016-11-21'),
(24, 9, '2016-11-21'),
(25, 12, '2016-11-21'),
(26, 10, '2016-11-21'),
(27, 11, '2016-11-21'),
(28, 13, '2016-11-21'),
(29, 10, '2016-11-23'),
(30, 11, '2016-11-23'),
(31, 13, '2016-11-23'),
(32, 10, '2016-11-24'),
(33, 11, '2016-11-24'),
(34, 13, '2016-11-24'),
(35, 10, '2016-11-25'),
(36, 11, '2016-11-25'),
(37, 13, '2016-11-25'),
(38, 10, '2016-11-26'),
(39, 11, '2016-11-26'),
(40, 13, '2016-11-26');

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `foto_funcionario`, `nome_funcionario`, `sobrenome_funcionario`, `data_nascimento_funcionario`, `sexo_funcionario`, `rg_funcionario`, `cpf_funcionario`, `estado_civil_funcionario`, `escolaridade_funcionario`, `email_funcionario`, `telefone_funcionario`, `codigo_funcionario`, `id_cargo`, `data_admissao_funcionario`, `data_demissao_funcionario`, `status_funcionario`, `data_cadastro_funcionario`, `timestamp`) VALUES
(1, '8e54741ba48338947adbe8d4263ec0bc.jpg', 'Wellington', 'C&eacute;zar Targino de s&aacute;', '1991-02-04', 'M', '', '526.618.456-66', 'Solteiro', 'Ensino Superior Completo', 'wellington.infodahora@gmail.com', '(12) 34567-8978', '201116.8852', 1, '2016-11-20', '0000-00-00', 'ATIVO', '2016-11-20 12:34:31', '2016-11-24 22:31:42'),
(3, 'f44199ed62dcfdbd888c9e7e15215bd7.jpg', 'Diego', 'Hernandes', '2016-11-20', 'M', '', '194.188.475-07', 'Solteiro', 'Ensino Superior Completo', 'diego-hernandes@hotmail.com', '(23) 42342-3432', '201116.9847', 2, '2016-11-20', '0000-00-00', 'ATIVO', '2016-11-20 12:51:11', '2016-11-23 21:39:42'),
(4, '7e5efbc55f867b53b4aad5ebc2e7afcd.jpg', 'Wolley', 'willians Silva', '1984-11-01', 'M', '35.165.153-1', '067.450.533-65', 'Casado', 'Ensino Superior Completo', 'wolley@umc.com', '(11) 97075-6581', '231116.8668', 3, '2016-10-26', '0000-00-00', 'ATIVO', '2016-11-23 10:33:21', '2016-11-23 21:36:26'),
(5, 'e2ce16942d25557a236149b6341226eb.jpg', 'Daniele', 'Martins', '1990-11-01', 'F', '65.464.564-6', '333.573.207-38', 'Solteiro', 'Ensino Superior Completo', 'DaniMartins@umc.com', '(11) 96546-4651', '231116.0629', 4, '2015-10-01', '0000-00-00', 'ATIVO', '2016-11-23 10:38:40', '2016-11-23 21:38:58'),
(6, '11826a37bb619d8413d467cbf5955480.jpg', 'Erika', 'Miranda', '1982-08-03', 'F', '16.546.513-5', '520.566.713-36', 'Casado', 'Ensino Superior Completo', 'eppmiranda@gmail.com', '(11) 96322-0470', '231116.5735', 5, '2014-11-21', '0000-00-00', 'ATIVO', '2016-11-23 10:43:01', '2016-11-23 21:43:01'),
(7, '4d8c07727a13a8e682bc2d71800180ef.jpg', 'Pedro', 'Toledo', '1964-07-08', 'M', '16.854.646-5', '222.334.087-30', 'Casado', 'Ensino Superior Completo', 'pedroToledo@gmail.com', '(11) 4546-4564', '231116.7564', 3, '2010-11-02', '0000-00-00', 'ATIVO', '2016-11-23 10:47:01', '2016-11-23 21:47:01');

--
-- Extraindo dados da tabela `localizacao_lote`
--

INSERT INTO `localizacao_lote` (`id_localizacao_lote`, `id_produto_lote`, `id_unidade_medida_produto`, `localizacao`, `quantidade_localizacao`, `observacoes_localizacao_lote`, `timestamp`) VALUES
(1, 1, 5, 'ARMAZEM', '9.90', '', '2016-11-20 15:17:19'),
(2, 2, 4, 'ARMAZEM', '89.00', '', '2016-11-21 14:33:46'),
(3, 2, 4, 'PRATELEIRA', '-43.00', '', '2016-11-24 23:12:00'),
(4, 1, 4, 'DESCARTADOS', '10.00', '', '2016-11-20 15:17:19'),
(5, 3, 12, 'ARMAZEM', '40.00', '', '2016-11-24 23:15:06'),
(6, 3, 12, 'PRATELEIRA', '9.00', '', '2016-11-24 23:16:46');

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
(20, 'YP&Ecirc;', 'ATIVO', '2016-11-20 10:13:33', '2016-11-20 12:13:33'),
(21, 'Heineken', 'ATIVO', '2016-11-22 12:43:20', '2016-11-21 23:43:20');

--
-- Extraindo dados da tabela `nivel_acesso`
--

INSERT INTO `nivel_acesso` (`id_nivel_acesso`, `nome_nivel_acesso`, `tipo_permissao`, `index_access_db_name`, `timestamp`) VALUES
(1, 'Administrativo', 'ADMINISTRADOR', 'default', '2016-10-14 03:49:01'),
(2, 'Gerência', 'USUARIO', 'gerencia', '2016-10-14 03:49:06'),
(4, 'Caixa', 'USUARIO', 'caixa', '2016-10-14 03:49:12'),
(5, 'Suprimentos', 'USUARIO', 'suprimentos', '2016-10-14 03:49:16'),
(6, 'Estoquista', 'USUARIO', 'estoquista', '2016-10-14 03:49:23');

--
-- Extraindo dados da tabela `nivel_estoque`
--

INSERT INTO `nivel_estoque` (`id_nivel_estoque`, `id_estoque`, `quantidade_minima`, `quantidade_maxima`, `id_unidade_medida_produto`, `localizacao_estoque`) VALUES
(1, 1, '24.00', '155.00', NULL, 'ARMAZEM'),
(2, 1, '0.00', '0.00', NULL, 'PRATELEIRA'),
(3, 1, '0.00', '0.00', NULL, 'DESCARTADOS'),
(4, 2, '0.00', '0.00', NULL, 'ARMAZEM'),
(5, 2, '0.00', '0.00', NULL, 'PRATELEIRA');

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `foto_produto`, `codigo_barra_gti`, `nome_produto`, `id_marca`, `id_categoria`, `descricao_produto`, `status_produto`, `data_validade_controlada`, `data_cadastro_produto`, `timestamp`) VALUES
(1, '176990088d6ec03de0a42c282978f13d.jpg', '1213211311312', 'Biscoito Wafer Chocolate', 1, 3, 'Biscoito Wafer Chocolate - 165g', 'ATIVO', 1, '2016-11-20 10:32:46', '2016-11-20 22:19:49'),
(2, '418e672fac06eb5ac7fbc1884e6d8a62.jpg', '2165465165416', 'A&ccedil;ucar', 18, 1, 'A&ccedil;ucar Refinado', 'ATIVO', 1, '2016-11-21 04:59:56', '2016-11-21 15:59:56'),
(3, 'e5a4737fa81c6db55049e6f9490eaccd.jpg', '4556465146578', 'L&atilde; de A&ccedil;o', 2, 6, '8 unidades', 'ATIVO', 0, '2016-11-22 12:04:53', '2016-11-21 23:04:53'),
(4, 'cb1feaca4f70a92a3eef62b7d74a0574.jpg', '4556465146578', 'L&atilde; de A&ccedil;o', 2, 6, '8 unidades', 'EXCLUIDO', 0, '2016-11-22 12:04:56', '2016-11-21 23:05:06'),
(5, '5e68e4b465a1916a8e8ac4edd89f0104.jpg', '1464651564968', 'Chinelo', 7, 7, '', 'ATIVO', 0, '2016-11-22 12:25:57', '2016-11-21 23:25:57');

--
-- Extraindo dados da tabela `produtos_preco`
--

INSERT INTO `produtos_preco` (`id_produto_preco`, `id_produto`, `preco_produto`, `data_inicio`, `data_fim`, `preco_padrao`, `data_cadastro`, `timestamp`) VALUES
(1, 1, '2.99', '0000-00-00', '0000-00-00', 1, '0000-00-00', '2016-11-20 21:38:39'),
(2, 2, '2.95', '0000-00-00', '0000-00-00', 1, '0000-00-00', '2016-11-21 15:59:57'),
(3, 3, '3.57', '0000-00-00', '0000-00-00', 1, '0000-00-00', '2016-11-21 23:04:54'),
(4, 4, '3.57', '0000-00-00', '0000-00-00', 1, '0000-00-00', '2016-11-21 23:04:56'),
(5, 5, '22.49', '0000-00-00', '0000-00-00', 1, '0000-00-00', '2016-11-21 23:25:57');

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
(28, 13, 1, '1.00', '', '2.99', '2016-11-20 23:25:10'),
(29, 14, 1, '1.00', '', '2.99', '2016-11-21 14:30:35'),
(30, 14, 1, '1.00', '', '2.99', '2016-11-21 14:30:35'),
(31, 15, 1, '1.00', '', '2.99', '2016-11-24 23:11:59'),
(32, 15, 1, '1.00', '', '2.99', '2016-11-24 23:12:00'),
(33, 15, 1, '1.00', '', '2.99', '2016-11-24 23:12:00'),
(34, 15, 1, '1.00', '', '2.99', '2016-11-24 23:12:00'),
(35, 15, 1, '50.00', '', '2.99', '2016-11-24 23:12:00'),
(36, 16, 5, '1.00', '', '22.49', '2016-11-24 23:16:46'),
(37, 16, 1, '1.00', '', '2.99', '2016-11-24 23:16:46');

--
-- Extraindo dados da tabela `produto_fornecedores`
--

INSERT INTO `produto_fornecedores` (`id_produto_fornecedor`, `id_produto`, `id_fornecedor`) VALUES
(4, 2, 3),
(5, 3, 3),
(6, 4, 3),
(7, 1, 5),
(8, 1, 6),
(10, 5, 7);

--
-- Extraindo dados da tabela `produto_lote`
--

INSERT INTO `produto_lote` (`id_produto_lote`, `id_estoque`, `codigo_lote`, `codigo_barras_gti`, `codigo_barras_gst`, `data_validade`, `timestamp`) VALUES
(1, 1, 'LBWC1', '', '', '2016-12-31', '2016-11-20 15:07:00'),
(2, 1, 'BWC02', '', '', '2016-11-30', '2016-11-20 15:07:54'),
(3, 2, 'CHINELO001', '5645646546546', '', '0000-00-00', '2016-11-24 23:14:03');

--
-- Extraindo dados da tabela `requisicao_produto`
--

INSERT INTO `requisicao_produto` (`id_requisicao_produto`, `id_requisicao`, `id_produto`, `id_unidade_medida_produto`, `quantidade_produto`, `status_requisicao_produto`, `timestam`) VALUES
(6, 25, 58, 46, '20.00', 'APROVADO', '2016-09-11 16:36:24'),
(0, 0, 5, 12, '50.00', 'APROVADO', '2016-11-24 23:10:18');

--
-- Extraindo dados da tabela `requisicao_usuario`
--

INSERT INTO `requisicao_usuario` (`id_requisicao_usuario`, `id_requisicao`, `id_usuario`, `timestamp`) VALUES
(1, 13, 1, '2016-06-05 19:51:20'),
(2, 14, 1, '2016-06-06 05:54:48'),
(3, 15, 1, '2016-06-06 06:18:10'),
(4, 16, 1, '2016-06-06 06:19:43'),
(5, 22, 1, '2016-07-27 03:37:38'),
(6, 23, 1, '2016-07-27 03:38:16'),
(7, 24, 1, '2016-07-27 03:38:19'),
(8, 25, 1, '2016-09-11 16:34:43'),
(0, 0, 1, '2016-11-24 23:09:47');

--
-- Extraindo dados da tabela `requisicoes`
--

INSERT INTO `requisicoes` (`id_requisicao`, `codigo_requisicao`, `titulo_requisicao`, `observacoes_requisicao`, `data_requisicao`, `status_requisicao`, `timestamp`) VALUES
(16, '00002', 'Nova requisi&ccedil;&atilde;o de produto', '', '2016-06-06 00:19:43', 'NOVO', '2016-06-06 06:19:43'),
(25, '112233', 'Falta do arroz camil', '', '2016-09-11 10:34:43', 'NOVO', '2016-09-11 16:34:43'),
(0, '0002', 'COMPRA DE PRODUTO', '', '2016-11-25 00:09:47', 'NOVO', '2016-11-24 23:09:47');

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
(43, 'index', NULL, 'ATIVO', 'INATIVO', 23, NULL, '2016-11-20 18:41:04'),
(44, 'excluir', NULL, 'INATIVO', 'INATIVO', 21, NULL, '2016-11-21 15:58:42'),
(45, 'cadastrar', NULL, 'INATIVO', 'INATIVO', 21, NULL, '2016-11-21 16:00:54'),
(46, 'excluir', NULL, 'INATIVO', 'INATIVO', 9, NULL, '2016-11-21 17:35:03'),
(47, 'excluir', NULL, 'INATIVO', 'INATIVO', 10, NULL, '2016-11-22 00:05:05'),
(48, 'editar', NULL, 'INATIVO', 'INATIVO', 8, NULL, '2016-11-23 23:04:51');

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

--
-- Extraindo dados da tabela `sys_usuarios`
--

INSERT INTO `sys_usuarios` (`id_usuario`, `id_funcionario`, `id_nivel_acesso`, `email_usuario`, `login_usuario`, `senha_usuario`, `hash_acesso`, `status_usuario`, `data_criacao_usuario`, `timestamp`) VALUES
(1, 1, 1, 'admin@prysmarket.com.br', 'admin', '$2a$08$MTY2MjMyMDcyMTU3MmJjNe4RI1/LIguX39aJwjjJ374Tx2TdxfSXe', '$2a$08$NDI0MjI1MTQyNTgzOGI2Mu71T0lE019Crn6bWK4Wrq7awpUw4FmT.', 'ATIVO', NULL, '2016-05-06 01:17:49'),
(3, 3, 2, 'teste@teste.com', 'teste', '$2a$08$MTc5NDcwODE0MDU4MzExM.gMPRQ6mBY7KlZsQjNOrB.piaTF.nJz2', '$2a$08$MTkwNTUzMzI1NTU4MzExM.m5SxQ9AYaLujgyXhr/FTKvYypXdBRSO', 'ATIVO', '2016-11-20 12:56:18', '2016-11-20 02:56:18'),
(4, 5, 4, 'Daniele.Martins@mercadinho.com', 'daniele.martins', '$2a$08$ODAwNzE3MTU3NTgzNjBmO.iLKnr4nCeUQo/RjX6nhNHiOdPeHpk.K', '$2a$08$MTE5MDY4NzgxMTU4MzYxM.yHD1e9O2MOGra37OpI2iZJ3hSelLy9C', 'ATIVO', '2016-11-23 10:52:04', '2016-11-23 21:52:04'),
(5, 4, 6, 'wolley.willians@mercadinho.com', 'wolley.willians', '$2a$08$MjAyMDc2ODY3OTU4MzYxMeZUwQE/FpWaYqUlgjLFXNzoRDPqaKW4O', NULL, 'ATIVO', '2016-11-23 11:04:33', '2016-11-23 22:04:33'),
(6, 7, 6, 'pedro.toledo@mercadinho.com', 'pedro.toledo', '$2a$08$MTEwMjU5ODQxNDU4MzYxMe.MoRPCpnIx8S9PWygYUnGw.QFXilfBi', NULL, 'ATIVO', '2016-11-23 11:06:06', '2016-11-23 22:06:06'),
(7, 6, 5, 'Erika.Miranda@mercadinho.com', 'erika.miranda', '$2a$08$MjA0MjA0NjczMjU4MzYxMuPNkT0v/B.YUXJ2Uu5JqfP/QTbAMX7W2', NULL, 'ATIVO', '2016-11-23 11:07:00', '2016-11-23 22:07:00');

--
-- Extraindo dados da tabela `sys_usuarios_acessos`
--

INSERT INTO `sys_usuarios_acessos` (`id_usuarios_acesso`, `id_usuario`, `data_acesso`, `hora_acesso`, `ip_acesso`) VALUES
(4, 3, '2016-11-20', '00:56:58', '::1'),
(5, 1, '2016-11-20', '01:00:03', '::1'),
(6, 1, '2016-11-20', '01:01:25', '::1'),
(7, 1, '2016-11-21', '15:29:36', '::1'),
(8, 1, '2016-11-22', '00:00:05', '::1'),
(9, 1, '2016-11-23', '22:25:03', '::1'),
(10, 4, '2016-11-23', '22:54:29', '::1'),
(11, 1, '2016-11-23', '22:55:04', '::1'),
(12, 1, '2016-11-24', '23:30:46', '::1'),
(13, 1, '2016-11-25', '00:10:57', '::1'),
(14, 1, '2016-11-25', '23:07:55', '::1');

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

--
-- Extraindo dados da tabela `unidade_medida_produto`
--

INSERT INTO `unidade_medida_produto` (`id_unidade_medida_produto`, `id_produto`, `id_unidade_medida`, `fator_unidade_medida`, `para_venda`, `para_estoque`, `ordem`, `timestamp`) VALUES
(4, 1, 7, '1.00', 1, 0, 0, '2016-11-20 15:20:04'),
(5, 1, 11, '100.00', 0, 1, 1, '2016-11-20 15:20:05'),
(6, 2, 10, '1.00', 1, 0, 0, '2016-11-21 15:59:57'),
(7, 2, 17, '1.00', 0, 1, 1, '2016-11-21 15:59:57'),
(8, 3, 10, '1.00', 1, 0, 0, '2016-11-21 23:04:53'),
(9, 3, 17, '12.00', 0, 1, 1, '2016-11-21 23:04:54'),
(10, 4, 10, '1.00', 1, 0, 0, '2016-11-21 23:04:56'),
(11, 4, 17, '12.00', 0, 1, 1, '2016-11-21 23:04:56'),
(12, 5, 10, '1.00', 1, 1, 0, '2016-11-21 23:25:57');

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
(13, 43, '2016-11-20', '21:25:10', 'CARTAODEBITO', '0.00', '2016-11-20 23:25:10'),
(14, 51, '2016-11-21', '15:30:35', 'DINHEIRO', '10.00', '2016-11-21 14:30:35'),
(15, 52, '2016-11-25', '00:11:59', 'DINHEIRO', '200.00', '2016-11-24 23:11:59'),
(16, 54, '2016-11-25', '00:16:46', 'DINHEIRO', '88.88', '2016-11-24 23:16:46');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
