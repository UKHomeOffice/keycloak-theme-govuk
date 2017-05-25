<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("eventUpdateTotpBodyHtml", event.date, event.ipAddress)}
    </#if>
</@layout.htmlEmailLayout>