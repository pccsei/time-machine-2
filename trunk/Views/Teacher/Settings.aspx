<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Settings
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Settings</h2>
    <!-- Links to the different pages for a teacher -->
    <div style="text-align: center;">
        <%=Html.ActionLink("Summary", "Index")%>
        <%=Html.ActionLink("Alerts", "Alerts") %>
        <%=Html.ActionLink("Timelog", "Timelog") %>
        <%=Html.ActionLink("Weekly Reports", "WeeklyReports") %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
