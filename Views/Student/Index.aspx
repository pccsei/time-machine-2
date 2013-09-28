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

    <form id="form1" action="Create" runat="server">
            <table>
                <tr>
                    <td><input type="text" name="user_id"   id="user_id" placeholder="User ID"/></td>
                    <td><input type="text" name="user_first_name" id="user_first_name" placeholder="First Name"/></td>
                    <td><input type="text" name="user_last_name" id="user_last_name" placeholder="Last Name"/></td>
                </tr>
            </table>

    <input type="submit" value="Add" style="height: 33px" />
    </form>


<!--A list of all the students in a class -->
<table class="zebra">
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
            <a href ="/TimeEntry/Index/<%: student.user_id %>"><%: student.user_last_name %>, <%: student.user_first_name %></a>
        </td>
        <td class="centered">
            <%: stats[0].ToString("n2") %>
        </td>
        <td class="centered">
            <%: stats[1].ToString("n2") %>
        </td>
        <td class="centered">
            <%: stats[2].ToString("n2") %>
        </td>
        <td class="centered">
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
<asp:Content ID="Content6" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        #user_id {
            width: 66px;
        }
        #user_first_name {
            width: 150px;
        }
        #user_last_name {
            width: 150px;
        }
    </style>
</asp:Content>

