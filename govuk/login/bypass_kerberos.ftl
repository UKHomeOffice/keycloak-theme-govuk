<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
    ${msg("kerberosNotConfiguredTitle")}
    <#elseif section = "header">
    ${msg("kerberosNotConfigured")}
    <#elseif section = "form">
    <div id="kc-info-message">
        <!-- <h3>${msg("kerberosNotConfigured")}</h3> -->
        <p class="instruction">${msg("bypassKerberosDetail")}</p>
        <form class="form-actions" action="${url.loginAction}" method="POST">
            <div class="govuk-form-group">
                 <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <div class="${properties.kcFormButtonsWrapperClass!}">
                        <input class="govuk-button" name="continue" id="kc-login" type="submit" value="${msg("doContinue")}"/>
                    </div>
                </div>
            </div>
        </form>
    </div>
    </#if>
</@layout.registrationLayout>
