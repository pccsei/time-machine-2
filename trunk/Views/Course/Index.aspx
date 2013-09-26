<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.COURSE>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="display: inline;">Index</h2> <a id="show_hide_button">show all</a>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.course_id) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.course_name) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.course_submit_day) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.course_date_created) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.course_begin_date) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.course_end_date) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.course_ref_grade) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.course_ref_hours) %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr id="tr_<%= item.course_id %>" <% if (!item.is_enabled()) { %>class="disabled_entity"<% } %>>
        <td>
            <%: Html.DisplayFor(modelItem => item.course_id) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.course_name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.course_submit_day) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.course_date_created) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.course_begin_date) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.course_end_date) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.course_ref_grade) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.course_ref_hours) %>
        </td>
        <td>
            <%: Html.ActionLink("edit", "Edit", new {  id=item.course_id }) %> |
           <%-- <%: Html.ActionLink("Details", "Details", new {  /*id=item.course_id */ }) %> |--%>
            <a class="enable_disable_link" onclick="toggle_entity_enabled('<%= item.course_id  %>', '<%= Url.Action("ToggleEnabled", "Course")  %>')">disable</a>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
