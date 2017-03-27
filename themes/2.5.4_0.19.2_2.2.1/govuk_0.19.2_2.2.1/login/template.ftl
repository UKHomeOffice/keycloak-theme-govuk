<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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

<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}" lang="${LANG_CODE}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"> - ${realm.displayName?html!'GOV.UK'}</title>

    <#-- Start GOV.UK Template <head> content -->

    <!--[if gt IE 8]><!--><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template.css?0.19.2" media="screen" rel="stylesheet" /><!--<![endif]-->
    <!--[if IE 6]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie6.css?0.19.2" media="screen" rel="stylesheet" /><![endif]-->
    <!--[if IE 7]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie7.css?0.19.2" media="screen" rel="stylesheet" /><![endif]-->
    <!--[if IE 8]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie8.css?0.19.2" media="screen" rel="stylesheet" /><![endif]-->
    <link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-print.css?0.19.2" media="print" rel="stylesheet" />

    <!--[if IE 8]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/fonts-ie8.css?0.19.2" media="all" rel="stylesheet" /><![endif]-->
    <!--[if gte IE 9]><!--><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/fonts.css?0.19.2" media="all" rel="stylesheet" /><!--<![endif]-->
    <!--[if lt IE 9]><script src="{{ asset_path }}javascripts/ie.js?0.19.2"></script><![endif]-->

    <link rel="shortcut icon" href="${url.resourcesPath}/vendor/govuk_template/images/favicon.ico?0.19.2" type="image/x-icon" />
    <link rel="mask-icon" href="${url.resourcesPath}/vendor/govuk_template/images/gov.uk_logotype_crown.svg?0.19.2" color="#0b0c0c">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-152x152.png?0.19.2">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-120x120.png?0.19.2">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-76x76.png?0.19.2">
    <link rel="apple-touch-icon-precomposed" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-60x60.png?0.19.2">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:image" content="${url.resourcesPath}/vendor/govuk_template/images/opengraph-image.png?0.19.2">

    <#-- End GOV.UK Template <head> content -->


    <#-- GOV.UK Elements stylesheets -->

    <!--[if gt IE 8]><!--><link href="${url.resourcesPath}/css/govuk_elements.css"  rel="stylesheet" type="text/css"><!--<![endif]-->
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
    <header role="banner" id="global-header" class="${properties.kcHeaderClass!}">
      <div class="header-wrapper">
        <div class="header-global">
          <div class="header-logo">
            <a href="${realm.displayNameHtml?html!'https://www.gov.uk'}" title="Go to the ${realm.displayName?html!'GOV.UK'} homepage" id="logo" class="content">
              <img src="${url.resourcesPath}/vendor/govuk_template/images/gov.uk_logotype_crown_invert_trans.png?0.19.2" width="36" height="32" alt=""> ${realm.displayName?html!'GOV.UK'}
            </a>
          </div>
        </div>
      </div>
    </header>

    <div id="global-header-bar"></div>

    <#-- End GOV.UK Template header -->


    <main id="content" role="main">
        <div class="grid-row">
            <div class="column-two-thirds">
                <h1 class="heading-large"><#nested "title"></h1>


                <#-- The GOV.UK Template is not designed for custom logos, so remove the Keycloak template’s logo HTML -->
                <#-- <div id="kc-logo"><a href="${properties.kcLogoLink!'#'}"><div id="kc-logo-wrapper"></div></a></div> -->

                <div id="kc-container" class="${properties.kcContainerClass!}">
                    <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">

                        <#-- The GOV.UK Template header is included above, with Keycloak’s nested header section inside it, so remove the Keycloak template’s header HTML -->
                        <#-- <div id="kc-header" class="${properties.kcHeaderClass!}">
                            <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}"><#nested "header"></div>
                        </div>-->

                        <#if realm.internationalizationEnabled>
                            <div id="kc-locale" class="${properties.kcLocaleClass!}">
                                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                                    <div class="kc-dropdown" id="kc-locale-dropdown">
                                        <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                        <ul>
                                            <#list locale.supported as l>
                                                <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                            </#list>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </#if>

                        <div id="kc-content" class="${properties.kcContentClass!}">
                            <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">

                                <#if displayMessage && message?has_content>
                                    <#if message.type = 'error'>
                                        <div class="error-summary" role="group" aria-labelledby="error-summary-heading-example-1" tabindex="-1">
                                            <h1 class="heading-medium error-summary-heading" id="error-summary-heading-example-1">
                                                There is a problem with this form
                                            </h1>

                                            <ul class="error-summary-list" id="error-details">
                                                <li>${message.summary}</li>
                                            </ul>
                                        </div>
                                    <#else>
                                        <div class="${properties.kcFeedbackAreaClass!}">
                                            <div class="alert alert-${message.type}">
                                                <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                                <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                                <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                                <span class="kc-feedback-text">${message.summary}</span>
                                            </div>
                                        </div>
                                    </#if>
                                </#if>

                                <div id="kc-form" class="${properties.kcFormAreaClass!}">
                                    <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                                        <#nested "form">
                                    </div>
                                </div>

                                <#if displayInfo>
                                    <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                                        <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                            <#nested "info">
                                        </div>
                                    </div>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>


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

    <script src="${url.resourcesPath}/vendor/govuk_template/javascripts/govuk-template.js?0.19.2"></script>

    <script>if (typeof window.GOVUK === 'undefined') document.body.className = document.body.className.replace('js-enabled', '');</script>

    <#-- End GOV.UK Template footer -->


    <#-- Enable GOV.UK Front-End Toolkit checkboxes -->
    <script src="${url.resourcesPath}/vendor/jquery/jquery-1.11.3.min.js"></script><#-- GOV.UK Front-End Toolkit selection buttons (radios and checkboxes) currently depend on jQuery -->
    <script src="${url.resourcesPath}/vendor/govuk_frontend_toolkit/javascripts/govuk/selection-buttons.js"></script>
    <script>document.addEventListener('DOMContentLoaded', function (event) {
        new GOVUK.SelectionButtons($('label input[type=checkbox]'));
    });
    </script>

</body>
</html>
</#macro>
