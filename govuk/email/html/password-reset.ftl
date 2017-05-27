<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("passwordResetBodyHtml", linkExpiration, realmName)}
    </#if>
    <#if section = "linkText">
        ${msg("passwordResetLinkTextHtml")}
    </#if>
</@layout.htmlEmailLayout>