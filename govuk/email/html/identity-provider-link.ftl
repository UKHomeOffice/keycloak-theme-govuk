<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("identityProviderLinkBodyHtml", identityProviderAlias, realmName, identityProviderContext.username, linkExpiration)}
    </#if>
    <#if section = "linkText">
        ${msg("identityProviderLinkLinkTextHtml")}
    </#if>
</@layout.htmlEmailLayout>