@using System.Web.Http
@using System.Web.Http.Description
@using $rootnamespace$.Areas.HelpPage.Models
@using $rootnamespace$.Areas.HelpPage.ModelDescriptions
@model HelpPageApiModel

@{
    ApiDescription description = Model.ApiDescription;
}
<h1>@description.HttpMethod.Method @description.RelativePath</h1>
<div>
    <p>@description.Documentation</p>

    <h2>@HelpPageResources.Views_RequestInformation</h2>

    <h3>@HelpPageResources.Views_URIParameters</h3>
    @Html.DisplayFor(m => m.UriParameters, "Parameters")

    <h3>@HelpPageResources.Views_BodyParameters</h3>

    <p>@Model.RequestDocumentation</p>

    @if (Model.RequestModelDescription != null)
    {
        @Html.DisplayFor(m => m.RequestModelDescription.ModelType, "ModelDescriptionLink", new { modelDescription = Model.RequestModelDescription })
        if (Model.RequestBodyParameters != null)
        {
            @Html.DisplayFor(m => m.RequestBodyParameters, "Parameters")
        }
    }
    else
    {
        <p>@HelpPageResources.Views_None</p>
    }

    @if (Model.SampleRequests.Count > 0)
    {
        <h3>@HelpPageResources.Views_RequestFormats</h3>
        @Html.DisplayFor(m => m.SampleRequests, "Samples")
    }

    <h2>@HelpPageResources.Views_ResponseInformation</h2>

    <h3>@HelpPageResources.Views_ResourceDescription</h3>

    <p>@description.ResponseDescription.Documentation</p>

    @if (Model.ResourceDescription != null)
    {
        @Html.DisplayFor(m => m.ResourceDescription.ModelType, "ModelDescriptionLink", new { modelDescription = Model.ResourceDescription })
        if (Model.ResourceProperties != null)
        {
            @Html.DisplayFor(m => m.ResourceProperties, "Parameters")
        }
    }
    else
    {
        <p>@HelpPageResources.Views_None</p>
    }

    @if (Model.SampleResponses.Count > 0)
    {
        <h3>@HelpPageResources.Views_ResponseFormats</h3>
        @Html.DisplayFor(m => m.SampleResponses, "Samples")
    }

</div>