<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table>
<tr>
<td>
Register:
</td>
</tr>
<tr>
<td>
<fieldset>
<table>
<tr>
<td align="right">
First Name
</td>
<td align="left">
<asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvfname" runat="server" ControlToValidate="txtfname" ErrorMessage="*"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">
Last Name
</td>
<td align="left">
<asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtlname" ErrorMessage="*"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">
Date Of Birth
</td>
<td align="left">
<asp:TextBox ID="txtcal" runat="server" Enabled="false"></asp:TextBox>

<asp:ImageButton ID="imgCal" runat="server" onclick="imgCal_Click" CausesValidation="false" 
        ImageUrl="~/Assets/cal.jpg" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcal" ErrorMessage="*"></asp:RequiredFieldValidator>
</td>
<td>
<asp:Calendar ID="cal" runat="server" onselectionchanged="cal_SelectionChanged" 
        Visible="False"></asp:Calendar>
</td>
</tr>
<tr>
<td align="right">
Gender
</td>
<td align="left">
<asp:RadioButtonList ID="rbtnGender" runat="server">
    <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
    <asp:ListItem Value="F">Female</asp:ListItem>
    </asp:RadioButtonList>
</td>
</tr>
<tr>
<td align="right">
    Mobile Number
</td>
<td align="left">
<asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtMobile" ErrorMessage="Enter 10 Digit" 
        ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td align="right">
Email Id
</td>
<td align="left">
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
        ControlToValidate="txtEmail" Display="Dynamic" 
        ErrorMessage="Enter Correct Email Id" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">
Address
</td>
<td align="left">
<asp:TextBox ID="txtAddr" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ControlToValidate="txtAddr" ErrorMessage="*"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">
UserName
</td>
<td align="left">
<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUsername" ErrorMessage="*"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">
Password
</td>
<td align="left">
<asp:TextBox ID="txtPwd" runat="server" Enabled="false">
</asp:TextBox><asp:Button ID="gtpassweord" Text="GetPassword" runat="server" 
        onclick="gtpassweord_Click" CausesValidation="false" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPwd" ErrorMessage="*"></asp:RequiredFieldValidator>

</td>
</tr>
<tr>
<td>
<br />
</td>
</tr>
<tr>
<td>
<asp:Button ID="btnRegister" runat="server" Text="Register" 
        onclick="btnRegister_Click" />
</td>
<td>
<asp:Button ID="btnCancel" runat="server" Text="Cancel" onclick="btnCancel_Click" />
</td>
</tr>
<tr>
<td>
<br />

</td>
</tr>
</table>
</fieldset>
</td>
</tr>
<tr>
<td>

</td>
</tr>
</table>
</asp:Content>
<asp:Content ID="con" runat="server" ContentPlaceHolderID="sideContent">
    
        <br />
<asp:LinkButton Height="30px" CausesValidation="false" runat="server" Text="Login" BackColor="#000055" 
            Width="100px" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="Medium" 
            ForeColor="White" onclick="Unnamed1_Click"></asp:LinkButton><br />
            <asp:LinkButton ID="LinkButton1" CausesValidation="false" Height="30px" runat="server" 
    Text="Register" BackColor="#000055" 
            Width="100px" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="Medium" 
            ForeColor="White" onclick="LinkButton1_Click"></asp:LinkButton>

</asp:Content>
<asp:Content ID="con3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div id="ScrollList" 
     style="height: 500px; overflow-y: scroll;border-top: solid 1px silver; border-bottom:solid 1px silver; border-right:solid 1px silver; border-left:solid 1px silver;
    padding-left: 5px;text-align:left; azimuth:right;">
<asp:Repeater ID="rpImages" runat="server" onitemcommand="rpImages_ItemCommand" Visible="false" OnItemDataBound="imagemouseover">
<ItemTemplate>
<table>
<tr>
<td>
<asp:ImageButton ID="img" CausesValidation="false" runat="server" CommandArgument='<%#Eval("randomNum")%>' CommandName="imgClick" ImageUrl='<%#Eval("imgPath")%>' />
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
