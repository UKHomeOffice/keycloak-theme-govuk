<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
        ${msg("manageYourAccountTtitle")}
    <#elseif section = "scripts">
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
    <#elseif section = "header">
        ${msg("manageYourAccountTtitle")}
    <#elseif section = "back">
    <#if client?? && client.baseUrl?has_content>
        <a class="link-back" href="${client.baseUrl}">${msg("backToApplication")}</a>
    </#if>
    <#elseif section = "form">
        <div id="kc-info-message">
            <#if requiredActions??>
                ${msg("manageYourAccount")}
            </#if>
            <#if pageRedirectUri??>
                <p><a class="button" href="${pageRedirectUri}">${msg("backToApplication")?no_esc}</a></p>
            <#elseif actionUri??>
                <p><a id="continueButton" class="button" href="${actionUri}">${msg("proceedWithAction")?no_esc}</a></p>
            <#elseif client.baseUrl??>
                <#--
                    This is a hack to direct the users to the applications without the ability to supply the link
                    through the magic link redirect parameter.
                    TODO MSPSDS-890
                -->
                <p><a class="button" href="https://mspsds-prod.london.cloudapps.digital">Market Surveillance & Product Safety</a></p>
                <#--<p><a class="button" href="#">Cosmetics</a></p>-->


                <#--
                    This would show a link back to the `account` application - not what we're looking for when we have
                    actual application links hacked in.
                    <p><a class="button" href="${client.baseUrl}">${msg("backToApplication")?no_esc}</a></p>
                -->
                </#if>
        </div>
    </#if>
</@layout.registrationLayout>
