$(document).ready(function () {
    //url atual de referencia
    var url = window.location.href;
    //string que deve ser encontrada
    var stringGrant = 'required-action';
    //verificando se existe a string e retornando TRUE ou FALSE
    var verify = url.includes(stringGrant);
    //mostrando o conteúdo
    $(".loginOrRegisterSaude").show();
    //ocultando consentimento
    $("#grantSaude").hide();
    //condicional para mostrar e ocutar conteudo
    if(verify) {
        $(".loginOrRegisterSaude").hide();
        $("#grantSaude").show();
    }

    $('#kc-form-login,#kc-register-form').on('submit', function( e ) { 
        var usernameSemPontos = $("#username").val();
        usernameSemPontos = usernameSemPontos.replace(/\./g, '');
        usernameSemPontos = usernameSemPontos.replace(/\-/g, '');

        if(isValidCPF(usernameSemPontos)) {
            $("#username").val(usernameSemPontos);
        }
    });
});