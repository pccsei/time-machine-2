<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.ENTRY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>ENTRY</legend>
        <%: Html.HiddenFor(model => model.entry_id) %>
        <%: Html.HiddenFor(model => model.entry_user_id) %>
        <table>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.entry_project_id) %>
                </td>
                <td class="editor-field">
                    <%: Html.DropDownList("entry_project_id") %>
                    <%: Html.ValidationMessageFor(model => model.entry_project_id) %>
                    <script type="text/javascript">$("#entry_project_id").focus();</script>
                </td>
            </tr>

            <tr>
                <td class="editor-label">
                    <label for="timespan">Timespan</label>
                </td>
                <td class="editor-field">
                    <input id="timespan" name="timespan" type="text" /><br />
                    <%: Html.ValidationMessageFor(model => model.entry_begin_time) %>
                    <%: Html.ValidationMessage("NegativeTimeError") %>
                    <%: Html.ValidationMessage("NoTimeError") %>
                    <%: Html.ValidationMessage("TimeBoundaryError") %>
                </td>
            </tr>

            <tr>
                <td class="editor-label"><label for="begin_time">Begin Time</label></td>
                <td class="editor-field">
                    <%: Html.TextBox("begin_time", "Waiting...", new {@disabled = "disabled", @readonly = "readonly", @class="begin_time" }) %>
                    <%: Html.HiddenFor(model => model.entry_begin_time, new {@readonly = "readonly", @class="begin_time" }) %>
                </td>
            </tr>

            <tr>
                <td class="editor-label"><label for="end_time">End Time</label></td>
                <td class="editor-field">
                    <%: Html.TextBox("end_time", "Waiting...", new {@disabled = "disabled", @readonly = "readonly", @class="end_time" }) %>
                    <%: Html.HiddenFor(model => model.entry_end_time, new {@readonly = "readonly", @class="end_time" }) %>
                </td>
            </tr>

            <tr>
                <td class="editor-label"><label for="entry_end_time">Total Hours</label></td>
                <td class="editor-field">
                    <%: Html.TextBox("total_hours", "Waiting...", new { disabled = "disabled", @readonly = "readonly" }) %>
                </td>
            </tr>

<%--            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.entry_begin_time) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.entry_begin_time) %>
                </td>
            </tr>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.entry_end_time) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.entry_end_time) %>
                    <%: Html.ValidationMessageFor(model => model.entry_begin_time) %>
                    <%: Html.ValidationMessageFor(model => model.entry_end_time) %>
                    <%: Html.ValidationMessage("NegativeTimeError") %>
                    <%: Html.ValidationMessage("NoTimeError") %>
                    <%: Html.ValidationMessage("TimeBoundaryError") %>
                    <%: Html.ValidationMessage("EndError") %>
                </td>
            </tr>--%>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.entry_location_id, "Location") %>
                </td>
                <td class="editor-field">
                    <%: Html.DropDownList("entry_location_id") %>
                    <%: Html.ValidationMessageFor(model => model.entry_location_id) %>
                </td>
            </tr>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.entry_category_id, "Category") %>
                </td>
                <td class="editor-field">
                    <%: Html.DropDownList("entry_category_id") %>
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
                <td><input type="submit" value="Save" /> <%: Html.ActionLink("Cancel", "Details", new { id = Model.entry_id }) %></td>
            </tr>
        </table>

    </fieldset>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/Scripts/sugar.min.js") %>
    <%: Scripts.Render("~/Scripts/timespan-min.js") %>
    <script type="text/javascript">populate_edit_fields();</script>
</asp:Content>
