<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.PROJECT>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>PROJECT</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.project_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.project_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.COURSE.course_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.COURSE.course_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.project_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.project_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.USER.user_first_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.USER.user_first_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.project_date_created) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.project_date_created) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.project_description) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.project_description) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.project_begin_date) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.project_begin_date) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.project_end_date) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.project_end_date) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.project_is_enabled) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.project_is_enabled) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
