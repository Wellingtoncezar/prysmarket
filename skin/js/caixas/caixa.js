$(function(){

$("#grid").kendoGrid({
    columns: [
    {
        filterable: false,
        field: "id",
        title: "ID",
        width: "40px",
        template: '<p>#: id#</p>'
    },
    {
        field: "codigo",
        title: "Código",
        width: "300px",
    },
    {
        field: "ip",
        title: "IP",
        width: "100px"
    },
    {
        filterable: false,
        field: "acoes",
        title: "Ações",
        width: "100px",
        template : '<a class="btn btn-primary btn_editar btn-sm pull-left" href="#:linkEditar#" data-toggle="tooltip" data-placement="top" role="button" id-record=""  title="">'
                +'<span class="glyphicon glyphicon-pencil"></span>' 
            +'</a>'
    }
    ],
    filterable: {
        extra: false,
        operators: {
            string: {
                startswith: "Começa com",
                eq: "É igual a",
                neq: "Não é igual a",
                contains: "Contém"
            }
        },
        messages: {
          filter: "Filtrar",
          clear: "Limpar",
          info: "Exibir itens com valores que: "
        }
    },
    dataSource:{
        transport: {
            read: {
                url: url+"caixa/gerenciar/getjsoncaixa",
                dataType: "json"
            }
        }
    },
    pageable: {
        pageSize: 8,
        refresh: true
    },
    detailTemplate: 'Caixas abertos: <div class="grid"></div>',
    detailInit: function(e) {
        e.detailRow.find(".grid").kendoGrid({
            dataSource: e.data.abertos,
            columns: [
                { field: "id", title:"ID", width: "80px"},
                { field: "dateOpen", title:"Data De Abertura"},
                { field: "dateClose", title:"Data De Fechamento" },
                { field: "user", title:"Funcionário" },
                { 
                    field: "acoes", 
                    title:"Ações" ,
                    template : '<a class="btn btn-primary pull-left btn_visualizar btn-sm" href="#:linkvisualizar#" data-toggle="tooltip" data-placement="top" role="button" id="btn_visualizar" title="Visualizar">'
                                    +'<span class="glyphicons glyphicons-eye-open"></span>'
                                +'</a>'
                }
            ],
            detailInit: function(e) {
		        e.detailRow.find(".itens").kendoGrid({
		            dataSource: e.data.itens,
		            columns: [
		                { field: "id", title:"ID", width: "80px"},
		                { field: "dateOpen", title:"Data De Abertura"},
		                { field: "dateClose", title:"Data De Fechamento" },
		                { field: "user", title:"Funcionário" },
		                { 
		                    field: "acoes", 
		                    title:"Ações" ,
		                    template : '<a class="btn btn-primary pull-left btn_visualizar btn-sm" href="#:linkvisualizar#" data-toggle="tooltip" data-placement="top" role="button" id="btn_visualizar" title="Visualizar">'
		                                    +'<span class="glyphicons glyphicons-eye-open"></span>'
		                                +'</a>'
		                }
		            ]
		        });
		    }
        });
    }

});
})