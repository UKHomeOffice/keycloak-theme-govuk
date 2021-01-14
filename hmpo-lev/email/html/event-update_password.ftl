<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
  <#if section = "text">
    ${msg("eventUpdatePasswordBodyHtml", event.date, event.ipAddress)?no_esc}
  </#if>
</@layout.htmlEmailLayout>
