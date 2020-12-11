<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
  <#if section = "text">
    ${msg("emailVerificationBodyHtml", linkExpirationFormatter(linkExpiration), link)?no_esc}
  </#if>
</@layout.htmlEmailLayout>
