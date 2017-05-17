<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
    ${message.summary}
    <#elseif section = "header">
    ${message.summary}
    <#elseif section = "back">
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri??>
                <a class="link-back" href="${pageRedirectUri}">${msg("backToApplication")}</a>
            <#elseif client.baseUrl??>
                <a class="link-back" href="${client.baseUrl}">${msg("backToApplication")}</a>
            </#if>
        </#if>
    <#elseif section = "form">
    <div id="kc-info-message">
        <p class="instruction">${message.summary}</p>
        <#if skipLink??>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>