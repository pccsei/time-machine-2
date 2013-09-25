<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.ENTRY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>ENTRY</legend>

<%--        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_id) %>
            <%: Html.ValidationMessageFor(model => model.entry_id) %>
        </div>--%>

        <div class="editor-label">
            Project
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("entry_project_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.entry_project_id) %>
        </div>

        <div class="editor-label">
            Start Time
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_begin_time) %>
            <%: Html.ValidationMessageFor(model => model.entry_begin_time) %>
        </div>

        <div class="editor-label">
            End Time
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_end_time) %>
            <%: Html.ValidationMessageFor(model => model.entry_end_time) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_location_id, "Location") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("entry_location_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.entry_location_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_category_id, "Category") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("entry_category_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.entry_category_id) %>
        </div>

        <div class="editor-label">
            Work Accomplished
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_work_accomplished) %>
            <%: Html.ValidationMessageFor(model => model.entry_work_accomplished) %>
        </div>

        <div class="editor-label">
            Comment
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_comment) %>
            <%: Html.ValidationMessageFor(model => model.entry_comment) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
