<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.ENTRY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create New Entry
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create New Entry</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true, "There was an error validating your entry.") %>

    <fieldset>
        <legend>ENTRY</legend>

        <table>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.entry_project_id) %>
                </td>
                <td class="editor-field">
                    <%: Html.DropDownList("entry_project_id", "--Select Project--") %>
                    <%: Html.ValidationMessageFor(model => model.entry_project_id) %>
                </td>
            </tr>

            <tr>
                <td class="editor-label">
                    <label for="entry_begin_time">Start Time</label>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.entry_begin_time) %>
                    <%: Html.ValidationMessageFor(model => model.entry_begin_time) %>
                    <%: Html.ValidationMessage("StartError") %>
                    <%: Html.ValidationMessage("NegativeError") %>
                </td>
            </tr>

            <%: Html.HiddenFor(model => model.entry_id) %>
            <%: Html.HiddenFor(model => model.entry_user_id)%>

            <tr>
                <td class="editor-label">
                    <label for="entry_end_time">End Time</label>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.entry_end_time) %>
                    <%: Html.ValidationMessageFor(model => model.entry_end_time) %>
                    <%: Html.ValidationMessage("EndError") %>
                    <%: Html.ValidationMessage("NegativeError") %>
                </td>
            </tr>

            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.entry_location_id, "Location") %>
                </td>
                <td class="editor-field">
                    <%: Html.DropDownList("entry_location_id", "--Select Location--") %>
                    <%: Html.ValidationMessageFor(model => model.entry_location_id) %>
                </td>
            </tr>

            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.entry_category_id, "Category") %>
                </td>
                <td class="editor-field">
                    <%: Html.DropDownList("entry_category_id", "--Select Category--") %>
                    <%: Html.ValidationMessageFor(model => model.entry_category_id) %>
                </td>
            </tr>

            <tr>
                <td class="editor-label">
                    <label for="entry_work_accomplished">Work Accomplished</label>
                </td>
                <td class="editor-field">
                    <%: Html.TextAreaFor(model => model.entry_work_accomplished) %>
                    <%: Html.ValidationMessageFor(model => model.entry_work_accomplished) %>
                </td>
            </tr>

            <tr>
                <td class="editor-label">
                    <label for="entry_comment">Comment</label>
                </td>
                <td class="editor-field">
                    <%: Html.TextAreaFor(model => model.entry_comment) %>
                    <%: Html.ValidationMessageFor(model => model.entry_comment) %>
                </td>
            </tr>

            <tr>
                <td></td>
                <td><input type="submit" value="Create" /> <%: Html.ActionLink("Cancel", "Index") %></td>
            </tr>

        </table>

    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to Timelog", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
