<#import "template.ftl" as layout>
<#import "../utils.ftl" as constants>
<@layout.htmlEmailLayout ; section>
  <#if section = "text">
    <#if requiredActions?seq_contains("VERIFY_EMAIL")>
      ${msg("emailVerificationBodyHtml", linkExpirationFormatter(linkExpiration), link, constants.serviceLinksHtml)?no_esc}
    <#elseif requiredActions?seq_contains("UPDATE_PASSWORD")>
      ${msg("passwordResetBodyHtml", linkExpirationFormatter(linkExpiration), link, constants.serviceLinksHtml)?no_esc}
    <#else>
      ${msg("executeActionsBodyHtml", linkExpirationFormatter(linkExpiration), link)?no_esc}
    </#if>
  </#if>
</@layout.htmlEmailLayout>
