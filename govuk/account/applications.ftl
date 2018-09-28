<#import "template.ftl" as layout>
<@layout.mainLayout active='applications' bodyClass='applications'; section>

    <h1 class="govuk-heading-xl">${msg("applicationsHtmlTitle")}</h1>

    <form action="${url.applicationsUrl}" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <input type="hidden" id="referrer" name="referrer" value="${stateChecker}">

        <table class="govuk-table">
            <thead class="govuk-table__head">
              <tr class="govuk-table__row">
                <th class="govuk-table__header" scope="col">${msg("application")}</th>
                <th class="govuk-table__header" scope="col">${msg("availableRoles")}</th>
                <th class="govuk-table__header" scope="col">${msg("grantedPermissions")}</th>
                <th class="govuk-table__header" scope="col">${msg("additionalGrants")}</th>
                <th class="govuk-table__header" scope="col">${msg("action")}</th>
              </tr>
            </thead>

            <tbody class="govuk-table__body">
              <#list applications.applications as application>
                <tr class="govuk-table__row">
                    <td class="govuk-table__cell">
                        <#if application.effectiveUrl?has_content><a href="${application.effectiveUrl}"></#if>
                            <#if application.client.name?has_content>${advancedMsg(application.client.name)}<#else>${application.client.clientId}</#if>
                        <#if application.effectiveUrl?has_content></a></#if>
                    </td>

                    <td class="govuk-table__cell">
                        <#list application.realmRolesAvailable as role>
                            <#if role.description??>${advancedMsg(role.description)}<#else>${advancedMsg(role.name)}</#if>
                            <#if role_has_next>, </#if>
                        </#list>

                        <#list application.resourceRolesAvailable?keys as resource>
                            <#--  <#if application.realmRolesAvailable?has_content>, </#if>  -->
                            <#list application.resourceRolesAvailable[resource] as clientRole>
                            <ul>
                                <li class="list-bullet">
                                    <#if clientRole.roleDescription??>
                                        ${advancedMsg(clientRole.roleDescription)}
                                    <#else>
                                        ${advancedMsg(clientRole.roleName)}
                                    </#if>
                                    ${msg("inResource")} <strong><#if clientRole.clientName??>${advancedMsg(clientRole.clientName)}<#else>${clientRole.clientId}</#if></strong>
                                    <#--  <#if clientRole_has_next>, </#if>  -->
                                </li>
                            </ul>
                                
                            </#list>
                        </#list>
                    </td>

                    <td class="govuk-table__cell">
                        <#if application.client.consentRequired>
                            <#list application.clientScopesGranted as claim>
                                ${advancedMsg(claim)}<#if claim_has_next>, </#if>
                            </#list>
                        <#else>
                            <strong>${msg("fullAccess")}</strong>
                        </#if>
                    </td>

                    <td class="govuk-table__cell">
                       <#list application.additionalGrants as grant>
                            ${advancedMsg(grant)}<#if grant_has_next>, </#if>
                        </#list>
                    </td>

                    <td class="govuk-table__cell">
                        <#if (application.client.consentRequired && application.clientScopesGranted?has_content) || application.additionalGrants?has_content>
                            <button type='submit' class='${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!}' id='revoke-${application.client.clientId}' name='clientId' value="${application.client.id}">${msg("revoke")}</button>
                        </#if>
                    </td>
                </tr>
              </#list>
            </tbody>
        </table>
    </form>

</@layout.mainLayout>