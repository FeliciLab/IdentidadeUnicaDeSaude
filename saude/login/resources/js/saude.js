$(document).ready(function () {
    var url = window.location.href;
    console.log({url})
    var stringGrant = 'required-action';
    console.log(url.includes(stringGrant));
    var verify = url.includes(stringGrant);
    $("#loginOrRegisterSaude").show();
    $("#grantSaude").hide();
    if(verify) {
        $(".loginOrRegisterSaude").hide();
        $("#grantSaude").show();
    }
});