<#import "../utils.ftl" as constants>

${msg("passwordResetBody",linkExpirationFormatter(linkExpiration), user.firstName, link, constants.serviceLinks)?no_esc}
