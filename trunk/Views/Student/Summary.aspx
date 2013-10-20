<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.USER>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Summary for <%: Model.user_first_name %> <%: Model.user_last_name %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Model.user_first_name %> <%: Model.user_last_name %></h2>
    <% foreach (KeyValuePair<_14_TimeMachine2.Models.COURSE, Dictionary<int, double>> course_summary in ViewBag.summary) { %>
    <h3><%: course_summary.Key.course_name %></h3>
    <table class="standard zebra stemleaf" style="float:left; border:5px #ccc solid;">
        <tbody>
        <% foreach (KeyValuePair<int, double> entry in course_summary.Value) { %>
            <tr>
                <td>Week <%: entry.Key %>:</td>
                <td <% if (entry.Value < 5.0f) { %> class="warning_value" <% } %>><%: entry.Value.ToString("n2") %> hours</td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <table class="standard zebra stemleaf" style="float:left; border:5px #ccc solid; margin-left: 30px">
        <tbody>
        <% float[] stats = Model.getCourseStatsForStudent(course_summary.Key.course_id); %>
            <tr>
                <td>Total Hours:</td>
                <td><%: stats[0].ToString("n2") %></td>
            </tr>
            <tr>
                <td>Hours per Day:</td>
                <td><%: stats[1].ToString("n2") %></td>
            </tr>
            <tr>
                <td>Hours per Week:</td>
                <td><%: stats[2].ToString("n2") %></td>
            </tr>
            <tr style="font-weight:bold;background:#cce6ff">
                <td>Projected Grade:</td>
                <td><%: stats[3].ToString("n0") %>%</td>
            </tr>
        </tbody>
    </table>
    <br style="clear:both;" /><br />
    <% } %>

    <%: Html.ActionLink("View student's timelog", "Index/" + Model.user_id, "TimeEntry") %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
