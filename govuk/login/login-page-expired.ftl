<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header" || section = "title">
        ${msg("pageExpiredTitle")}
    <#elseif section = "form">
        <p id="instruction1" class="instruction">
            <a id="loginContinueLink" class="govuk-button" role="button" href="${url.loginAction}">${msg("proceedWithAction")}</a>
        </p>
    </#if>
</@layout.registrationLayout>
