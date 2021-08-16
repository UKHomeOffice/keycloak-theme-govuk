<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("executeActionsBodyHtml", linkExpiration, realmName)?no_esc}
    </#if>
    <#if section = "linkText">
        ${msg("executeActionsLinkTextHtml")?no_esc}
    </#if>
</@layout.htmlEmailLayout>
