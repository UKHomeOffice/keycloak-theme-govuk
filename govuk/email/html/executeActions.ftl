<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("executeActionsBodyHtml", linkExpiration, realmName)}
    </#if>
    <#if section = "linkText">
        ${msg("executeActionsLinkTextHtml")}
    </#if>
</@layout.htmlEmailLayout>
