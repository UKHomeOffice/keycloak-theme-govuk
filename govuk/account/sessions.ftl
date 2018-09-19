<#import "template.ftl" as layout>
<@layout.mainLayout active='sessions' bodyClass='sessions'; section>

    <div class="row">
        <div class="col-md-10">
            <h2 class="heading-large">${msg("sessionsHtmlTitle")}</h2>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>${msg("ip")}</th>
            <th>${msg("started")}</th>
            <th>${msg("lastAccess")}</th>
            <th>${msg("expires")}</th>
            <th>${msg("clients")}</th>
        </tr>
        </thead>

        <tbody>
        <#list sessions.sessions as session>
            <tr>
                <td>${session.ipAddress}</td>
                <td>${session.started?datetime}</td>
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
    <form action="${url.sessionsUrl}" method="post" style="margin-top:15px;">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <button id="logout-all-sessions" class="${properties.kcButtonClass!}">${msg("doLogOutAllSessions")}</button>
    </form>

</@layout.mainLayout>