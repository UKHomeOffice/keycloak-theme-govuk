<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("emailVerifyTitle")}
    <#elseif section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
        <p class="instruction">
            ${msg("emailVerifyInstruction1")}
        </p>
        <p class="instruction">
            ${msg("emailVerifyInstruction2")}
        </p>
        <p class="instruction">
            ${msg("emailVerifyInstruction3")} <a class="govuk-link" href="${url.loginAction}">${msg("doResendEmail")}</a>
        </p>
        <p>
            <a class="govuk-link" href="${url.loginRestartFlowUrl}">${msg("returnToLogin")}</a>
        </p>
    </#if>
</@layout.registrationLayout>
