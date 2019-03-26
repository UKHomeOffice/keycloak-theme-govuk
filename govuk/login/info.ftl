<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "scripts">
        <#--
            This will only run on the page that tries to display required actions.
            That page is pointless from UX POV, so we skip it where possible.
            Keycloak doesn't provide a native way to skip it, hence the js hack.
        -->
        <#if requiredActions?? && actionUri??>
            <script type="application/javascript">
                document.location.href = "${actionUri?no_esc}"
            </script>
        </#if>
    <#elseif section = "title" || section = "header">
        ${msg(message.summary)}
    <#elseif section = "form">
        <div id="kc-info-message">
            <#if requiredActions??>
                ${msg("manageYourAccount")}
            </#if>

            <#--
                 The hard-coded link below is a hack to direct the users to the applications without the ability to
                 supply the link through the magic-link's redirect parameter.
                 Keycloak does pass in a `pageRedirectUri` parameter to this if it's provided in the request,
                 which could be helfpul for future work in this area.
                 It also provides client.baseUrl, though the client defaults ot the `account` one.
                 TODO MSPSDS-890
             -->
            <#if actionUri??>
                <p><a id="continueButton" class="govuk-button" role="button" href="${actionUri}">${msg("proceedWithAction")?no_esc}</a></p>
            <#else>
                <p><a class="govuk-link" href="https://www.product-safety-database.service.gov.uk">Product safety database</a></p>
                <#--<p><a class="button" href="#">Cosmetics</a></p>-->
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
