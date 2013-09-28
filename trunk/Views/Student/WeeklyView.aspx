<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.COURSE>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
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
<table>
    <tr>
        <th>
            ID
        </th>
        <th>
            Student Name
        </th>
        <% for (var i = 0; i < 4; i++)
           {%>
             <th>
            Week <%: (i+1).ToString() %>
        </th>          
           <%}%>
    </tr>

<% foreach (var course in Model) { 
       foreach (var student in course.getStudentsForCourse()) { 
           var stats = student.getCourseStatsForStudent(course.course_id); %>
    <tr class="datarow <%: "student-" + student.user_id + " course-" + course.course_id %>">
        <td>
            <%: student.user_id %>
        </td>
        <td>
            <a href ="/TimeEntry/Index/<%: student.user_id %>"><%: student.user_last_name %>, <%: student.user_first_name %></a>
        </td>
        <td>
            <%: stats[2].ToString("n2") %>
        </td>
    </tr>
<% } } %>


</table>

(DateTime.Now - course.course_begin_date).Days
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