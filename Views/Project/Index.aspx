<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.PROJECT>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
<%--        <th>
            <%: Html.DisplayNameFor(model => model.project_id) %>
        </th>--%>
        <th>
            <%: Html.DisplayNameFor(model => model.project_name) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.COURSE.course_name) %>
        </th>
<%--        <th>
            <%: Html.DisplayNameFor(model => model.USER.user_first_name) %>
        </th>--%>
        <th>
            <%: Html.DisplayNameFor(model => model.project_date_created) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.project_description) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.project_begin_date) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.project_end_date) %>
        </th>
        <%--<th>
            <%: Html.DisplayNameFor(model => model.project_is_enabled) %>
        </th>--%>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <%--<td>
            <%: Html.DisplayFor(modelItem => item.project_id) %>
        </td>--%>
        <td>
            <%: Html.DisplayFor(modelItem => item.project_name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.COURSE.course_name) %>
        </td>
        <%--<td>
            <%: Html.DisplayFor(modelItem => item.USER.user_first_name) %>
        </td>--%>
        <td>
            <%: Html.DisplayFor(modelItem => item.project_date_created) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.project_description) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.project_begin_date) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.project_end_date) %>
        </td>
        <%--<td>
            <%: Html.DisplayFor(modelItem => item.project_is_enabled) %>
        </td>--%>
        <td>
            <%: Html.ActionLink("edit", "edit", new { /* id=item.PrimaryKey */ }) %> |
            <a class="enable_disable_link" onclick="toggle_project_status('<%= item.project_id  %>')">disable</a>
            <%--<%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |--%>
            <%--<%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>--%>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
