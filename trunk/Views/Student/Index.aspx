<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.COURSE>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Student List</h2>

        <!-- Dropdown list of all the classes to choose -->
    <form  method="post" action="<%: Url.Action("Create", "Student") %>">
        <p>Choose course: <%= Html.DropDownList("CourseList", (SelectList)ViewData["Courses"]) %></p>
        <table class="inlineForm">
            <tr>
                <td><input type="text" name="user_id" id="user_id" placeholder="User ID"/></td>
                <td><input type="text" name="user_first_name" id="user_first_name" placeholder="First Name"/></td>
                <td><input type="text" name="user_last_name" id="user_last_name" placeholder="Last Name"/></td>
            </tr>
        </table>
        <input class="button" id="ajaxAddMember" type="submit" value="Add Student" />
    </form>

    <section class="content">

        <!--A list of all the students in a class -->
        <table id ="memberTable" class="zebra hasHeader large tablesorter">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student Name</th>
                    <th>Total Hours</th>
                    <th>Daily Hours</th>
                    <th>Weekly Hours</th>
                    <th>Projected Grade</th>
                </tr>
            </thead>
            <tbody>
        <% foreach (var course in Model) { 
            foreach (var student in course.getStudentsForCourse()) { 
                var stats = student.getCourseStatsForStudent(course.course_id); %>
                <tr class="datarow <%: "student-" + student.user_id + " course-" + course.course_id %>">
                    <td><%: student.user_id %></td>
                    <td><a href="<%: Url.Action("Summary", "Student") + "/" + student.user_id %>"><%: student.user_last_name %>, <%: student.user_first_name %></a></td>
                    <td><%: stats[0].ToString("n2") %></td>
                    <td><%: stats[1].ToString("n2") %></td>
                    <td><%: stats[2].ToString("n2") %></td>
                    <td><%: stats[3] >= 110.0f ? stats[3].ToString("n0") + "% +" : stats[3].ToString("n1") + "%" %></td>
                </tr>
            <% } } %>
            </tbody>

        </table>
    </section>


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
