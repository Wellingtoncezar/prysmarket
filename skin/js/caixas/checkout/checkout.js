	$(function() {
		
		$("input[name=valorrecebido]").maskMoney({decimal:",",thousands:""});
		$('input[name=saldoinicial], input[name=quantidade]').wvmask('numero');

		var isRegisteredMachine = false;
		function checkRegiteredMachine(){
			$.post(url+'caixa/checkout/gerenciar/checkmachine', {}, function(data) {
				if(data == true){
					isRegisteredMachine = true;
					//$('#fullscreen').html($('#telaPrincipal').clone().removeClass('hide'))
				}else
				{
					//$('#fullscreen').html('<div class="alert alert-warning text-center" role="alert"><h3>Esta máquina não está registrada para realizar esta operação!</h3></div>');
					isRegisteredMachine = data;
				}
			});
		}
		checkRegiteredMachine()


		//ABRIR CAIXA
		$('#form_abrirCaixa').on('submit', function(event) {
			event.preventDefault();
			$.ajax({
				url: $(this).attr('action'),
				type: 'POST',
				//dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
				data: $(this).serialize(),
			})
			.done(function(data) {
				console.log(data)
				$('#telaAbrirCaixa').addClass('hide')
				$('#telaVenda').removeClass('hide')
			})
			.fail(function(data) {
				$.notify({
                	icon: 'glyphicons glyphicons-alert',
					message: data.responseText,
				},{
					type: "warning",
					placement: {
						from: "top",
						align: "right"
					}
				});
			})
			
	        return false;
		});

		$('#form_fecharCaixa').on('submit', function(event) {
			event.preventDefault();
			$.ajax({
				url: $(this).attr('action'),
				type: 'POST',
				//dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
				data: $(this).serialize(),
			})
			.done(function(data){
				console.log(data);
				if(data == true)
				{
					$('#telaAbrirCaixa').removeClass('hide');
					$('#telaFecharCaixa').addClass('hide');
					$.fullscreen.exit();
					location.reload();
				}
			})
			.fail(function(data) {
				$.notify({
                	icon: 'glyphicons glyphicons-alert',
					message: data.responseText,
				},{
					type: "warning",
					placement: {
						from: "top",
						align: "right"
					}
				});
			})
			
	        return false;
		});

		

		$('.btnfecharcaixa').on('click', function(event) {
			$('#telaFecharCaixa').removeClass('hide');
			$('#telaVenda').addClass('hide');
			$('#telaAbrirCaixa').addClass('hide');
			
		});


		// check native support
		$('#support').text($.fullscreen.isNativelySupported() ? 'supports' : 'doesn\'t support');

		// open in fullscreen
		$(document).on('click', '.openfullscreen', function() {
			checkRegiteredMachine()
			if(isRegisteredMachine === true){
				$('.fullscreenCheckout').removeClass('hide').addClass('active')
				$('#telaPrincipal').addClass('hide')
				$('#telaAbrirCaixa').removeClass('hide')
				// $('#fullscreen').fullscreen();
				$('body').fullscreen();
				console.log('passou')
			}else
				$.notify({
                	icon: 'glyphicons glyphicons-alert',
					message: isRegisteredMachine,
				},{
					type: "warning",
					placement: {
						from: "top",
						align: "right"
					}
				});
			return false;
		});

		// exit fullscreen
		$('#fullscreen .exitfullscreen').click(function() {
			$.fullscreen.exit();
			return false;
		});

		// document's event
		$(document).bind('fscreenchange', function(e, state, elem) {
			// if we currently in fullscreen mode
			if ($.fullscreen.isFullScreen()) {
				$('#fullscreen .openfullscreen').hide();
				$('#fullscreen .exitfullscreen').show();
			} else {
				$('#fullscreen .openfullscreen').show();
				$('#fullscreen .exitfullscreen').hide();
			}

			$('#state').text($.fullscreen.isFullScreen() ? '' : 'not');
		});




		jQuery.multipress = function (keys, handler) {
		    'use strict';

		    if (keys.length === 0) {
		        return;
		    }

		    var down = {};
		    jQuery(document).keydown(function (event) {
		        down[event.keyCode] = true;
		    }).keyup(function (event) {
		        // Copy keys array, build array of pressed keys
		        var remaining = keys.slice(0),
		            pressed = Object.keys(down).map(function (num) { return parseInt(num, 10); }),
		            indexOfKey;
		        // Remove pressedKeys from remainingKeys
		        jQuery.each(pressed, function (i, key) {
		            if (down[key] === true) {
		                down[key] = false;
		                indexOfKey = remaining.indexOf(key);
		                if (indexOfKey > -1) {
		                    remaining.splice(indexOfKey, 1);
		                }
		            }
		        });
		        // If we hit all the keys, fire off handler
		        if (remaining.length === 0) {
		            handler(event);
		        }
		    });
		};
		// $(document).bind('keydown', function(event) {
		// 	if(event.keyCode == 122)
		// 		$('#fullscreen').fullscreen();
		// });

		// jQuery.multipress([18], function () { 
		// 	if ($.fullscreen.isFullScreen()) {
		// 		alert('está no fullscreen')
		// 	}else{
		// 		alert('não está no fullscreen')
		// 	} 
		// })
	});

	jQuery(window).load(function($){
		atualizaRelogio();
	});

	function atualizaRelogio(){ 
		var momentoAtual = new Date();
		
		var vhora = momentoAtual.getHours();
		var vminuto = momentoAtual.getMinutes();
		var vsegundo = momentoAtual.getSeconds();
		
		var vdia = momentoAtual.getDate();
		var vmes = momentoAtual.getMonth() + 1;
		var vano = momentoAtual.getFullYear();

		var Dia = momentoAtual.getDay(); 
		var Mes = momentoAtual.getUTCMonth();

		arrayDia = new Array();
		   arrayDia[0] = "Domingo";
		   arrayDia[1] = "Segunda-Feira";
		   arrayDia[2] = "Terça-Feira";
		   arrayDia[3] = "Quarta-Feira";
		   arrayDia[4] = "Quinta-Feira";
		   arrayDia[5] = "Sexta-Feira";
		   arrayDia[6] = "Sabado";
		 
		var arrayMes = new Array();
		   arrayMes[0] = "Janeiro";
		   arrayMes[1] = "Fevereiro";
		   arrayMes[2] = "Março";      
		   arrayMes[3] = "Abril";
		   arrayMes[4] = "Maio";
		   arrayMes[5] = "Junho";
		   arrayMes[6] = "Julho";
		   arrayMes[7] = "Agosto";
		   arrayMes[8] = "Setembro";
		   arrayMes[9] = "Outubro";
		   arrayMes[10] = "Novembro";
		   arrayMes[11] = "Dezembro";




		if (vdia < 10){ vdia = "0" + vdia;}
		if (vmes < 10){ vmes = "0" + vmes;}
		if (vhora < 10){ vhora = "0" + vhora;}
		if (vminuto < 10){ vminuto = "0" + vminuto;}
		if (vsegundo < 10){ vsegundo = "0" + vsegundo;}

		dataFormat = arrayDia[Dia] + ", " + vdia + " de " + arrayMes[Mes] + " de " + vano;
		horaFormat = vhora + " : " + vminuto + " : " + vsegundo;

		
	
		$('.data').html('<h4 class="text-center">'+dataFormat+'</h4>');
		$('.hora').html('<h4 class="text-center">'+horaFormat+'</h4>');

		// document.getElementById("data").innerHTML = '<p class="text-center">'+dataFormat+'</p>';
		// document.getElementById("hora").innerHTML = '';
		setTimeout("atualizaRelogio()",1000);
	}




$(function(){
	var tabactive = '#porcodigo';

	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	  	tabactive = e.target.hash; // newly activated tab
	  	//e.relatedTarget // previous active tab

	  	if(e.relatedTarget.hash == '#porcodigo')
	  	{
	  		$('input[name=codigobarras]').val('');
	  	}
	})

	//OBTENDO OS DADOS DO PRODUTO
	function getProduto(tipo, value){
		$.ajax({
			url: url+'caixa/checkout/gerenciar/consultaProduto',
			type: 'POST',
			dataType: 'json',
			data: {tipo: tipo, value:value},
		})
		.done(function(data) {
			console.log(data);
			if(data != false)
			{
				$('input[name=id_produto]').val(data.id);
				$('#fotoProduto').attr('src',data.foto);
				$('#nomeProduto').html(data.nome);
				$('#valorUnitario').html(data.precoFormatado);
				$('input[name=valorUnitario]').val(data.preco);
				$('input[name=quantidade]').val('1');
				$('#unidadeMed').html(data.unidadeMed)
				calcSubtotalProduto($('input[name=quantidade]').val(), data.preco)
				$('.containerProdutoUnitario').removeClass('hide');
				//window.location.href='#produtoUnitario';
				var target_offset = $("#produtoUnitario").offset();
		        var target_top = target_offset.top;
		        $('.containerProdutos').animate({ scrollTop: target_top }, 500);

		        addProdCarrinho(true);
		        return true;
			}
		})
		.fail(function(e) {
			$.notify({
            	icon: 'glyphicons glyphicons-alert',
				message: e.responseText,
			},{
				type: "warning",
				placement: {
					from: "top",
					align: "right"
				}
			});
		});
		$('input[name=codigobarras]').val('');
		$('select[name=listaproduto] option[value=""]').prop("selected", true);
		return false;
	}


	$('input[name=codigobarras]').bind("change paste keyup", function() {
		if($('input[name=codigobarras]').val().length == 13)
		{
			var value = '';
			var tipo = 'porcodigo';
			var quantidade = 1;
			
			if(tabactive == '#porcodigo')
			{
				tipo = 'porcodigo';
				value = $('input[name=codigobarras]').val();
				quantidade = $('input[name=quantidade]').val();
				if($('input[name=codigobarras]').val().length == 13)
				{
					getProduto(tipo, value, quantidade);
					
				}
			}
		}
	});


	$('select[name=listaproduto]').bind("change paste keyup", function() {
		if($('select[name=listaproduto]').val() != '')
		{
			var value = '';
			var tipo = 'pordescricao';
			var quantidade = 1;
			if(tabactive == '#pordescricao')
			{
				tipo = 'pordescricao';
				value = $('select[name=listaproduto]').val();
				quantidade = $('input[name=quantidade]').val();
				getProduto(tipo, value, quantidade);
			}
		}
	});


	$('.btnAddProduto').on('click', function(event) {
	});
	Number.prototype.formatMoney = function(c, d, t){
	var n = this, c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "," : d, t = t == undefined ? "." : t, s = n < 0 ? "-" : "", i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
	   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
	};

	function calcSubtotalProduto(qtd, vUnit){
		qtd = qtd.replace(".","");
        qtd = qtd.replace(",",".");
        qtd = parseFloat(qtd);
		var subtotalProd = qtd*vUnit;
		subtotalProd = subtotalProd.formatMoney(2, ',', '.');
		$('#subtotalProduto').html('R$ '+subtotalProd);

	}


	$('#quantidade').bind('change paste keyup', function(event) {
		if($(this).val() <= 0)
			$(this).val('1');
		calcSubtotalProduto($(this).val(), $('input[name=valorUnitario]').val())
	});

	$('input[name=valorUnitario]').bind('change paste keyup', function(event) {
		calcSubtotalProduto($('input[name=quantidade]').val(), $(this).val())
	});
	
	//ADICIONA O PRODUTO NO CARRINHO
	function addProdCarrinho(forcar = 0)
	{
		console.log('AUTOMATICO:'+ $('input[name=automaticList]').is(':checked'))
		console.log('FORCAR: '+ forcar)

		if($('input[name=automaticList]').is(':checked') || forcar === 1)
		{
			var quantidade = $('input[name=quantidade]').val()
			var idproduto = $('input[name=id_produto]').val();

			$.ajax({
				url: url+'caixa/checkout/gerenciar/addProdutoListaVenda',
				type: 'POST',
				dataType: 'json',
				data: {quantidade: quantidade, idproduto:idproduto},
			})
			.done(function(data) {
				console.log(data);
				listarProdutosCarrinho();
				return true;
			})
			.fail(function(e) {
				$.notify({
                	title: 'Atenção',
                	icon: 'glyphicons glyphicons-warning-sign',
					message: e.responseText,
				},{
					type: "warning",
					placement: {
						from: "top",
						align: "right"
					}
				});
			});
		}
		return false
	}

	$('input[name=automaticList]').on('change', function(event) {
		if($(this).is(':checked'))
		{
			$('.btnListar').addClass('hide');
			$('input[name=quantidade]').attr('readonly', 'readonly').val('1');
		}else
		{
			$('.btnListar').removeClass('hide');
			$('input[name=quantidade]').removeAttr('readonly', 'readonly');
		}
		
	});

	

	$(document).on('click','.btnListar', function(){
		addProdCarrinho(1)// true para forçar o adicionamento do produto no carrinho
	});

	function listarProdutosCarrinho()
	{
		$('#listcarrinho tbody').html('');
		$.ajax({
			url: url+'caixa/checkout/gerenciar/listarCarrinho',
			type: 'POST',
			dataType: 'json',
			data: {},
		})
		.done(function(data) {
			console.log(data)
			$.each(data, function(index, val) {
				var row = 	'<tr>'
					        	+'<td>'+(index+1)+'</td>'
					        	+'<td>'+val.item+'</td>'
					        	+'<td>'+val.qtd+'</td>'
					        	+'<td>'+val.preco+'</td>'
					        +'</tr>';
				$('#listcarrinho tbody').append(row);	        
			});
			$('.pagarcompra').removeAttr('disabled')
			//exibe o subtotal
			consultaSubtotal();
		})
		.fail(function(data) {
			console.log("error");
			console.log(data)
		})
	}

	function consultaSubtotal()
	{
		$.ajax({
			url: url+'caixa/checkout/gerenciar/consultaSubtotalCarrinho',
			type: 'POST',
			dataType: 'json',
			data: {},
		})
		.done(function(data) {
			console.log(data)
			$('#subtotal').html(data.formated);
			$('input[name=subtotal]').val(data.unformated);
		})
		.fail(function(data) {
			console.log("error");
			console.log(data)
		})
	}


	$('.pagarcompra').on('click', function(event) {
		event.preventDefault();
		$(this).attr('disabled', 'disabled')
		
		$('.containerProdutos').addClass('hide')
		$('.containerPagarCompra').removeClass('hide')
	});

	var formapagamento = '';
	$('.btnformaPagamento').on('click', function(event) {
		event.preventDefault();
		formapagamento = $(this).attr('type')
		$('#tipo_'+formapagamento).removeClass('hide')
		$('.containerFinalizarCompra').removeClass('hide')
		$('.containerPagarCompra').addClass('hide')
	});


	$('input[name=valorrecebido]').bind('change paste keyup', function(event) {
		var qtd = $(this).val();
		qtd = qtd.replace(".","");
        qtd = qtd.replace(",",".");
        qtd = parseFloat(qtd);
		var subtotal = qtd - $('input[name=subtotal]').val();

		subtotal = subtotal.formatMoney(2, ',', '.');
		$('#troco').html('R$ '+subtotal);
	});

	$('.btnFinalizar').on('click', function(event) {
		event.preventDefault();
		var valorrecebido = $('input[name=valorrecebido]').val();

		$.ajax({
			url: url+'caixa/checkout/gerenciar/finalizarCompra',
			type: 'POST',
			//dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
			data: {formapagamento: formapagamento, valorrecebido : valorrecebido},
		})
		.done(function(data) {
			console.log(data)
			$.notify({
            	icon: 'glyphicons glyphicons-ok',
				message: 'Compra finalizada',
			},{
				type: "success",
				placement: {
					from: "top",
					align: "right"
				}
			});

			resetCheckout();
		})
		.fail(function(data) {
			$.notify({
            	icon: 'glyphicons glyphicons-alert',
				message: data.responseText,
			},{
				type: "warning",
				placement: {
					from: "top",
					align: "right"
				}
			});
		})
	});


	function resetCheckout()
	{
		formapagamento = '';
		$('input[name=valorrecebido]').val('');
		$('#troco').html('');
		$('#listcarrinho tbody').html('');
		$('#subtotalProduto').html('')
		$('input[name=subtotal]').val('');
		$('#tipo_DINHEIRO, #tipo_CARTAODEBITO, #tipo_CARTAOCREDITO').addClass('hide');
		$('.containerProdutos').removeClass('hide');
		$('.containerProdutoUnitario').addClass('hide');
		$('.containerFinalizarCompra').addClass('hide');
	}


})