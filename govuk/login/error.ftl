<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title" || section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div id="kc-error-message">
            <#list msg(message.summary, msg("administrator"))?split('\n') as paragraph>
                <p class="instruction">${paragraph}</p>
            </#list>
        </div>
        <#if client?? && client.baseUrl?has_content>
            <a class="link-back govuk-button" id="backToApplication" href="${client.baseUrl}">${msg("backToApplication")}</a>
        </#if>
    </#if>
</@layout.registrationLayout>
