<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.COURSE>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        th, tr, td {
            padding:2px 10px 2px 10px;
        }

        .right-align {
            text-align: right;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Student Summary</h2>

        <!-- Dropdown list of all the classes to choose -->
        <div>
            <% using (Html.BeginForm("DropDown", "GetDropDownSelection")) { %>
            <p>Choose course:
                <%= Html.DropDownList("CourseList", (SelectList)ViewData["Courses"]) %></p>
            <% } %>
        </div>


<!--A list of all the students in a class -->
<table id="student_list">
    <tr>
        <th>
            ID
        </th>
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
    </tr>

<% foreach (var course in Model) { 
       foreach (var student in course.getStudentsForCourse()) { 
           var stats = student.getCourseStatsForStudent(course.course_id); %>
    <tr class="datarow <%: "student-" + student.user_id + " course-" + course.course_id %>">
        <td>
            <%: student.user_id %>
        </td>
        <td>
            <%--<%: Html.ActionLink(student.user_first_name + student.user_last_name, "*/TimeEntry/", 
                new {id = "student.user_id"}, null) %>--%>
            <a href ="/TimeEntry/Index/<%: student.user_id %>"><%: student.user_first_name %>
            <%: student.user_last_name %> </a>
        </td>
        <td class="right-align">
            <%: stats[0].ToString("n2") %>
        </td>
        <td class="right-align">
            <%: stats[1].ToString("n2") %>
        </td>
        <td class="right-align">
            <%: stats[2].ToString("n2") %>
        </td>
        <td class="right-align">
            <%: stats[3].ToString("n2") %>%
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
