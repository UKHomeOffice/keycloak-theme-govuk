<#import "../utils.ftl" as constants>

<#if requiredActions?seq_contains("VERIFY_EMAIL")>
${msg("emailVerificationBody", linkExpirationFormatter(linkExpiration), user.firstName, user.lastName, link, constants.serviceLinks)?no_esc}
<#elseif requiredActions?seq_contains("UPDATE_PASSWORD")>
${msg("passwordResetBody", linkExpirationFormatter(linkExpiration), user.firstName, user.lastName, link)?no_esc}
<#else>
${msg("executeActionsBody", linkExpirationFormatter(linkExpiration), user.firstName, user.lastName, link)?no_esc}
</#if>
