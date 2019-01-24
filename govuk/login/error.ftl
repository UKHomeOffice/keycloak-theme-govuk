<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title" || section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <#list msg("errorInstruction", msg("administrator"))?split('\n') as paragraph>
            <p class="instruction">${paragraph}</p>
        </#list>
        <#if client?? && client.baseUrl?has_content>
            <p><a class="govuk-button" role="button" id="backToApplication" href="${client.baseUrl}">${msg("goToLogin")}</a></p>
        <#else>
            <p><a class="govuk-button" role="button" id="backToApplication" href="/auth/realms/${realm???then(realm.id, 'opss')}/account">${msg("goToLogin")}</a></p>
        </#if>
    </#if>
</@layout.registrationLayout>
