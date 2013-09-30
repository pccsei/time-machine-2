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
        <table>
            <%--<tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.project_id) %>
                </td>
                <td class="editor-field">--%>
                    <%: Html.HiddenFor(model => model.project_id) %>
                    <%: Html.ValidationMessageFor(model => model.project_id) %>
                <%--</td>
            </tr>--%>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.project_course_id, "Course") %>
                </td>
                <td class="editor-field">
                    <%: Html.DropDownList("project_course_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.project_course_id) %>
                </td>
            </tr>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.project_name) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.project_name) %>
                    <%: Html.ValidationMessageFor(model => model.project_name) %>
                </td>
            </tr>
            <%--<tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.project_created_by, "USER") %>
                </td>
                <td class="editor-field">--%>
                    <%: Html.HiddenFor(model => model.project_created_by) %>
                    <%: Html.ValidationMessageFor(model => model.project_created_by) %>
                <%--</td>
            </tr>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.project_date_created) %>
                </td>
                <td class="editor-field">--%>
                    <%: Html.HiddenFor(model => model.project_date_created) %>
                    <%: Html.ValidationMessageFor(model => model.project_date_created) %>
                <%--</td>
            </tr>--%>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.project_description) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.project_description) %>
                    <%: Html.ValidationMessageFor(model => model.project_description) %>
                </td>
            </tr>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.project_begin_date) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.project_begin_date) %>
                    <%: Html.ValidationMessageFor(model => model.project_begin_date) %>
                </td>
            </tr>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.project_end_date) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.project_end_date) %>
                    <%: Html.ValidationMessageFor(model => model.project_end_date) %>
                </td>
            </tr>
            <%--<tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.project_is_enabled) %>
                </td>
                <td class="editor-field">--%>
                    <%: Html.HiddenFor(model => model.project_is_enabled) %>
                    <%: Html.ValidationMessageFor(model => model.project_is_enabled) %>
                <%--</td>
            </tr>--%>
            <tr>
                <td></td>
                <td><input type="submit" value="Save" /> <%: Html.ActionLink("Cancel", "Index") %></td>
            </tr>
        </table>
    </fieldset>
<% } %>

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
