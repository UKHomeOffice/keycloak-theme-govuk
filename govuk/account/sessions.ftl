<#import "template.ftl" as layout>
<@layout.mainLayout active='sessions' bodyClass='sessions'; section>

    <h1 class="govuk-heading-xl">${msg("sessionsHtmlTitle")}</h1>

    <table class="govuk-table">
        <thead class="govuk-table__head">
        <tr class="govuk-table__row">
            <th class="govuk-table__header" scope="col">${msg("ip")}</th>
            <th class="govuk-table__header" scope="col">${msg("started")}</th>
            <th class="govuk-table__header" scope="col">${msg("lastAccess")}</th>
            <th class="govuk-table__header" scope="col">${msg("expires")}</th>
            <th class="govuk-table__header" scope="col">${msg("clients")}</th>
        </tr>
        </thead>

        <tbody class="govuk-table__body">
        <#list sessions.sessions as session>
            <tr class="govuk-table__row">
                <td class="govuk-table__cell">${session.ipAddress}</td>
                <td class="govuk-table__cell">${session.started?datetime}</td>
                <td class="govuk-table__cell">${session.lastAccess?datetime}</td>
                <td class="govuk-table__cell">${session.expires?datetime}</td>
                <td class="govuk-table__cell">
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
        <button id="logout-all-sessions" class="govuk-button">${msg("doLogOutAllSessions")}</button>
    </form>

</@layout.mainLayout>