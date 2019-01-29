<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "form">
        <#if realm.password>
        <#--
            Hack-alert: Keycloak doesn't provide per-field error messages here,
            so we check global message for need to display validation error styling
        -->
        <#if message?has_content && message.type = "error">
            <#assign errorClass = "govuk-form-group--error" >
        </#if>
        <div class="govuk-grid-row">
            <div class="govuk-grid-column-full"><p>${msg("noAccountInstruction", msg("administrator"))}</p></div>
            <form id="kc-form-login" class="${properties.kcFormClass!} govuk-grid-column-two-thirds" action="${url.loginAction}" method="post">
                <div class="govuk-form-group ${errorClass!""}">
                    <label for="username" class="govuk-label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    <input id="username" class="govuk-input" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                </div>

                <div class="govuk-form-group ${errorClass!""}">
                    <label for="password" class="govuk-label">${msg("password")}</label>
                    <input id="password" class="govuk-input" name="password" type="password" autocomplete="off" />
                </div>


                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <#if realm.rememberMe && !usernameEditDisabled??>
                        <div class="checkbox govuk-form-group">
                            <div class="multiple-choice">
                                <#if login.rememberMe??>
                                    <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked>
                                    <label for="rememberMe" class="govuk-label govuk-checkboxes__label">${msg("rememberMe")}</label>
                                <#else>
                                    <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3">
                                    <label for="rememberMe" class="govuk-label govuk-checkboxes__label">${msg("rememberMe")}</label>
                                </#if>
                            </div>
                        </div>
                    </#if>
                </div>

                <input class="govuk-button" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
            </form>
        </div>
        <div class="govuk-grid-row">
            <div class="${properties.kcFormOptionsWrapperClass!} govuk-form-group">
                <#if realm.resetPasswordAllowed>
                    <p><a class="govuk-link govuk-body" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></p>
                </#if>
            </div>
        </div>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <h2 class="heading-medium">${msg("noAccount")}</h2>
                <p><a href="${url.registrationUrl}">${msg("registerLink")}</a></p>
            </div>
        </#if>

        <#if realm.password && social.providers??>
            <#-- This section of the theme has not yet been well styled. Non-trivial user research, interaction design and content design work is required to develop a solution for login using 3rd-party identity providers. -->
            <div id="kc-social-providers">
                <h2 class="heading-medium">${msg("socialProviders")}</h2>
                <ul class="list">
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="button zocial ${p.providerId}">${p.displayName}</a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
