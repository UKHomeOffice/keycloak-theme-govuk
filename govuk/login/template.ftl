<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html >

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

<html class="govuk-template" lang="${LANG_CODE}">

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

    <link rel="shortcut icon" href="${url.resourcesPath}/assets/images/favicon.ico" type="image/x-icon" />
    <link rel="mask-icon" href="${url.resourcesPath}/assets/images/govuk-logotype-crown.png" color="#0b0c0c">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="${url.resourcesPath}/assets/images/govuk-apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon-precomposed" sizes="167x167" href="${url.resourcesPath}/assets/images/govuk-apple-touch-icon-167x167.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="${url.resourcesPath}/assets/images/govuk-apple-touch-icon-180x180.png">
    <link rel="apple-touch-icon-precomposed" href="${url.resourcesPath}/assets/images/govuk-apple-touch-icon.png">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:image" content="${url.resourcesPath}/assets/images/govuk-opengraph-image.png">

    <#-- End GOV.UK Template <head> content -->

    <#-- GOV.UK Design System stylesheet -->

    <link href="${url.resourcesPath}/css/application.css" rel="stylesheet" type="text/css">

    <#-- End GOV.UK Design System stylesheet -->
</head>

<body class="govuk-template__body">
    <#-- Add GOV.UK Template <body> JavaScript class -->
    <script>document.body.className = ((document.body.className) ? document.body.className + ' js-enabled' : 'js-enabled');</script>

    <#-- Start GOV.UK Template header -->

    <a href="#content" class="govuk-skip-link">Skip to main content</a>
    <header class="govuk-header" role="banner" data-module="header">
        <div class="govuk-header__container govuk-width-container">
            <div class="govuk-header__logo">
            <a href="#" class="govuk-header__link govuk-header__link--homepage">
                <span class="govuk-header__logotype">

                <svg role="presentation" focusable="false" class="govuk-header__logotype-crown" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 132 97" height="32" width="36">
                    <path fill="currentColor" fill-rule="evenodd" d="M25 30.2c3.5 1.5 7.7-.2 9.1-3.7 1.5-3.6-.2-7.8-3.9-9.2-3.6-1.4-7.6.3-9.1 3.9-1.4 3.5.3 7.5 3.9 9zM9 39.5c3.6 1.5 7.8-.2 9.2-3.7 1.5-3.6-.2-7.8-3.9-9.1-3.6-1.5-7.6.2-9.1 3.8-1.4 3.5.3 7.5 3.8 9zM4.4 57.2c3.5 1.5 7.7-.2 9.1-3.8 1.5-3.6-.2-7.7-3.9-9.1-3.5-1.5-7.6.3-9.1 3.8-1.4 3.5.3 7.6 3.9 9.1zm38.3-21.4c3.5 1.5 7.7-.2 9.1-3.8 1.5-3.6-.2-7.7-3.9-9.1-3.6-1.5-7.6.3-9.1 3.8-1.3 3.6.4 7.7 3.9 9.1zm64.4-5.6c-3.6 1.5-7.8-.2-9.1-3.7-1.5-3.6.2-7.8 3.8-9.2 3.6-1.4 7.7.3 9.2 3.9 1.3 3.5-.4 7.5-3.9 9zm15.9 9.3c-3.6 1.5-7.7-.2-9.1-3.7-1.5-3.6.2-7.8 3.7-9.1 3.6-1.5 7.7.2 9.2 3.8 1.5 3.5-.3 7.5-3.8 9zm4.7 17.7c-3.6 1.5-7.8-.2-9.2-3.8-1.5-3.6.2-7.7 3.9-9.1 3.6-1.5 7.7.3 9.2 3.8 1.3 3.5-.4 7.6-3.9 9.1zM89.3 35.8c-3.6 1.5-7.8-.2-9.2-3.8-1.4-3.6.2-7.7 3.9-9.1 3.6-1.5 7.7.3 9.2 3.8 1.4 3.6-.3 7.7-3.9 9.1zM69.7 17.7l8.9 4.7V9.3l-8.9 2.8c-.2-.3-.5-.6-.9-.9L72.4 0H59.6l3.5 11.2c-.3.3-.6.5-.9.9l-8.8-2.8v13.1l8.8-4.7c.3.3.6.7.9.9l-5 15.4v.1c-.2.8-.4 1.6-.4 2.4 0 4.1 3.1 7.5 7 8.1h.2c.3 0 .7.1 1 .1.4 0 .7 0 1-.1h.2c4-.6 7.1-4.1 7.1-8.1 0-.8-.1-1.7-.4-2.4V34l-5.1-15.4c.4-.2.7-.6 1-.9zM66 92.8c16.9 0 32.8 1.1 47.1 3.2 4-16.9 8.9-26.7 14-33.5l-9.6-3.4c1 4.9 1.1 7.2 0 10.2-1.5-1.4-3-4.3-4.2-8.7L108.6 76c2.8-2 5-3.2 7.5-3.3-4.4 9.4-10 11.9-13.6 11.2-4.3-.8-6.3-4.6-5.6-7.9 1-4.7 5.7-5.9 8-.5 4.3-8.7-3-11.4-7.6-8.8 7.1-7.2 7.9-13.5 2.1-21.1-8 6.1-8.1 12.3-4.5 20.8-4.7-5.4-12.1-2.5-9.5 6.2 3.4-5.2 7.9-2 7.2 3.1-.6 4.3-6.4 7.8-13.5 7.2-10.3-.9-10.9-8-11.2-13.8 2.5-.5 7.1 1.8 11 7.3L80.2 60c-4.1 4.4-8 5.3-12.3 5.4 1.4-4.4 8-11.6 8-11.6H55.5s6.4 7.2 7.9 11.6c-4.2-.1-8-1-12.3-5.4l1.4 16.4c3.9-5.5 8.5-7.7 10.9-7.3-.3 5.8-.9 12.8-11.1 13.8-7.2.6-12.9-2.9-13.5-7.2-.7-5 3.8-8.3 7.1-3.1 2.7-8.7-4.6-11.6-9.4-6.2 3.7-8.5 3.6-14.7-4.6-20.8-5.8 7.6-5 13.9 2.2 21.1-4.7-2.6-11.9.1-7.7 8.8 2.3-5.5 7.1-4.2 8.1.5.7 3.3-1.3 7.1-5.7 7.9-3.5.7-9-1.8-13.5-11.2 2.5.1 4.7 1.3 7.5 3.3l-4.7-15.4c-1.2 4.4-2.7 7.2-4.3 8.7-1.1-3-.9-5.3 0-10.2l-9.5 3.4c5 6.9 9.9 16.7 14 33.5 14.8-2.1 30.8-3.2 47.7-3.2z"></path>

                    <image src="/assets/images/govuk-logotype-crown.png" class="govuk-header__logotype-crown-fallback-image"></image>
                </svg>
                <span class="govuk-header__logotype-text">
                    GOV.UK
                </span>
                </span>
            </a>
            </div>
            <#if realm.displayNameHtml?? || realm.displayName??>
                <div class="govuk-header__content">
                    <#if realm.displayNameHtml?? && realm.displayNameHtml != realm.displayName>
                        <#--  ${realm.displayNameHtml?no_esc}  -->
                    <#elseif realm.displayName??>
                        <a href="#" class="govuk-header__link govuk-header__link--service-name">${realm.displayName}</a>
                    </#if>
                </div>
            </#if>
        </div>
    </header>

    <div id="global-header-bar"></div>

    <#-- End GOV.UK Template header -->
    <div class="govuk-width-container">
        <main role="main" class="govuk-main-wrapper" id="main-content">
            <div class="govuk-grid-row">
                <div class="govuk-grid-column-two-thirds">
                    <h1 class="govuk-heading-xl"><#nested "title"></h1>


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
                                            <div class="govuk-error-summary" role="alert" aria-labelledby="error-summary-title" tabindex="-1" data-module="error-summary">
                                                <h2 class="govuk-error-summary__title" id="error-summary-title">
                                                    There is a problem with this form
                                                </h2>
                                                <div class="govuk-error-summary__body">
                                                    <ul class="govuk-list govuk-error-summary__list" >
                                                        <li>${message.summary}</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        <#else>
                                            <div class="${properties.kcFeedbackAreaClass!}">
                                                <div class="alert alert-${message.type}"><p>
                                                    <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                                    <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                                    <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                                    <span class="kc-feedback-text govuk-body">${message.summary}</span></p>
                                                </div>
                                            </div>
                                        </#if>
                                    </#if>
                                    <div id="kc-form" class="${properties.kcFormAreaClass!}">
                                        <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!} govuk-body">
                                            <#nested "form">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="govuk-grid-column-one-third">
                    <#if displayInfo>
                        <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                            <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        </main>
    </div>


    <#-- Start GOV.UK Template footer -->

    <footer class="govuk-footer " role="contentinfo">
        <div class="govuk-width-container ">
            <div class="govuk-footer__meta">
            <div class="govuk-footer__meta-item govuk-footer__meta-item--grow">

                <svg role="presentation" focusable="false" class="govuk-footer__licence-logo" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 483.2 195.7" height="17" width="41">
                <path fill="currentColor" d="M421.5 142.8V.1l-50.7 32.3v161.1h112.4v-50.7zm-122.3-9.6A47.12 47.12 0 0 1 221 97.8c0-26 21.1-47.1 47.1-47.1 16.7 0 31.4 8.7 39.7 21.8l42.7-27.2A97.63 97.63 0 0 0 268.1 0c-36.5 0-68.3 20.1-85.1 49.7A98 98 0 0 0 97.8 0C43.9 0 0 43.9 0 97.8s43.9 97.8 97.8 97.8c36.5 0 68.3-20.1 85.1-49.7a97.76 97.76 0 0 0 149.6 25.4l19.4 22.2h3v-87.8h-80l24.3 27.5zM97.8 145c-26 0-47.1-21.1-47.1-47.1s21.1-47.1 47.1-47.1 47.2 21 47.2 47S123.8 145 97.8 145"
                />
                </svg>
                <span class="govuk-footer__licence-description">
                All content is available under the
                <a class="govuk-footer__link" href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/" rel="license">Open Government Licence v3.0</a>, except where otherwise stated
                </span>
            </div>
            <div class="govuk-footer__meta-item">
                <a class="govuk-footer__link govuk-footer__copyright-logo" href="https://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/">© Crown copyright</a>
            </div>
            </div>
        </div>
    </footer>

    <div id="global-app-error" class="app-error hidden"></div>

    <script>if (typeof window.GOVUK === 'undefined') document.body.className = document.body.className.replace('js-enabled', '');</script>

    <#-- End GOV.UK Template footer -->

    <script src="./node_modules/govuk-frontend/all.js"></script>
    <script>window.GOVUKFrontend.initAll()</script>
    </body>

</html>
</#macro>
