@using $rootnamespace$.Areas.HelpPage.ModelDescriptions
@model KeyValuePairModelDescription
@HelpPageResources.Views_PairOf @Html.DisplayFor(m => Model.KeyModelDescription.ModelType, "ModelDescriptionLink", new { modelDescription = Model.KeyModelDescription }) [key]
@HelpPageResources.Views_And @Html.DisplayFor(m => Model.ValueModelDescription.ModelType, "ModelDescriptionLink", new { modelDescription = Model.ValueModelDescription }) [value]