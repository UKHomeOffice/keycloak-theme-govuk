<#import "template.ftl" as layout>
<@layout.mainLayout active='log' bodyClass='log'; section>

    <div class="row">
        <div class="col-md-10">
            <h2 class="heading-large">${msg("accountLogHtmlTitle")}</h2>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>${msg("date")}</th>
            <th>${msg("event")}</th>
            <th>${msg("ip")}</th>
            <th>${msg("client")}</th>
            <th>${msg("details")}</th>
        </tr>
        </thead>

        <tbody>
        <#list log.events as event>
            <tr>
                <td>${event.date?datetime}</td>
                <td>${event.event}</td>
                <td>${event.ipAddress}</td>
                <td>${event.client!}</td>
                <td>
                    <ul>
                        <#list event.details as detail>
                            <li class="list-bullet">
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