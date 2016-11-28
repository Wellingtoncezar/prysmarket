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
			$.notify({
            	icon: 'glyphicons glyphicons-ok',
				message: 'Caixa fechado',
			},{
				type: "success",
				placement: {
					from: "top",
					align: "right"
				}
			});
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