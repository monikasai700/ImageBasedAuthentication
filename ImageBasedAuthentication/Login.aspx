<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<table>
<tr>
<td>
Login:
</td>
</tr>
<tr>
<td>
<fieldset>
    <table>

<tr>
<td>
UserName
</td>
<td>
<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
</td>
<td>
<asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Enter username"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
Password
</td>
<td>
<asp:TextBox ID="txtPwd" runat="server" Enabled="False"></asp:TextBox>
</td>
<td>
<asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd" ErrorMessage="Select password"></asp:RequiredFieldValidator>
</td>
<td>

    <asp:Button ID="gtpassweord" Text="GetPassword" runat="server" 
        onclick="gtpassweord_Click" CausesValidation="false" />

</td>
</tr>
<tr>
<td>
<br />
</td>
</tr>
<tr>
<td align="right">
<asp:Button ID="btnLogin" runat="server" Text="Login" onclick="btnLogin_Click" />
</td>

</tr>
<tr>
<td>
<br />

    

    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

    

</td>
</tr>
</table>
</fieldset>
</td>
</tr>
</table>

</asp:Content>
<asp:Content ID="con" runat="server" ContentPlaceHolderID="sideContent">
    
        <br />
<asp:LinkButton ID="LinkButton1" CausesValidation="false" Height="30px" runat="server" Text="Login" BackColor="#000055" 
            Width="100px" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="Medium" 
            ForeColor="White" onclick="Unnamed1_Click"></asp:LinkButton><br />
            <asp:LinkButton ID="LinkButton2" Height="30px" CausesValidation="false" runat="server" 
            Text="Register" BackColor="#000055" 
            Width="100px" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="Medium" 
            ForeColor="White" onclick="LinkButton1_Click"></asp:LinkButton>

</asp:Content>
<asp:Content ID="con3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
<div id="ScrollList" 
     style="height: 500px; overflow-y: scroll;border-top: solid 1px silver; border-bottom:solid 1px silver; border-right:solid 1px silver; border-left:solid 1px silver;
    padding-left: 5px;text-align:left; azimuth:right;">

<asp:Repeater ID="rpImages" runat="server" onitemcommand="rpImages_ItemCommand" OnItemDataBound="imagemouseover">
<ItemTemplate>
<table>
<tr>
<td>
<asp:ImageButton CausesValidation="false" ID="img" runat="server" CommandArgument='<%#Eval("randomNum")%>' CommandName="imgClick" ImageUrl='<%#Eval("imgPath")%>'  />
</td>
</tr>
<tr>
<td>
<asp:Label ID="lbl" runat="server" Text='<%#Eval("randomNum")%>'></asp:Label>
</td>
</tr>
</table>
</ItemTemplate>
</asp:Repeater>


</div>
</asp:Content>