<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post" autocomplete="off">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
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
        $("#username").on('keyup', function() {
            const username = $(this).val();
            const url = 'https://idsaudeapi.dev.org.br';
            
            const uri = url + '/api/user/username-existe/' + username;

            const mensagem = $("#mensagem-username-invalido");
            const botaoSubmit = $("#submit");

            //mensagem.hide();
            botaoSubmit.prop('disabled', true);

            if (username != '') {
                $.get( uri, function( data ) {
                    if (data.existe) {
                        mensagem.hide('slow');
                        botaoSubmit.prop('disabled', false);
                    } else {
                        mensagem.show('slow');
                        botaoSubmit.prop('disabled', true);
                    }
                });
            }
        });

        $(document).on('submit', function() {
            const botaoSubmit = $("#submit");
            botaoSubmit.prop('disabled', true);
        });
    });
</script>