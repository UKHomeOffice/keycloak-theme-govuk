<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("emailForgotTitle")}
    <#elseif section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <p class="govuk-body">${msg("emailInstruction")}</p>
        <div class="govuk-grid-row">
            <form id="kc-reset-password-form" class="${properties.kcFormClass!} govuk-grid-column-two-thirds" action="${url.loginAction}" method="post">
                <div class="govuk-form-group">
                    <label for="username" class="govuk-label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    <input type="text" id="username" name="username" class="govuk-input" autofocus/>
                </div>

                <div class="govuk-form-group">
                    <input class="govuk-button" type="submit" value="${msg("doResetPassword")}"/>
                </div>
            </form>
        </div>
        <p><a class="govuk-link" href="${url.loginUrl}">${msg("backToLogin")}</a></p>
    </#if>
</@layout.registrationLayout>
