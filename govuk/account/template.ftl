<#macro mainLayout active bodyClass>
<!doctype html>

<#-- Attempt to reverse-engineer code for page’s current language, as Keycloak does not currently make this available -->
<#assign LANG_CODE = "en">
<#if .locale??>
    <#assign LANG_CODE = .locale>
</#if>
<#if locale??>
    <#list locale.supported>
        <#items as supportedLocale>
            <#if supportedLocale.label == locale.current>
                <#if supportedLocale.url?contains("?kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after("?kc_locale=")[0..1]>
                </#if>
                <#if supportedLocale.url?contains("&kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after("&kc_locale=")[0..1]>
                </#if>
            </#if>
        </#items>
    </#list>
</#if>


<html class="${properties.kcHtmlClass!}" lang="${LANG_CODE}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("accountManagementTitle")}</title>

    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">

    <#-- Start GOV.UK Template <head> content -->

    <!--[if gt IE 8]><!--><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template.css?0.22.1" media="screen" rel="stylesheet" /><!--<![endif]-->
    <!--[if IE 6]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie6.css?0.22.1" media="screen" rel="stylesheet" /><![endif]-->
    <!--[if IE 7]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie7.css?0.22.1" media="screen" rel="stylesheet" /><![endif]-->
    <!--[if IE 8]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie8.css?0.22.1" media="screen" rel="stylesheet" /><![endif]-->
    <link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-print.css?0.22.1" media="print" rel="stylesheet" />

    <!--[if IE 8]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/fonts-ie8.css?0.22.1" media="all" rel="stylesheet" /><![endif]-->
    <!--[if gte IE 9]><!--><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/fonts.css?0.22.1" media="all" rel="stylesheet" /><!--<![endif]-->
    <!--[if lt IE 9]><script src="${url.resourcesPath}/vendor/govuk_template/javascripts/ie.js?0.22.1"></script><![endif]-->

    <link rel="shortcut icon" href="${url.resourcesPath}/vendor/govuk_template/images/favicon.ico?0.22.1" type="image/x-icon" />
    <link rel="mask-icon" href="${url.resourcesPath}/vendor/govuk_template/images/gov.uk_logotype_crown.svg?0.22.1" color="#0b0c0c">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-152x152.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-120x120.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-76x76.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-60x60.png?0.22.1">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:image" content="${url.resourcesPath}/vendor/govuk_template/images/opengraph-image.png?0.22.1">

    <#-- End GOV.UK Template <head> content -->

        <#-- GOV.UK Elements stylesheets -->

    <!--[if gt IE 8]><!--><link href="${url.resourcesPath}/css/govuk_elements.css" rel="stylesheet" type="text/css"><!--<![endif]-->
    <!--[if IE 6]><link href="${url.resourcesPath}/css/govuk_elements-ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
    <!--[if IE 7]><link href="${url.resourcesPath}/css/govuk_elements-ie7.css" rel="stylesheet" type="text/css" /><![endif]-->
    <!--[if IE 8]><link href="${url.resourcesPath}/css/govuk_elements-ie8.css" rel="stylesheet" type="text/css" /><![endif]-->

    <#-- End GOV.UK Elements stylesheets -->

    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>
<body class="${properties.kcBodyClass!}">
    <#-- Add GOV.UK Template <body> JavaScript class -->
    <script>document.body.className = ((document.body.className) ? document.body.className + ' js-enabled' : 'js-enabled');</script>
        
    <#-- Start GOV.UK Template header -->

    <div id="skiplink-container">
      <div>
        <a href="#content" class="skiplink">Skip to main content</a>
      </div>
    </div>
    <div id="global-cookie-message">

        <p>GOV.UK uses cookies to make the site simpler. <a href=\"https://www.gov.uk/help/cookies\">Find out more about cookies</a></p>

    </div>
    <header role="banner" id="global-header" class="${properties.kcHeaderClass!} with-proposition">
      <div class="header-wrapper">
        <div class="header-global">
          <div class="header-logo">
            <a href="https://www.gov.uk" title="Go to the GOV.UK homepage" id="logo" class="content">
              <img src="${url.resourcesPath}/vendor/govuk_template/images/gov.uk_logotype_crown_invert_trans.png?0.22.1" width="36" height="32" alt=""> GOV.UK
            </a>
          </div>
        </div>
        <#if realm.displayNameHtml?? || realm.displayName??>
          <div class="header-proposition">
            <div class="content">
              <#if realm.displayNameHtml?? && realm.displayNameHtml != realm.displayName>
                ${realm.displayNameHtml?no_esc}
              <#elseif realm.displayName??>
                <a href="/" id="proposition-name">${realm.displayName}</a>
              </#if>
            </div>
          </div>
        </#if>
      </div>
    </header>

    <div id="global-header-bar"></div>

    <#-- End GOV.UK Template header -->

    <main id="content" role="main">
        <div class="grid-row">
            <div class="column-one-third">
                <ul>
                    <li class="<#if active=='account'>active</#if> heading-small"><a href="${url.accountUrl}">${msg("account")}</a></li>
                    <#if features.passwordUpdateSupported><li class="<#if active=='password'>active</#if> heading-small"><a href="${url.passwordUrl}">${msg("password")}</a></li></#if>
                    <li class="<#if active=='totp'>active</#if> heading-small"><a href="${url.totpUrl}">${msg("authenticator")}</a></li>
                    <#if features.identityFederation><li class="<#if active=='social'>active</#if> heading-small"><a href="${url.socialUrl}">${msg("federatedIdentity")}</a></li></#if>
                    <li class="<#if active=='sessions'>active</#if> heading-small"><a href="${url.sessionsUrl}">${msg("sessions")}</a></li>
                    <li class="<#if active=='applications'>active</#if> heading-small"><a href="${url.applicationsUrl}">${msg("applications")}</a></li>
                    <#if features.log><li class="<#if active=='log'>active</#if> heading-small"><a href="${url.logUrl}">${msg("log")}</a></li></#if>
                    <#if realm.userManagedAccessAllowed && features.authorization><li class="<#if active=='authorization'>active</#if> heading-small"><a href="${url.resourceUrl}">${msg("myResources")}</a></li></#if>
                </ul>
            </div>
            <div class="content-area column-two-thirds">
                <#if message?has_content>
                    <div class="alert alert-${message.type}">
                        <#if message.type=='success' ><span class="pficon pficon-ok"></span></#if>
                        <#if message.type=='error' ><span class="pficon pficon-error-octagon"></span><span class="pficon pficon-error-exclamation"></span></#if>
                        ${kcSanitize(message.summary)?no_esc}
                    </div>
                </#if>

                <#nested "content">
            </div>
        </div>
    </main>

    <#-- Start GOV.UK Template footer -->

    <footer class="group js-footer" id="footer" role="contentinfo">

      <div class="footer-wrapper">
        <div class="footer-meta">
          <div class="footer-meta-inner">

            <div class="open-government-licence">
              <p class="logo"><a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/" rel="license">Open Government Licence</a></p>

                <p>All content is available under the <a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/" rel="license">Open Government Licence v3.0</a>, except where otherwise stated</p>

            </div>
          </div>

          <div class="copyright">
            <a href="http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/">&copy; Crown copyright</a>
          </div>
        </div>
      </div>
    </footer>

    <div id="global-app-error" class="app-error hidden"></div>

    <script src="${url.resourcesPath}/vendor/govuk_template/javascripts/govuk-template.js?0.22.1"></script>

    <script>if (typeof window.GOVUK === 'undefined') document.body.className = document.body.className.replace('js-enabled', '');</script>

    <#-- End GOV.UK Template footer -->

</body>
</html>
</#macro>