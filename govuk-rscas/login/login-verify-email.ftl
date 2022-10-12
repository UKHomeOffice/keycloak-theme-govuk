<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
        <p class="instruction">${msg("emailVerifyInstruction1",user.email)}</p> 
    <#elseif section = "info">
        <p class="instruction">
            ${msg("emailVerifyInstruction2")}          
            ${msg("emailVerifyInstruction3")} <a href="${url.loginAction}">${msg("emailResentClickMessage")}</a> 
        </p>
    </#if>
</@layout.registrationLayout>