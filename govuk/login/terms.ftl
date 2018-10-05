<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
    ${msg("termsTitle")}
    <#elseif section = "header">
    ${msg("termsTitleHtml")?no_esc}
    <#elseif section = "form">
    <p>${msg("termsIntro")}</p>
    
    <div id="kc-terms-text" class="panel panel-border-wide">
        ${msg("termsText")}
    </div>
    <form class="form-actions" action="${url.loginAction}" method="POST">
        <input class="govuk-button" name="accept" id="kc-accept" type="submit" value="${msg("doAccept")}"/>
    </form>
    </#if>
</@layout.registrationLayout>
