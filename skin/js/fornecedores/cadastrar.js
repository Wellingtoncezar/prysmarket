
 $(function(){
    /*MASCARAS DE CAMPOS*/
    $('input[name=data_visita]').datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true, changeYear: true,yearRange: "-100:+0" });
    $('input[name=retorno]').wvmask('numero')
    $('input[name=cep]').wvmask('cep')
    $('input[name=numero]').wvmask('numero')
    $('input[name=cpf]').mask('999.999.999-99');

    $('input[name=cnpj]').mask('99.999.999/9999-99');
    $('#form_fornecedores').validaCep();
    //mascara para telefones de 8 e 9 dígitos
    var maskBehavior = function (val) {
        return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
    },
    options = {onKeyPress: function(val, e, field, options) {
        field.mask(maskBehavior.apply({}, arguments), options);
        }
    };
    $('input[name=telefone]').mask(maskBehavior, options);


    //UPLOAD DA IMAGEM
    $('#form_fornecedores').uploadImage();
    //SUBMIT DO FORMULÁRIO
    $('#form_fornecedores').submit(function(){
        var telefones = Object();
        //telefones
        var iTel = 0;
        $('.group_tel .telefones').each(function(){
            var aux = Object();
            var categoria = $('select[name=categoria] option:selected',this).val();
            var telefone = $('input[name=telefone]',this).val();
            var operadora = $('input[name=operadora]',this).val();
            var tipo_telefone = $('select[name=tipo_telefone] option:selected',this).val();

            aux['categoria'] = categoria;
            aux['telefone'] = telefone;
            aux['operadora'] = operadora;
            aux['tipo_telefone'] = tipo_telefone;

            telefones[iTel] = aux;
            iTel++;
        });

        //email
        var emails = Object();
        var iEmail = 0;
        $('.group_email .emails').each(function(){
            var aux = Object();
            var tipo_email = $('select[name=tipo_email] option:selected',this).val();
            var email = $('input[name=email]',this).val();
            aux['tipo_email'] = tipo_email;
            aux['email'] = email;
            emails[iEmail] = aux;
            iEmail++;
        });


        var parameters = Object();
        parameters['telefones'] = telefones;
        parameters['emails'] = emails;

        $('#form_fornecedores').uploadForm({
            'parameters': parameters,
            'reload':true
        });
        return false;
    });


    /************************************/
    //telefone
    $('.addTel').on('click',function(){
        var error = 0;
        var campTel = $('#defaultCampos #defaultTel').clone().removeAttr('id').removeAttr('style');
        campTel.find('input').val('');
        $(this).before(campTel);
        $('input[name=telefone]').mask(maskBehavior, options);
    });
    
    $(document).on('click','.delCel',function(){
        $(this).parent().parent().remove();
    });


    //email
    $('.addEmail').on('click',function(){
        var error = 0;
        var campTel = $('#defaultCampos #defaultEmail').clone().removeAttr('id').removeAttr('style');
        campTel.find('input').val('');
        $(this).before(campTel);
    });
    
    $(document).on('click','.delEmail',function(){
        $(this).parent().parent().remove();
    });
    /************************************/

 });