<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginProfileTitle")}
    <#elseif section="header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
                <div class="govuk-form-group ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)} hidden">
                    <label for="username" class="govuk-label">${msg("username")}</label>
                    <input type="text" id="username" name="username" class="govuk-input" value="${(user.username!'')}" />
                </div>
            </#if>

            <div class="govuk-form-group ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <label for="email" class="govuk-label">${msg("email")}</label>
                <input type="text" id="email" name="email" value="${(user.email!'')}" class="govuk-input" autofocus />
            </div>

            <div class="govuk-form-group ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <label for="email" class="govuk-label">${msg("firstName")}</label>
                <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}" class="govuk-input" />
            </div>

            <#--We're hiding this field as keycloak needs it for validation, but we're using firstName to store the full name -->
            <div hidden class="govuk-form-group ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <label for="email" class="govuk-label">${msg("lastName")}</label>
                <input type="text" id="lastName" name="lastName" value="${('UNUSED')}" class="govuk-input" />
            </div>

            <div class="govuk-form-group">
                <input class="govuk-button" type="submit" value="${msg("doSubmit")}"/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
