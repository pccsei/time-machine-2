<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Summary
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Summary</h2>
    <% foreach (KeyValuePair<string, Dictionary<int, double>> course in ViewBag.summary) { %>
    <h3><%: course.Key %></h3>
     <table class="standard">
        <tbody>
        <% foreach (KeyValuePair<int, double> entry in course.Value) { %>
            <tr>
                <td>Week <%: entry.Key %></td>
                <td><%: entry.Value.ToString("n2") %> hours</td>
            </tr>
        <% } 
           foreach (KeyValuePair<string, string> stats in ViewBag.stats[course.Key]) { %>
                <tr>
                    <td><%: stats.Key %></td>
                    <td><%: stats.Value %></td>
               </tr>
        <% } %>
        </tbody>
    </table>
    <br /><br /><HR> 
    <% } %>

    <%: Html.ActionLink("View student's timelog", "Index/" + ViewData["StudentID"], "TimeEntry") %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
