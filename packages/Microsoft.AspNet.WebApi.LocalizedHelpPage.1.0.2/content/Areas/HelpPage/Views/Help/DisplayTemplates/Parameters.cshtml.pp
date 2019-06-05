@using System.Collections.Generic
@using System.Collections.ObjectModel
@using System.Web.Http.Description
@using System.Threading
@using $rootnamespace$.Areas.HelpPage.ModelDescriptions
@model IList<ParameterDescription>

@if (Model.Count > 0)
{
    <table class="help-page-table">
        <thead>
            <tr><th>@HelpPageResources.Views_Name</th><th>@HelpPageResources.Views_Description</th><th>@HelpPageResources.Views_Type</th><th>@HelpPageResources.Views_AdditionalInformation</th></tr>
        </thead>
        <tbody>
            @foreach (ParameterDescription parameter in Model)
            {
                ModelDescription modelDescription = parameter.TypeDescription;
                <tr>
                    <td class="parameter-name">@parameter.Name</td>
                    <td class="parameter-documentation">
                        <p>@parameter.Documentation</p>
                    </td>
                    <td class="parameter-type">
                        @Html.DisplayFor(m => modelDescription.ModelType, "ModelDescriptionLink", new { modelDescription = modelDescription })
                    </td>
                    <td class="parameter-annotations">
                        @if (parameter.Annotations.Count > 0)
                        {
                            foreach (var annotation in parameter.Annotations)
                            {
                                <p>@annotation.Documentation</p>
                            }
                        }
                        else
                        {
                            <p>@HelpPageResources.Views_None</p>
                        }
                    </td>
                </tr>
            }
        </tbody>
    </table>
}
else
{
    <p>@HelpPageResources.Views_None</p>
}

