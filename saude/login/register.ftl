<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <div class="subtitle">
            <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
        </div>
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post" autocomplete="off">
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("fullName")} <span class="required">*</span></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}" required />
                    <span id="mensagem-firstname-invalido" style="display:none;color:#f00;">${msg("invalidFirstNameMessage")}</span>
                </div>
            </div>

            <div style="display: none;" class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")} <span class="required">*</span></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName" value="." required />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")} <span class="required">*</span></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email" required />
                </div>
            </div>

          <#if !realm.registrationEmailAsUsername>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")} <span class="required">*</span></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" required />
                    <span id="username-mensagem" style="display:none;color:#f00;">${msg("invalidUsernameMessage")}</span>
                </div>
            </div>
          </#if>

            <#if passwordRequired??>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")} <span class="required">*</span></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password" class="${properties.kcInputClass!}" name="password" autocomplete="new-password" required/>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")} <span class="required">*</span></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" required/>
                </div>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input id="button-submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>

        <script>
            $(document).ready(function() {
                //somente número de cpf no username 
                $('input[name="username"]').mask('000.000.000-00', {reverse: true});

                $('input[name="username"]').blur(function() {  
                    let cpf = $(this).val();    
                    if (!isValidCPF(cpf)) {
                        $('#username-mensagem').show('slow'); 
                        $(this).focus();  
                        $('#button-submit').prop('disabled', true);
                    } else {
                        $('#username-mensagem').hide('slow');
                        $('#button-submit').prop('disabled', false);
                    }              
                });

                $('input[name="firstName"]').blur(function() {
                    let firstName = $(this).val();
                    if (!getSubName(firstName)) {
                        $('#mensagem-firstname-invalido').show('slow');
                        $(this).focus();
                        $('#button-submit').prop('disabled', true);
                    } else {
                        $('#mensagem-firstname-invalido').hide('slow');
                        $('#button-submit').prop('disabled', false);
                    }
                });
                
                function getSubName(words) {
                    var n = words.split(" ");
                    n = n.filter(n => n)
                    if(n.length > 1){
                        if(n[n.length - 1] == " "){
                            return n[n.length];
                        }
                        return n[n.length - 1];
                    }else{
                        return null;
                    }
                }
                function removeLastNameFromFirstName(word){
                    var lastIndex = word.lastIndexOf(" ");
                    str = word.substring(0, lastIndex);
                    var n = word.split(" ");
                    n = n.filter(n => n);
                    if(n.length > 1){
                        n.pop();
                        return n.join(" ");
                    }else{
                        return word;
                    }
                }
                
                $('#kc-register-form').submit(function(event) {
                    var _this = $(this);
                    event.preventDefault();
                    $('#lastName').val(getSubName($('#firstName').val()));
                    $('#firstName').val(removeLastNameFromFirstName($('#firstName').val()));
                    _this.unbind('submit').submit();
                });
            });
        </script>
    </#if>
</@layout.registrationLayout>
