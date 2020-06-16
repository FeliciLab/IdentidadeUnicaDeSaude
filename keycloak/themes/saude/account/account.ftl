<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

    <div class="row">
        <div class="col-md-10">
            <h2>${msg("editAccountHtmlTitle")}</h2>
        </div>
        <div class="col-md-2 subtitle">
            <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
        </div>
    </div>

    <form action="${url.accountUrl}" class="form-horizontal" method="post">

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <#if !realm.registrationEmailAsUsername>
            <div class="form-group ${messagesPerField.printIfExists('username','has-error')}">
                <label for="username" class="control-label">${msg("username")} <#if realm.editUsernameAllowed><span class="required">*</span></#if></label> 
                <input type="text" class="form-control" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
            </div>
        </#if>

        <div class="form-group ${messagesPerField.printIfExists('email','has-error')}">
            <label for="email" class="control-label">${msg("email")} <span class="required">*</span></label>     
            <input type="text" class="form-control" id="email" name="email" autofocus value="${(account.email!'')}"/>
        </div>

        <div class="form-group ${messagesPerField.printIfExists('firstName','has-error')}">
            <label for="firstName" class="control-label">${msg("firstName")} <span class="required">*</span></label>
            <input type="text" class="form-control" id="firstName" name="firstName" value="${(account.firstName!'')}"/>
        </div>

        <div class="form-group ${messagesPerField.printIfExists('lastName','has-error')}">
            <label for="lastName" class="control-label">${msg("lastName")} <span class="required">*</span></label>
            <input type="text" class="form-control" id="lastName" name="lastName" value="${(account.lastName!'')}"/>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h2>CPF</h2><hr>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-12">
                <label for="user.attributes.CPF" class="control-label">CPF</label>
                <input type="text" class="form-control" id="user.attributes.CPF" name="user.attributes.CPF" value="${(account.attributes.CPF!'')}"/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h2>RG</h2><hr>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-12">
                <label for="user.attributes.RG" class="control-label">RG</label>
                <input type="text" class="form-control" id="user.attributes.RG" name="user.attributes.RG" value="${(account.attributes.RG!'')}"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-4">
                <label for="user.attributes.RG_DATA_EMISSAO" class="control-label">Data de emissão</label>
                <input type="text" class="form-control" id="user.attributes.RG_DATA_EMISSAO" name="user.attributes.RG_DATA_EMISSAO" value="${(account.attributes.RG_DATA_EMISSAO!'')}"/>
            </div>
 
            <div class="col-md-4">
                <label for="user.attributes.RG_ESTADO" class="control-label">Estado</label>
                <input type="text" class="form-control" id="user.attributes.RG_ESTADO" name="user.attributes.RG_ESTADO" value="${(account.attributes.RG_ESTADO!'')}"/>
            </div>

            <div class="col-md-4">
                <label for="user.attributes.RG_ORGAO_EXPEDIDOR" class="control-label">Orgão Expedidor</label>
                <input type="text" class="form-control" id="user.attributes.RG_ORGAO_EXPEDIDOR" name="user.attributes.RG_ORGAO_EXPEDIDOR" value="${(account.attributes.RG_ORGAO_EXPEDIDOR!'')}"/>
            </div>
        </div>

        <div class="form-group">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="">
                    <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                    <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Save">${msg("doSave")}</button>
                    <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                </div>
            </div>
        </div>
    </form>

</@layout.mainLayout>
