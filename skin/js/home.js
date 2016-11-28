function updateChart()
    {

    	var dataDe = $('input[name=dataDe]').val();
    	var dataAte = $('input[name=dataAte]').val();

    	$.ajax({
    		url: url+'relatorios/vendas/gerenciar/consultaRelatorio',
    		type: 'POST',
    		dataType: 'json',
    		data: {periodoDe: dataDe, periodoAte:dataAte},
    	})
    	.done(function(data) {
    		console.log(data);
    		var chart = $("#chartHome").data("kendoChart");
			var dataSource = new kendo.data.DataSource( {
			  data: data
			  
			});
			chart.setDataSource(dataSource);
    	})
    	.fail(function(e) {
    		console.log(e);
    	});

    }

    updateChart();

    function createChart() {
        $("#chartHome").kendoChart({
            title: { text: "Produtos mais vendidos" },
            dataSource: {
	            transport: {
	                read: {
	                    // url: function() {
	                    //     return url+"relatorios/vendas/gerenciar/consultaRelatorio";
	                    // },
	                    dataType: "json"
	                }
	            },
	            // group: {
	            //     field: "symbol"
	            // },

	            sort: {
	                field: "produto",
	                dir: "asc"
	            },

	            schema: {
	                model: {
	                    fields: {
	                        date: {
	                            type: "qtdVenda"
	                        }
	                    }
	                }
	            }
	        },
            series: [{
                type: "column",
                field: "qtdVenda",
                name: "Quantidade de vendas"
            }],
            legend: {
                position: "bottom"
            },
            valueAxis: {
                labels: {
                    format: "{0} Venda(s)",
                    // skip: 2,
                    // step: 2
                }
            },
            categoryAxis: {
                field: "produto"
            },
//             categoryAxis: [{
			//     categories: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
			// }],
            tooltip: {
	          visible: true,
	          template: "Quant.: #= dataItem.qtdProduto # #=dataItem.unidadeMedida#<br> Média: #=dataItem.media# #=dataItem.unidadeMedida# / venda"
	        }
        });
    }

    $(document).ready(createChart);
    $(document).bind("kendo:skinChange", createChart);