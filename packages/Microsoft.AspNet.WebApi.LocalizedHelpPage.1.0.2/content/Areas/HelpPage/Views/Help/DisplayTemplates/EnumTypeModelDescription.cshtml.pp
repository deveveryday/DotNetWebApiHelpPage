@using $rootnamespace$.Areas.HelpPage.ModelDescriptions
@model EnumTypeModelDescription

<p>@HelpPageResources.Views_EnumerationValues</p>

<table class="help-page-table">
    <thead>
        <tr><th>@HelpPageResources.Views_Name</th><th>@HelpPageResources.Views_Value</th><th>@HelpPageResources.Views_Description</th></tr>
    </thead>
    <tbody>
        @foreach (EnumValueDescription value in Model.Values)
        {
            <tr>
                <td class="enum-name"><b>@value.Name</b></td>
                <td class="enum-value">
                    <p>@value.Value</p>
                </td>
                <td class="enum-description">
                    <p>@value.Documentation</p>
                </td>
            </tr>
        }
    </tbody>
</table>