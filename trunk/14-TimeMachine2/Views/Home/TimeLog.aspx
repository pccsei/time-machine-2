<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" EnableViewState="true" %>
<%@ MasterType VirtualPath="~/Views/Shared/Site.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cph_Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Body" Runat="Server">
    Show Time Log<br />
    <asp:Table ID="tblLog" runat="server">
        <asp:TableHeaderRow ID="TableHeaderRow1" runat="server">
            <asp:TableHeaderCell>
                <asp:Label ID="Label14" runat="server" Text="Show Time Log: " />
            </asp:TableHeaderCell><asp:TableHeaderCell runat = "server" HorizontalAlign="Left" visible="false" id="cellTeacher">
                <asp:Label ID="Label1" Text="Teacher:" runat="server" /><br />
                <asp:DropDownList width="2in" ID="ddlTeacher" runat="server" AutoPostBack="true"/>&nbsp;&gt;
            </asp:TableHeaderCell><asp:TableHeaderCell ID="TableHeaderCell1" runat = "server" HorizontalAlign="Left" >
                <asp:Label ID="Label2" Text="Course:" runat="server" /><br />
                <asp:DropDownList width="2in" ID="ddlCourse" runat="server" AutoPostBack="true" />&nbsp;&gt;
            </asp:TableHeaderCell><asp:TableHeaderCell runat = "server" HorizontalAlign="Left" visible="false" id="cellStudent">
                <asp:Label ID="Label3" Text="Student:" runat="server" /><br />
                <asp:DropDownList width="2in" ID="ddlStudent" runat="server" AutoPostBack="true" />&nbsp;&gt;
            </asp:TableHeaderCell><asp:TableHeaderCell ID="TableHeaderCell2" runat = "server" HorizontalAlign="Left">
                <asp:Label ID="Label4" Text="Project:" runat="server" /><br />
                <asp:DropDownList width="2in" ID="ddlProject" runat="server" AutoPostBack="true" />
            </asp:TableHeaderCell></asp:TableHeaderRow></asp:Table><br /><br />
            
            
            
            <asp:Table ID="tblCourseProject" runat="server" Visible="false">
            <asp:TableHeaderRow ID="TableHeaderRow2" runat="server">
            <asp:TableHeaderCell>
                <asp:Label ID="lblShow" runat="server" Text="Add Time For Admin: " />
            </asp:TableHeaderCell><asp:TableHeaderCell ID="TableHeaderCell3" runat="server" HorizontalAlign="Left">
            <asp:Label ID="Label5" Text="Course" runat="server"/><br />
            <asp:DropDownList width="2in" ID="ddlTeacherCourse" 
                        runat="server" AutoPostBack="true" 
                        DataSourceID="sqlGetTeacherCourse" 
                        DataTextField="cName"
                        DataValueField="ID"/>
            </asp:TableHeaderCell><asp:TableCell Text="--->" />
            <asp:TableHeaderCell ID="TableHeaderCell4" runat="server" 
                    HorizontalAlign="Left">
            <asp:Label ID="Label6" Text="Project" runat="server" /><br />
            <asp:DropDownList Width="2in" ID="ddlCourseProject"
                        runat="server" AutoPostBack="true" DataSourceID="sqlGetCourseProject"
                        DataTextField="Name"
                        DataValueField="ID" />
            </asp:TableHeaderCell></asp:TableHeaderRow></asp:Table><br />
            
            <asp:Table ID="tblTimelog"  runat="server">
            <asp:TableHeaderRow ID="TableHeaderRow3" runat="server">
            <asp:TableHeaderCell ID="tcStudent" runat="server" HorizontalAlign="Left" Visible="false">
                <asp:Label ID="Label7" Text="Student" runat="server" /><br />
                <asp:DropDownList ID="ddlSelectStudent" runat="server" Width="1.5in" />
            </asp:TableHeaderCell><asp:TableHeaderCell ID="TableHeaderCell5" runat="server" 
                        HorizontalAlign="Left">
                <asp:Label ID="Label8" Text="Begin" runat="server" /><br />
                <asp:TextBox ID="txtBegin" runat="server" width="1.5in" /><br />
            </asp:TableHeaderCell><asp:TableHeaderCell ID="TableHeaderCell6" runat="server" 
                        HorizontalAlign="Left">
                <asp:Label ID="Label9" Text="End" runat="server" /><br />
                <asp:TextBox ID="txtEnd" runat="server" width="1.5in" /><br />
            </asp:TableHeaderCell><asp:TableHeaderCell ID="TableHeaderCell7" runat="server" 
                        HorizontalAlign="Left" VerticalAlign="top" width="0.5in">
                <asp:Label ID="Label10" Text="Total" runat="server"/><br />
                <asp:Label ID="lblTotal" runat="server" width=".5in" />
            </asp:TableHeaderCell><asp:TableHeaderCell ID="TableHeaderCell8" runat="server" 
                        HorizontalAlign="Left">
                <asp:Label ID="Label11" Text="Where" runat="server" /><br />
                <asp:DropDownList ID="ddlLocation" runat="server" width="1.5in" />
            </asp:TableHeaderCell><asp:TableHeaderCell ID="TableHeaderCell9" runat="server" 
                        HorizontalAlign="Left">
                <asp:Label ID="Label12" Text="What" runat="server" /><br />
                <asp:DropDownList ID="ddlCatagory" runat="server" width="1.5in" />
            </asp:TableHeaderCell><asp:TableHeaderCell ID="TableHeaderCell" runat="server" 
                        HorizontalAlign="Left">
                <asp:Label ID="Label13" Text="Note" runat="server" /><br />
                <asp:TextBox ID="txtNote" runat="server" width="1.5in" />
            </asp:TableHeaderCell></asp:TableHeaderRow><asp:TableRow ID="TableRow1" runat="server"></asp:TableRow></asp:Table><br /><asp:Button 
                        ID="btnAddTime" runat="server" Text="Add Time" /><br />
    

</asp:Content>

