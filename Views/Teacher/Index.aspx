<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.class_summary>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

        <!-- Dropdown list of all the classes to choose -->
        <div style="text-align: right;">
            <% using (Html.BeginForm("DropDown", "GetDropDownSelection")) {%>
                <%= Html.DropDownList("Course Names", new SelectList(ViewBag.ListOfCourseNames, Model), "Choose a Class to View") %> 
                <input type="hidden" value="Choose" />
            <% } %>
        </div>


<!--A list of all the students in a class -->
<table>
    <tr>
        <th>
            <%: Html.ActionLink("Student Name", "CategoryChosen", new { sortOrder = ViewBag.NameSort}) %>
        </th>
        <th>
            <%: Html.ActionLink("Total Hours", "CategoryChosen", new { sortOrder = ViewBag.HourSort}) %>
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
        <td>
            <%: Html.Encode(item.user_first_name) %>
            <%: Html.Encode(item.user_last_name) %>
        </td>
        <td>
            <%: Html.Encode(item.TotalHours) %>
        </td>
        <td>
            <%: Html.Encode(item.HoursDay) %>
        </td>
        <td>
            <%: Html.Encode(item.HoursWeek) %>
        </td>
        <td>
            <%= Html.Encode(item.HoursDay) %>
        </td>
        <td>
            <%: Html.Encode(item.ProjectedGrade) %>
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
