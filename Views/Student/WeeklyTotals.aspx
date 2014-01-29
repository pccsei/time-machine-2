<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.COURSE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Students' Weekly Hours</h2>

    <!--A list of all the students in a class -->
    <div class="table-holder">
    <table class="zebra hasHeader course-<%: Model.course_id %> tablesorter" style="width:auto">
        <thead>
            <tr>
                <th>ID</th>
                <th>Student Name</th>
                <th>Total</th>
            <% for (int w = Model.getLatestWeek(); w > 0; w--)
                   { %>
                <th>W<%: (w).ToString() %></th>
            <% } %>
            </tr>
        </thead>
        <tbody>
        <% foreach (var student in Model.getStudentsForCourse()) {
               List<float> weeks = student.getWeeklyHoursForCourse(Model.course_id);
               List<float> stats = student.getSummaryStatsForCourse(Model.course_id); %>
            <tr class="datarow <%: "student-" + student.user_id %>">
                <td><%: student.user_id %></td>
                <td><a href="<%: Url.Action("Summary", "Student") + "/" + student.user_id %>"><%: student.user_last_name %>, <%: student.user_first_name %></a></td>
                <td><%: stats[0].ToString("n2") %></td>
            <% for (int w = weeks.Count - 1; w >= 0; w--) { %>
                <td <% if (weeks[w] < 5.0f) { %> class="warning_value" <% } %>><%: weeks[w].ToString("n2") %></td>
            <% } %>
            </tr>
        <% } %>
        </tbody>
    </table>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script type="text/javascript">

        //$('table.course_data').hide();
        //$('table.course-' + $('#CourseList').val()).show();

        //$('#CourseList').change(function () {
        //    $('table.course_data').hide();
        //    $('table.course-' + $('#CourseList').val()).show();
        //});

        $(document).ready(function () {
            $(".tablesorter").tablesorter({
                sortList: [[1, 0]]
            });
        });
    </script>
</asp:Content>