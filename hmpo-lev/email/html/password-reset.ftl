<#import "template.ftl" as layout>
<#import "../utils.ftl" as constants>
<@layout.htmlEmailLayout ; section>
  <#if section = "text">
    ${msg("passwordResetBodyHtml", linkExpirationFormatter(linkExpiration), link, constants.serviceLinksHtml)?no_esc}
  </#if>
</@layout.htmlEmailLayout>
