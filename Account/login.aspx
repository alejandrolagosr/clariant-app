<%@ Page Title="Inicio de Sesión" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="login.aspx.cs" Inherits="ClariantApp.Account.Login" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table style="width: 100%;">
        <tr style="height:91px;">
            <td></td>
            <td>&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td align = "center">
                <h1>            
                    <strong>
                    <asp:Image ID="imgLogIn" runat="server" ImageUrl="~/Images/Logos/UsuarioManage32x32.png" 
                               ImageAlign="Middle" Height="37px" Width="37px" /><br /></strong>&nbsp;Inicio de Sesión</h1>
            </td>
            <td> </td>
        </tr>
        <tr>
            <td></td>
            <td class="p" align="center">
                Ingresa tu Nombre de Usuario y Contraseña
            </td>
            <td> </td>
        </tr>
        <tr>
            <td></td>
            <td class="p">
                <asp:Login ID="Login1" runat="server" Width="270px" 
                    FailureText="El Usuario o Contraseña son incorrectos, inténtalo nuevamente." 
                    onloggedin="Login1_LoggedIn"  >
                <LayoutTemplate>
                    <table cellpadding="1" cellspacing="1" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="1" style="width:270px;">
                        <tr>
                            <td align="center" style="height: 36px;">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuario:</asp:Label>
                            </td>
                            <td style="height: 36px;">
                                <asp:TextBox ID="UserName" runat="server" Width="136px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                            ControlToValidate="UserName" 
                                                            ErrorMessage="El Nombre de Usuario es necesario." 
                                                            ToolTip="El Nombre de Usuario es necesario." 
                                                            ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:&nbsp;</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="136px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                            ControlToValidate="Password" 
                                                            ErrorMessage="La Contraseña es necesaria." 
                                                            ToolTip="La Contraseña es necesaria." 
                                                            ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Recordarme." style="text-align: left" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="LoginButton" runat="server" 
                                            CommandName="Login" Text="Iniciar Sesión" 
                                            ValidationGroup="Login1"/>
                        </td>
                        </tr>
                        </table>
                    </td>
                    </tr>
                </table>
            </LayoutTemplate>
            </asp:Login>
        </td>
        <td></td>
        </tr>
            <tr>
                <td></td>
                <td style="width: 270px;"></td>
                <td></td>
                
            </tr>
        </table>
</asp:Content>