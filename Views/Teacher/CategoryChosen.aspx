<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.class_summary>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CategoryChosen
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>CategoryChosen</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
    <%: Html.ActionLink("Index", "Index") %>
</p>
<table>
    <tr>
        <%--<th>
            <%: Html.DisplayNameFor(model => model.course_id) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.user_id) %>
        </th>--%>
        <th>
            Student Name
        </th>
        <th>
            Total Hours
        </th>
        <th>
            Daily Hours
        </th>
        <th>
            Weekly Hours
        </th>
        <th>
            Projected Grade
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <%--<td>
            <%: Html.HiddenFor(modelItem => item.course_id) %>
        </td>
        <td>
            <%: Html.HiddenFor(modelItem => item.user_id) %>
        </td>--%>
        <td>
            <%: Html.DisplayFor(modelItem => item.user_first_name) %>
            <%: Html.DisplayFor(modelItem => item.user_last_name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TotalHours) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.HoursDay) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.HoursWeek) %>
        </td>
        <td>
            <%--<%: Html.DisplayFor(modelItem => string.Format("{0:0.00}", item.ProjectedGrade)) %>--%>
        </td>
        <%--<td>
            <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>--%>
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
