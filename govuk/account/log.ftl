<#import "template.ftl" as layout>
<@layout.mainLayout active='log' bodyClass='log'; section>

    <h1 class="govuk-heading-xl">${msg("accountLogHtmlTitle")}</h1>

    <table class="govuk-table">
        <thead class="govuk-table__head">
        <tr class="govuk-table__row">
            <th class="govuk-table__header" scope="col">${msg("date")}</th>
            <th class="govuk-table__header" scope="col">${msg("event")}</th>
            <th class="govuk-table__header" scope="col">${msg("ip")}</th>
            <th class="govuk-table__header" scope="col">${msg("client")}</th>
            <th class="govuk-table__header" scope="col">${msg("details")}</th>
        </tr>
        </thead>

        <tbody class="govuk-table__body">
        <#list log.events as event>
            <tr class="govuk-table__row">
                <td class="govuk-table__cell">${event.date?datetime}</td>
                <td class="govuk-table__cell">${event.event}</td>
                <td class="govuk-table__cell">${event.ipAddress}</td>
                <td class="govuk-table__cell">${event.client!}</td>
                <td class="govuk-table__cell">
                    <ul class="govuk-list govuk-list--bullet">
                        <#list event.details as detail>
                            <li>
                                ${detail.key} = ${detail.value} 
                            </li>
                        </#list>
                    </ul>
                </td>
            </tr>
        </#list>
        </tbody>

    </table>

</@layout.mainLayout>