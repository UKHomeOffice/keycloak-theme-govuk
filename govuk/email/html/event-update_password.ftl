<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("eventUpdatePasswordBodyHtml", event.date, event.ipAddress)}
    </#if>
</@layout.htmlEmailLayout>