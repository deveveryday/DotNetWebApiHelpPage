@using $rootnamespace$.Areas.HelpPage
@model InvalidSample

@if (HttpContext.Current.IsDebuggingEnabled)
{
    <div class="warning-message-container">
        <p>@Model.ErrorMessage</p>
    </div>
}
else
{
    <p>@HelpPageResources.Views_SampleNotAvailable</p>
}