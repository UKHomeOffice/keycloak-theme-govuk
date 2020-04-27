<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html>

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

<!--[if lt IE 9]><html class="lte-ie8 ${properties.kcHtmlClass!}" lang="${LANG_CODE}"><![endif]-->
<!--[if gt IE 8]><!--><html class="${properties.kcHtmlClass!}" lang="${LANG_CODE}"><!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"> - ${realm.displayName!'GOV.UK'}</title>

    <#-- Start GOV.UK Template <head> content -->

    <!--[if gt IE 8]><!--><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template.css?0.22.1" media="screen" rel="stylesheet" /><!--<![endif]-->
    <!--[if IE 6]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie6.css?0.22.1" media="screen" rel="stylesheet" /><![endif]-->
    <!--[if IE 7]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie7.css?0.22.1" media="screen" rel="stylesheet" /><![endif]-->
    <!--[if IE 8]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie8.css?0.22.1" media="screen" rel="stylesheet" /><![endif]-->
    <link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-print.css?0.22.1" media="print" rel="stylesheet" />

    <!--[if IE 8]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/fonts-ie8.css?0.22.1" media="all" rel="stylesheet" /><![endif]-->
    <!--[if gte IE 9]><!--><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/fonts.css?0.22.1" media="all" rel="stylesheet" /><!--<![endif]-->
    <!--[if lt IE 9]><script src="${url.resourcesPath}/vendor/govuk_template/javascripts/ie.js?0.22.1"></script><![endif]-->

    <link rel="shortcut icon" href="${url.resourcesPath}/images/cop-favicon.ico" type="image/x-icon" />

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
        <div><#nested "back"></div>

        <div class="grid-row">
            <div class="column-full">
                <h1 class="heading-large"><#nested "title"></h1>
                <p>The Central Operation Platform (COP) enables POISE users to access services on Windows 10, Edge browser equipped desktops or laptops and via Android and Apple mobile devices.</p>
                <p>Click <a href="https://training.cop.homeoffice.gov.uk/" target="_blank">how to use COP</a> for <strong>guidance and user guides</strong> for COP account set-up and services.</p>
                <p><strong>Existing users</strong> - To sign in to COP, on your POISE device, please click the green button below.</p>
                <p><strong>New users</strong> - To create a new account please click the green button below and follow the registration process.</p>
                <#if displayInfo>
                    <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                        <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                            <#nested "info">
                        </div>
                    </div>
                </#if>
                <h2 class="heading-small help-heading">Have a Problem?</h2>
                <p>If you encounter any issues using COP, please follow one of these procedures:</p>
                <ul class="list help-list">
                    <li><strong>If you cannot create a COP account or sign into COP</strong>, please log your issue via <a href="https://lssiprod.service-now.com/ess" target="_blank">the IT Now</a> servicedesk or call 0845 000 0050, state you are unable to access COP and provide details of whether you are using a laptop, desktop or smartphone. The IT Now servicedesk is operational 24 hours a day, 7 days a week.</li>
                    <li><strong>If you have created a COP account</strong> you can ask for support, provide feedback or contact us here <a href="https://support.cop.homeoffice.gov.uk/servicedesk/customer/portal/3" target="_blank">COP service desk</a> or by pressing the <strong>Support</strong> link in the COP main header section.</li>
                </ul>
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
