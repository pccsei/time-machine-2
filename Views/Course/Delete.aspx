<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.COURSE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>COURSE</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.course_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.course_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.course_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.course_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.course_submit_day) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.course_submit_day) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.course_date_created) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.course_date_created) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.course_begin_date) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.course_begin_date) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.course_end_date) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.course_end_date) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.course_is_enabled) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.course_is_enabled) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.course_ref_grade) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.course_ref_grade) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.course_ref_hours) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.course_ref_hours) %>
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
