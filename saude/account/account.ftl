<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>



    <div id="session-inicio">
        <div class="row">
            <div class="col-md-10">
                <h1>Bem-vindo ao ID Saúde</h1>
            </div>
        </div>

        <div class="row"> 
            <div class="sessao"> 
                <h2>Meus dados</h2>
                <div class="row">
                    <div class="col-md-1">
                        <span class="fa pficon-user usuario-icone styles-img"></span>
                    </div>
                    <div class="col-md-11">
                        E-mail: ${(account.email!'')}<br>
                        ${msg("firstName")}: ${(account.firstName!'')}<br>
                        ${msg("lastName")}: ${(account.lastName!'')}<br>
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-md-offset-11">
                        <a href="#session-minhaconta" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}">Acessar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <form action="${url.accountUrl}" class="form-horizontal" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <div id="session-minhaconta">
            <div class="sessao">
                <div class="row">
                    <div class="col-md-10">
                        <h2><span class="fa pficon-user"></span> Minha conta</h2>
                    </div>
                    <div class="col-md-2 subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                    </div>
                </div>

                <#if !realm.registrationEmailAsUsername>
                    <div class="form-group ${messagesPerField.printIfExists('username','has-error')}">
                        <div class="col-md-11">
                            <label for="username" class="control-label">${msg("username")} <#if realm.editUsernameAllowed><span class="required">*</span></#if></label> 
                            <input type="text" class="form-control" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
                        </div>
                    </div>
                </#if>

                <div class="form-group ${messagesPerField.printIfExists('email','has-error')}">
                    <div class="col-md-11">
                        <label for="email" class="control-label">${msg("email")} <span class="required">*</span></label>     
                        <input type="text" class="form-control" id="email" name="email" autofocus value="${(account.email!'')}"/>
                    </div>
                </div>

                <div class="form-group ${messagesPerField.printIfExists('firstName','has-error')}">
                    <div class="col-md-11">
                        <label for="firstName" class="control-label">${msg("firstName")} <span class="required">*</span></label>
                        <input type="text" class="form-control" id="firstName" name="firstName" value="${(account.firstName!'')}"/>
                    </div>
                </div>
                <div class="form-group ${messagesPerField.printIfExists('lastName','has-error')}">
                    <div class="col-md-11">
                        <label for="lastName" class="control-label">${msg("lastName")} <span class="required">*</span></label>
                        <input type="text" class="form-control" id="lastName" name="lastName" value="${(account.lastName!'')}"/>
                    </div>
                </div>
            </div>

            <div class="sessao">
                <div class="row">
                    <div class="col-md-12">
                        <h2><span class="fa fa-map-marker"></span> Endereço</h2><hr>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-6">
                        <label for="user.attributes.ENDERECO" class="control-label">Endereço</label>
                        <input type="text" class="form-control" id="user.attributes.ENDERECO" name="user.attributes.ENDERECO" value="${(account.attributes.ENDERECO!'')}"/>
                    </div>
        
                    <div class="col-md-6">
                        <label for="user.attributes.CIDADE" class="control-label">Cidade</label>
                        <input type="text" class="form-control" id="user.attributes.CIDADE" name="user.attributes.CIDADE" value="${(account.attributes.CIDADE!'')}"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <label for="user.attributes.ESTADO" class="control-label">Estado</label>
                        <input type="text" class="form-control" id="user.attributes.ESTADO" name="user.attributes.ESTADO" value="${(account.attributes.ESTADO!'')}"/>
                    </div>
        
                    <div class="col-md-6">
                        <label for="user.attributes.PAIS" class="control-label">País</label>
                        <input type="text" class="form-control" id="user.attributes.PAIS" name="user.attributes.PAIS" value="${(account.attributes.PAIS!'')}"/>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="session-documentos" class="sessao" >
            <div class="row">
                <div class="col-md-10">
                    <h2><span class="fa pficon-repository"></span> Documentos</h2>
                </div>
                <div class="col-md-2 subtitle">
                    <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                </div>
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
        </div>
        <div class="form-group" id="form-botao">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="">
                    <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                    <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Save">${msg("doSave")}</button>
                    <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {
            hide();

            var url = window.location.href;
            var id = url.substring(url.lastIndexOf('/') + 1);
            
            // se não existir o id (identificador do conteúdo) o início será apresentado
            if (id.length == 1) {
                id = '#session-inicio';
            }

            console.log(id);

            show(id);           

            $(window).on('hashchange', function(e){
                var url = window.location.href;
                var id = url.substring(url.lastIndexOf('/') + 1);

                hide();
                show(id);
            });

            function hide() {
                $('#session-inicio').hide();
                $('#session-minhaconta').hide();
                $('#session-documentos').hide();
                $('#form-botao').hide();

                $('#session-inicio-menu').removeClass('active');
                $('#session-minhaconta-menu').removeClass('active');
                $('#session-documentos-menu').removeClass('active');                
            }

            function show(id) {
                $(id).show();
                $(id + '-menu').addClass('active');

                if (id == '#session-minhaconta' || id == '#session-documentos') {
                    $('#form-botao').show();
                }
            }
        });
    </script>
</@layout.mainLayout>
