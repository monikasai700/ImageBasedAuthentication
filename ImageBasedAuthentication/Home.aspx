<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<asp:Label ID="lbl" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">

    <asp:LinkButton ID="LinkButton1" Height="30px" CausesValidation="false" runat="server" 
            Text="Logout" BackColor="#000055" 
            Width="59px" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="Medium" 
            ForeColor="White" onclick="Unnamed1_Click" PostBackUrl="~/Login.aspx"></asp:LinkButton>

</asp:Content>
<asp:Content ID="con" runat="server" ContentPlaceHolderID="sideContent">
    
        <br />
        <br />
            
</asp:Content>

