<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <div class="subtitle">
            <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
        </div>
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post" autocomplete="off">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")} <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if> <span class="required">*</span></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <#if auth?has_content && auth.showUsername()>
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}"/>
                    <#else>
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus/>
                    </#if>
                    <span id="mensagem-username-invalido" style="display:none;color:#f00">CPF ou E-mail não encontrados na base de dados do IDSaúde</span>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" disabled="true" type="submit" id="submit" value="${msg("doSubmit")}"/>
                </div>
            </div>
        </form>
    <#elseif section = "info" >
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
<script>
    $(document).ready(function() {

        var timeOutRequest;

        $("#username").on('keyup', function() {
            const username = $(this).val();
            
            var usernameOk;
            if (username.includes('.', 3) && username.includes('.', 7) && username.includes('-', 11)) {
                var usernameSP = username;
                usernameSP = usernameSP.replace(/\./g, '');
                usernameSP = usernameSP.replace(/\-/g, '');
                usernameOk = usernameSP;
            } else {
                usernameOk = username;
            }

            const mensagem = $("#mensagem-username-invalido");
            const botaoSubmit = $("#submit");

            botaoSubmit.prop('disabled', true);
            
            clearTimeout(timeOutRequest);
            if (usernameOk != '') {
                timeOutRequest = setTimeout(() => { 
                    var urlIdSaude = window.location.hostname;
                    if (urlIdSaude == 'dev.id.org.br') {
                        url = 'https://idsaudeapi.dev.org.br';
                    } else if (urlIdSaude == 'id.sus.ce.gov.br') {
                        url = 'https://idsaudeapi.sus.ce.gov.br';
                    } else {
                        url = 'http://localhost:7000';
                    }

                    const uri = url + '/api/user/username-existe/' + usernameOk;
                    $.get( uri, function( data ) {
                        if (data.existe) {
                            mensagem.hide('slow');
                            botaoSubmit.prop('disabled', false);
                        } else {
                            mensagem.show('slow');
                            botaoSubmit.prop('disabled', true);
                        }
                    });
                }, 1000);
            }
        });

        $(document).on('submit', function() {
            const botaoSubmit = $("#submit");
            botaoSubmit.prop('disabled', true);
        });
    });
</script>