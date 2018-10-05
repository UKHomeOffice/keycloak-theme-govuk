<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

    <h1 class="govuk-heading-xl">${msg("editAccountHtmlTitle")}</h1>

    <div class="govuk-grid-row">
        <div class="govuk-grid-column-two-thirds">
            <form action="${url.accountUrl}" class="${properties.kcFormClass!}" method="post">
                <span class="govuk-hint"><span class="required">*</span> ${msg("requiredFields")}</span>
                <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                    <#if !realm.registrationEmailAsUsername>
                        <div class="govuk-form-group ${messagesPerField.printIfExists('username','govuk-form-group--error')}">
                            <label for="username" class="govuk-label">${msg("username")}</label> <#if realm.editUsernameAllowed><span class="required">*</span></#if>
                            <input type="text" class="govuk-input" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
                        </div>
                    </#if>
                <div class="govuk-form-group ${messagesPerField.printIfExists('email','govuk-form-group--error')}">
                    <label for="email" class="govuk-label">${msg("email")} *</label>
                    <input type="text" class="govuk-input" id="email" name="email" autofocus value="${(account.email!'')}"/>
                </div>

                <div class="govuk-form-group ${messagesPerField.printIfExists('firstName','govuk-form-group--error')}">
                    <label for="firstName" class="govuk-label">${msg("firstName")} *</label>
                    <input type="text" class="govuk-input" id="firstName" name="firstName" value="${(account.firstName!'')}"/>
                </div>

                <div class="govuk-form-group ${messagesPerField.printIfExists('lastName','govuk-form-group--error')}">
                    <label for="lastName" class="govuk-label">${msg("lastName")} *</label>
                    <input type="text" class="govuk-input" id="lastName" name="lastName" value="${(account.lastName!'')}"/>
                </div>

                <div class="govuk-form-group">
                    <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                    <button type="submit" class="govuk-button" name="submitAction" value="Save">${msg("doSave")}</button>
                    <button type="submit" class="govuk-button" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                </div>
            </form>
        </div>
    </div>

</@layout.mainLayout>