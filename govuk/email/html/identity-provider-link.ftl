<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("identityProviderLinkBodyHtml", identityProviderAlias, realmName, identityProviderContext.username, linkExpiration)?no_esc}
    </#if>
    <#if section = "linkText">
        ${msg("identityProviderLinkLinkTextHtml")?no_esc}
    </#if>
</@layout.htmlEmailLayout>
