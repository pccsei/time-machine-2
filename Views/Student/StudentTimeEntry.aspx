<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.ENTRY>" %>
<asp:content ID="cHead" runat="server" ContentPlaceHolderID="cphHead">
    
</asp:content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    StudentTimeEntry
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">

        <% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>ENTRY</legend>

         <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_project_id) %>
        </div>
        <div class="editor-field">
            <%= Html.DropDownList("project_id", (SelectList) ViewBag.project_id, "--Select One--") %>
            <%: Html.ValidationMessageFor(model => model.entry_project_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_begin_time) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_begin_time) %>
            <%: Html.ValidationMessageFor(model => model.entry_begin_time) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_end_time) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_end_time) %>
            <%: Html.ValidationMessageFor(model => model.entry_end_time) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_location_id) %>
        </div>
        <div class="editor-field">
            <%= Html.DropDownList("location_id", (SelectList) ViewBag.location_id, "--Select One--") %>
            <%: Html.ValidationMessageFor(model => model.entry_location_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_category_id) %>
        </div>
        <div class="editor-field">
            <%= Html.DropDownList("category_id", (SelectList) ViewBag.category_id, "--Select One--") %>
            <%: Html.ValidationMessageFor(model => model.entry_category_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_work_accomplished) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_work_accomplished)  %>
            <%: Html.ValidationMessageFor(model => model.entry_work_accomplished) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.entry_comment) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.entry_comment) %>
            <%: Html.ValidationMessageFor(model => model.entry_comment) %>
        </div>

        <p>
            <input type="submit" value="Create" name="Add Entry" />
        </p>
    </fieldset>
<% } %>




    </form>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
