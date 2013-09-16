<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Teacher
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <form id="form1" runat="server">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="user_id" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                user_id:
                <asp:Label ID="user_idLabel" runat="server" Text='<%# Eval("user_id") %>' />
                <br />
                user_first_name:
                <asp:Label ID="user_first_nameLabel" runat="server" Text='<%# Eval("user_first_name") %>' />
                <br />
                user_last_name:
                <asp:Label ID="user_last_nameLabel" runat="server" Text='<%# Eval("user_last_name") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SEI_TimeMachine2ConnectionString %>" 
            SelectCommand="SELECT [user_id], [user_first_name], [user_last_name] FROM [TEACHERS]"></asp:SqlDataSource>
    </form>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
