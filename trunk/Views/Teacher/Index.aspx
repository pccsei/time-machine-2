<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Teacher
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Links to the different pages for a teacher -->
    <form id="form1" runat="server" name="TeacherLinks" action="teacher/Selection_Change" method="get">
        <div style="text-align: center;">
            <%=Html.ActionLink("Alerts", "Alerts") %>
            <%=Html.ActionLink("Settings", "Settings") %>
            <%=Html.ActionLink("Timelog", "Timelog") %>
            <%=Html.ActionLink("Weekly Reports", "WeeklyReports") %>
            <%=Html.ActionLink("CategoryChosen", "CategoryChosen") %>
        </div>

    <!-- Dropdown list of all the classes to choose -->
    <!-- Information from stackoverflow.com -->
    <%--<div style="text-align: right;">
        <select onchange="location = this.options[this.selectedIndex].value;">
            <option selected="selected" value="#">Select a class</option>
	        <option value="http://csmain/seproject/TimeMachine2/CategoryChosen">CS 451</option>
            <option value="http://csmain/seproject/TimeMachine2/CategoryChosen">BA 511</option>
            <option value="http://csmain/seproject/TimeMachine2/home">CS 202-1</option>
            <option value="http://csmain/seproject/TimeMachine2/account">CS 202-2</option>
        </select>
	    </div>--%>

<%----<% using (Html.BeginForm("CategoryChosen", "teacher/CategoryChosen", FormMethod.Post)) %> 
         
    <fieldset>
        <legend></legend>

                 <%=Html.DropDownList("course_id", (SelectList) ViewBag.course_id, "Choose a Class")%>
        <input type="submit" value="Submit" />
    </fieldset>--%>
        
    <h2>Semester Summary</h2>
    <!-- Summary table of entire semester of all the students -->

    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    
</asp:Content>




<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>

