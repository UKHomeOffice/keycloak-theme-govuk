<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "form">
        <#if realm.password>
            <#assign poiseLoginUrl = "">
            <#if social.providers??>
                <#list social.providers as p>
                    <#if p.alias?lower_case?contains("poise")>
                        <#assign poiseLoginUrl = p.loginUrl>
                    </#if>
                </#list>
            </#if>

            <#assign showNonPoise = login.username?has_content>
            
            <div class="${properties.kcFormGroupClass!}">
                <fieldset>
                    <legend class="${properties.kcLabelClass!}">
                        ${msg("poiseUserQuestion")}
                    </legend>
                    <div class="multiple-choice">
                        <input id="poise-yes" name="poise-user" type="radio" value="yes" <#if !showNonPoise>checked</#if>>
                        <label for="poise-yes">${msg("poiseYes")}</label>
                    </div>
                    <div class="multiple-choice">
                        <input id="poise-no" name="poise-user" type="radio" value="no" <#if showNonPoise>checked</#if>>
                        <label for="poise-no">${msg("poiseNo")}</label>
                    </div>
                </fieldset>
            </div>

            <div id="poise-login-section" style="display: <#if showNonPoise>none<#else>block</#if>;">
                <#if poiseLoginUrl?has_content>
                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} ${properties.kcFormGroupClass}">
                        <a href="${poiseLoginUrl}" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" id="poise-sign-in">${msg("doLogIn")}</a>
                    </div>
                <#else>
                    <#if social.providers??>
                        <div id="kc-social-providers">
                            <#list social.providers as p>
                                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} ${properties.kcFormGroupClass}">
                                    <a href="${p.loginUrl}" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}">${msg("doLogIn")}</a>
                                </div>
                            </#list>
                        </div>
                    </#if>
                </#if>
            </div>

            <div id="non-poise-login-section" style="display: <#if showNonPoise>block<#else>none</#if>;">
                <form id="kc-form-login" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="username" class="${properties.kcLabelClass!}">${msg("email")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <#if usernameEditDisabled??>
                                <input id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                            <#else>
                                <input id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autocomplete="off" />
                            </#if>
                        </div>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                        </div>
                    </div>

                    <div class="${properties.kcFormOptionsWrapperClass!} ${properties.kcFormGroupClass}">
                        <#if realm.resetPasswordAllowed>
                            <p><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></p>
                        </#if>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} ${properties.kcFormGroupClass}">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                    </div>
                </form>
            </div>

            <script>
                (function() {
                    var poiseYes = document.getElementById('poise-yes');
                    var poiseNo = document.getElementById('poise-no');
                    var poiseSection = document.getElementById('poise-login-section');
                    var nonPoiseSection = document.getElementById('non-poise-login-section');
                    var usernameInput = document.getElementById('username');

                    function toggleSections() {
                        if (poiseYes.checked) {
                            poiseSection.style.display = 'block';
                            nonPoiseSection.style.display = 'none';
                        } else {
                            poiseSection.style.display = 'none';
                            nonPoiseSection.style.display = 'block';
                            if (usernameInput) {
                                usernameInput.focus();
                            }
                        }
                    }

                    poiseYes.addEventListener('change', toggleSections);
                    poiseNo.addEventListener('change', toggleSections);
                    toggleSections();
                })();
            </script>
        </#if>
    <#elseif section = "info" >
    </#if>
</@layout.registrationLayout>
