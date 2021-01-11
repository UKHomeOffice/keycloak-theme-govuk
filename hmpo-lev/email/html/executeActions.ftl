<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
  <#if section = "text">
    ${msg("executeActionsBodyHtml", linkExpirationFormatter(linkExpiration), link)?no_esc}
  </#if>
</@layout.htmlEmailLayout>
