<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.COURSE>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Students' Weekly Hours</h2>

    <!-- Dropdown list of all the classes to choose -->
    <div>
        <% using (Html.BeginForm("DropDown", "GetDropDownSelection")) { %>
        <p>Choose course:
            <%= Html.DropDownList("CourseList", (SelectList)ViewData["Courses"]) %></p>
        <% } %>
    </div>

<% foreach (var course in Model) { %>
    <!--A list of all the students in a class -->
    <table class="zebra hasHeader course-<%: course.course_id %>">
        <tr>
            <th>ID</th>
            <th>Student Name</th>
        <% for (int w = course.getCurrentWeek(); w > 0; w--)
               { %>
            <th>Week <%: (w).ToString() %></th>          
        <% } %>
        </tr>
    <% foreach (var student in course.getStudentsForCourse()) { 
        List<float> weeks = student.getWeeklyHoursForCourse(course.course_id); %>
        <tr class="datarow <%: "student-" + student.user_id %>">
            <td><%: student.user_id %></td>
            <td><a href="<%: Url.Action("Summary", "Student") + "/" + student.user_id %>"><%: student.user_last_name %>, <%: student.user_first_name %></a></td>
        <% for (int w = weeks.Count - 1; w >= 0; w--) { %>
            <td <% if (weeks[w] < 5.0f) { %> class="warning_value" <% } %>><%: weeks[w].ToString("n2") %></td>
        <% } %>
            </tr>
    <% } %>
    </table>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script type="text/javascript">

        $('table.course_data').hide();
        $('table.course-' + $('#CourseList').val()).show();

        $('#CourseList').change(function () {
            $('table.course_data').hide();
            $('table.course-' + $('#CourseList').val()).show();
        });
    </script>
</asp:Content>