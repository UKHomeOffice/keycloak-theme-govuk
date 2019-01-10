<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
        ${message.summary}
    <#elseif section = "header">
        ${message.summary}
    <#elseif section = "back">
    <#if client?? && client.baseUrl?has_content>
        <a class="link-back" href="${client.baseUrl}">${msg("backToApplication")}</a>
    </#if>
    <#elseif section = "form">
        <div id="kc-info-message">
            <#if requiredActions??>
                <#list requiredActions>
                    <ul class="list list-bullet">
                        <#items as reqActionItem><li>${msg("requiredAction.${reqActionItem}")}</li></#items>
                    </ul>
                </#list>
            </#if>
            <#if pageRedirectUri??>
                <p><a class="button" href="${pageRedirectUri}">${msg("backToApplication")?no_esc}</a></p>
            <#elseif actionUri??>
                <p><a class="button" href="${actionUri}">${msg("proceedWithAction")?no_esc}</a></p>
            <#elseif client.baseUrl??>
                <p><a class="button" href="${client.baseUrl}">${msg("backToApplication")?no_esc}</a></p>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
