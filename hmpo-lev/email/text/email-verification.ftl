<#import "../utils.ftl" as constants>

${msg("emailVerificationBody",linkExpirationFormatter(linkExpiration), user.firstName, link, constants.serviceLinks)?no_esc}
