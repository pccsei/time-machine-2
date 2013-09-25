<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.COURSE>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

        <!-- Dropdown list of all the classes to choose -->
        <div>
            <% using (Html.BeginForm("DropDown", "GetDropDownSelection")) { %>
            <p>Choose course:
                <%= Html.DropDownList("CourseList", (SelectList)ViewData["Courses"]) %></p>
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
    </tr>

<% foreach (var course in Model) { 
       foreach (var student in course.getStudentsForCourse()) { 
           var stats = student.getCourseStatsForStudent(course.course_id); %>
    <tr class="datarow <%: "student-" + student.user_id + " course-" + course.course_id %>">
        <td>
            <%: student.user_first_name %>
            <%: student.user_last_name %>
        </td>
        <td>
            <%: stats[0] %>
        </td>
        <td>
            <%: stats[1] %>
        </td>
        <td>
            <%: stats[2] %>
        </td>
        <td>
            <%: stats[3] %>
        </td>
        <%--<td>
            <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>--%>
    </tr>
<% } } %>

</table>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script type="text/javascript">

        $('tr.datarow').hide();
        $('tr.course-' + $('#CourseList').val()).show();

        $('#CourseList').change(function () {
            $('tr.datarow').hide();
            $('tr.course-' + $('#CourseList').val()).show();
        });
    </script>
</asp:Content>
