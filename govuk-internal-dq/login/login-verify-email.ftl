<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("emailVerifyTitle")}
    <#elseif section = "header">
        ${msg("emailVerifyTitle")}    
    <#elseif section = "form">
        <p class="instruction">${msg("emailVerifyInstruction1")}</p>
        <p class="instruction">
            ${msg("emailVerifyInstruction2")}            
            ${msg("emailVerifyInstruction3")} <a href="${url.loginAction}">${msg("emailResentClickMessage")}</a> 
        </p>
    <#elseif section = "info">
       
    </#if>
</@layout.registrationLayout>