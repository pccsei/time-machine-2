<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.ENTRY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>ENTRY</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.entry_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.entry_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.entry_begin_time) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.entry_begin_time) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.entry_end_time) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.entry_end_time) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.entry_total_time) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.entry_total_time) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.entry_work_accomplished) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.entry_work_accomplished) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.entry_comment) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.entry_comment) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.USER.user_first_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.USER.user_first_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.PROJECT.project_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.PROJECT.project_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.LOCATION.location_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.LOCATION.location_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.CATEGORY.category_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CATEGORY.category_name) %>
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

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
