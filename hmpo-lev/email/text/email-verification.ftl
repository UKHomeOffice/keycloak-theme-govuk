<#import "../utils.ftl" as constants>

${msg("emailVerificationBody",linkExpirationFormatter(linkExpiration), user.firstName, user.lastName, link, constants.serviceLinks)?no_esc}
