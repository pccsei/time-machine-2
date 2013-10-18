<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.COURSE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>COURSE</legend>

        <table>
            <%--<tr>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.course_id) %>
                    <%: Html.ValidationMessageFor(model => model.course_id) %>
                </td>
            </tr>--%>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.course_name) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.course_name) %>
                    <%: Html.ValidationMessageFor(model => model.course_name) %>
                </td>
            </tr>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.course_submit_day) %>
                </td>
                <td class="editor-field">
                    <% string[] dayofweek = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}; %>
                    <%: Html.DropDownListFor(model => model.course_submit_day, dayofweek.Select((day, index) => new SelectListItem{Text = day, Value = index.ToString()}) ) %>
                    <%--<select id="course_submit_day" name="course_submit_day">
                        <option value="0">Sunday</option>
                        <option value="1">Monday</option>
                        <option value="2">Tuesday</option>
                        <option value="3">Wednesday</option>
                        <option value="4">Thursday</option>
                        <option value="5">Friday</option>
                        <option value="6">Saturday</option>
                   </select>--%>
                    <%--<%: Html.EditorFor(model => model.course_submit_day) %>
                    <%: Html.ValidationMessageFor(model => model.course_submit_day) %>--%>
                </td>
            </tr>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.course_begin_date) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.course_begin_date) %>
                    <%: Html.ValidationMessageFor(model => model.course_begin_date) %>
                </td>
            </tr>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.course_end_date) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.course_end_date) %>
                    <%: Html.ValidationMessageFor(model => model.course_end_date) %>
                </td>
            </tr>
            <%--<tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.course_is_enabled) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.course_is_enabled) %>
                    <%: Html.ValidationMessageFor(model => model.course_is_enabled) %>
                </td>
            </tr>--%>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.course_ref_grade) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.course_ref_grade) %>
                    <%: Html.ValidationMessageFor(model => model.course_ref_grade) %>
                </td>
            </tr>
            <tr>
                <td class="editor-label">
                    <%: Html.LabelFor(model => model.course_ref_hours) %>
                </td>
                <td class="editor-field">
                    <%: Html.EditorFor(model => model.course_ref_hours) %>
                    <%: Html.ValidationMessageFor(model => model.course_ref_hours) %>
                </td>
            </tr>
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

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
