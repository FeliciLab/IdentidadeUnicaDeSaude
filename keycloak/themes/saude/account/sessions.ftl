<#import "template.ftl" as layout>
<@layout.mainLayout active='sessions' bodyClass='sessions'; section>

    <div class="row">
        <div class="col-md-10">
            <h2><span class="fa pficon-service"></span>&emsp;${msg("sessionsHtmlTitle")}</h2>
        </div>
    </div>

    <div class="sessao">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <td>${msg("ip")}</td>
                <td>${msg("lastAccess")}</td>
                <td>${msg("expires")}</td>
                <td>${msg("clients")}</td>
            </tr>
            </thead>

            <tbody>
            <#list sessions.sessions as session>
                <tr>
                    <td>${session.ipAddress}</td>
                    <td>${session.lastAccess?datetime}</td>
                    <td>${session.expires?datetime}</td>
                    <td>
                        <#list session.clients as client>
                            ${client}<br/>
                        </#list>
                    </td>
                </tr>
            </#list>
            </tbody>

        </table>
    
        <form action="${url.sessionsUrl}" method="post">
            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
            <button id="logout-all-sessions" class="btn btn-default">${msg("doLogOutAllSessions")}</button>
        </form>
    </div>

</@layout.mainLayout>
