<#import "template.ftl" as layout>
<@layout.mainLayout active='totp' bodyClass='totp'; section>
    <div class="govuk-grid-row">
            <div class="govuk-grid-column-two-thirds">
    <#if totp.enabled>
    <h1 class="govuk-heading-xl">${msg("authenticatorTitle")}</h1>

        <table class="govuk-table">
        <thead class="govuk-table__head">
            <tr class="govuk-table__row">
                <th colspan="2" class="govuk-table__header" scope="col">${msg("configureAuthenticators")}</th>
                </tr>
            </thead>
        <tbody class="govuk-table__body">
            <tr class="govuk-table__row">
                <td class="provider govuk-table__cell">${msg("mobile")}</td>
                <td class="action govuk-table__cell">
                    <form action="${url.totpUrl}" method="post" class="form-inline">
                        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                        <input type="hidden" id="submitAction" name="submitAction" value="Delete">
                        <button id="remove-mobile" class="btn btn-default"><i class="pficon pficon-delete"></i></button>
                    </form>
                    </td>
                </tr>
            </tbody>
        </table>
    <#else>
    <h1 class="govuk-heading-xl">${msg("authenticatorTitle")}</h1>

    <hr/>

    <div>
        <div class="govuk-body">
            <p>${msg("totpStep1")}</p>

            <ul>
                <#list totp.policy.supportedApplications as app>
                <li class="list-bullet">${app}</li>
                </#list>
            </ul>
        </div>

    <#if mode?? && mode = "manual">
        <div class="govuk-body">
            <p>${msg("totpManualStep2")}</p>
            <p><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
            <p><a href="${totp.qrUrl}" id="mode-barcode">${msg("totpScanBarcode")}</a></p>
        </div>
        <div class="govuk-body">
            <p>${msg("totpManualStep3")}</p>
            <ul>
                <li id="kc-totp-type">${msg("totpType")}: ${msg("totp." + totp.policy.type)}</li>
                <li id="kc-totp-algorithm">${msg("totpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                <li id="kc-totp-digits">${msg("totpDigits")}: ${totp.policy.digits}</li>
                <#if totp.policy.type = "totp">
                    <li id="kc-totp-period">${msg("totpInterval")}: ${totp.policy.period}</li>
                <#elseif totp.policy.type = "hotp">
                    <li id="kc-totp-counter">${msg("totpCounter")}: ${totp.policy.initialCounter}</li>
                </#if>
            </ul>
        </div>
    <#else>
        <div class="govuk-body">
            <p>${msg("totpStep2")}</p>
            <p><img src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"></p>
            <p><a href="${totp.manualUrl}" id="mode-manual">${msg("totpUnableToScan")}</a></p>
        </div>
    </#if>
    <div class="govuk-body">
        <p>${msg("totpStep3")}</p>
    </div>
    </div>

    <hr/>

    <form action="${url.totpUrl}" class="form-horizontal" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <div class="govuk-form-group">
            <label for="totp" class="govuk-label">${msg("authenticatorCode")}</label>
            <input type="text" class="govuk-input" id="totp" name="totp" autocomplete="off" autofocus autocomplete="off">
            <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
        </div>

        <div class="govuk-form-group">
            <button type="submit" class="govuk-button" name="submitAction" value="Save">${msg("doSave")}</button>
            <button type="submit" class="govuk-button" name="submitAction" value="Cancel">${msg("doCancel")}</button>
        </div>
    </form>
    </#if>

    </div>
    </div>

</@layout.mainLayout>