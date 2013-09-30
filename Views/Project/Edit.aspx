<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.PROJECT>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>PROJECT</legend>

<%--        <div class="editor-label">
            <%: Html.LabelFor(model => model.project_id) %>
        </div>--%>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.project_id) %>
            <%: Html.ValidationMessageFor(model => model.project_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.project_course_id, "COURSE") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("project_course_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.project_course_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.project_name) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.project_name) %>
            <%: Html.ValidationMessageFor(model => model.project_name) %>
        </div>

<%--        <div class="editor-label">
            <%: Html.LabelFor(model => model.project_created_by, "USER") %>
        </div>--%>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.project_created_by) %>
            <%: Html.ValidationMessageFor(model => model.project_created_by) %>
        </div>

<%--        <div class="editor-label">
            <%: Html.LabelFor(model => model.project_date_created) %>
        </div>--%>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.project_date_created) %>
            <%: Html.ValidationMessageFor(model => model.project_date_created) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.project_description) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.project_description) %>
            <%: Html.ValidationMessageFor(model => model.project_description) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.project_begin_date) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.project_begin_date) %>
            <%: Html.ValidationMessageFor(model => model.project_begin_date) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.project_end_date) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.project_end_date) %>
            <%: Html.ValidationMessageFor(model => model.project_end_date) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.project_is_enabled) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.project_is_enabled) %>
            <%: Html.ValidationMessageFor(model => model.project_is_enabled) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
