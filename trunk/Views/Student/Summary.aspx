<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<_14_TimeMachine2.Models.USER>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Summary for <%: Model.user_first_name %> <%: Model.user_last_name %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Model.user_first_name %> <%: Model.user_last_name %></h2>
    <% foreach (KeyValuePair<_14_TimeMachine2.Models.COURSE, List<float>> weekly_totals in ViewBag.WeeklyCourseTotals)
       { %>
    <h3><%: weekly_totals.Key.course_name %></h3>
    <table class="standard zebra stemleaf" style="float:left; border:5px #ccc solid;">
        <tbody>
        <% int week = 1; foreach (float entry in weekly_totals.Value)
           { %>
            <tr>
                <td>Week <%: week %>:</td>
                <td <% if (entry < 5.0f)
                       { %> class="warning_value" <% } %>><%: entry.ToString("n2")%> hours</td>
            </tr>
        <%  week++; } %>
        </tbody>
    </table>
    <table class="standard zebra stemleaf" style="float:left; border:5px #ccc solid; margin-left: 30px">
        <tbody>
        <% float[] stats = Model.getCourseStatsForStudent(weekly_totals.Key.course_id); %>
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
                <td><%: stats[3] >= 110.0f ? stats[3].ToString("n0") : stats[3].ToString("n1") %>%</td>
            </tr>
        </tbody>
    </table>
    <br style="clear:both;" /><br />
    <% } %>

    <% if (_14_TimeMachine2.GlobalVariables.current_user.is_teacher()) { %>
        <%: Html.ActionLink(String.Format("View {0}'s timelog", Model.user_first_name), "Index/" + Model.user_id, "TimeEntry") %>
    <% } %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
