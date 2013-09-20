<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_14_TimeMachine2.Models.USER>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    StronglyTypedView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>StronglyTypedView</h2>
    
<table>
    <tbody>
        <% foreach (var user in Model.ToArray())
           { 
               if (user.is_teacher() && user.is_enabled())
               { %>
            <tr id="<%= HttpUtility.UrlPathEncode(user.user_id) %>">
                <td> <%= user.user_id  %></td>
                <td> <%= user.user_first_name  %> <%= user.user_last_name %></td>
                <td> <a href="#" onclick="document.getElementById('<%= HttpUtility.UrlPathEncode(user.user_id)  %>').style.display='none'">disable</a></td>
            </tr>
            <% }
           } %>
    </tbody>
</table>

    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
<p>
    Page Rendered: <%= DateTime.Now.ToLongTimeString() %>
</p>
<span id="status">No Status</span>
<br />   
<%= Ajax.ActionLink("Update Status", "GetStatus", new AjaxOptions{UpdateTargetId="status" }) %>
<br /><br />
<% using(Ajax.BeginForm("UpdateForm", new AjaxOptions{UpdateTargetId="textEntered"})) { %>
  <%= Html.TextBox("textBox1","Enter text")%>  
  <input type="submit" value="Submit"/><br />
  <span id="textEntered">Nothing Entered</span>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
