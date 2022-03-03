<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cambiar.aspx.cs" Inherits="ClariantApp.Account.cambiar_contrasena" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="height: 90px; width: 292px;"></td>
            <td style="height: 90px; width: 348px;"></td>
            <td style="height: 90px;"></td>
        </tr>
        <tr>
            <td style="width: 292px;"></td>
            <td style="text-align: center" style="width: 348px;">
                <asp:LoginView ID="LoginView" runat="server">
                    <AnonymousTemplate>
                        <table style="width: 100%;" align="center">
                            <tr>
                                <td>
                                    <asp:Image ID="imgWarning" runat="server" 
                                         ImageUrl="~/Images/Logos/Warning128x128.png"  />
                                    <h3>Antes de poder cambiar tú contraseña debes <a href="login.aspx">Iniciar Sesión</a></h3>
                                </td>
                            </tr>
                        </table>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <asp:ChangePassword ID="ChangePassword" runat="server" 
                             ChangePasswordFailureText="La Contraseña o Nueva Contraseña es inválida.&lt;br&gt;La longitud de ambas debe ser mayor de {0} caractéres. " 
                             CancelDestinationPageUrl="~/account/login.aspx" Height="175px" 
                             oncontinuebuttonclick="ChangePassword_ContinueButtonClick" Width="359px">
                            <ChangePasswordTemplate>
                                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                    <tr>
                                        <td>
                                            <table cellpadding="0" style="height: 100%; width: 361px;" align="center">
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <h1>
                                                            <asp:Image ID="imgContrasena" runat="server" ImageAlign="Middle" 
                                                                 ImageUrl="~/Images/Logos/SecurityUnlock32x32.png" />
                                                                 &nbsp;Cambiar Contraseña</h1>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2"></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="height: 35px;">
                                                        <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                                            AssociatedControlID="CurrentPassword">Contraseña:</asp:Label>
                                                    </td>
                                                    <td style="width: 237px; height: 35px;">
                                                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                                            ControlToValidate="CurrentPassword" ErrorMessage="Password is required." 
                                                            Font-Bold="True" ForeColor="Red" ToolTip="La Contraseña es requerida" 
                                                            ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="height: 39px;">
                                                        <asp:Label ID="NewPasswordLabel" runat="server" 
                                                            AssociatedControlID="NewPassword">Nueva Contraseña:</asp:Label>
                                                    </td>
                                                    <td style="height: 39px; width: 237px;">
                                                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                                            ControlToValidate="NewPassword" ErrorMessage="New Password is required." 
                                                            ToolTip="La Nueva Contraseña es requerida." ValidationGroup="ChangePassword1" 
                                                            Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                                            AssociatedControlID="ConfirmNewPassword">Confirmar Contraseña:</asp:Label>
                                                    </td>
                                                    <td style="width: 237px;">
                                                        <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                                            ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirm New Password is required." 
                                                            ToolTip="La Confirmación de la Nueva Contraseña es requerido." ValidationGroup="ChangePassword1" 
                                                            Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="color:Red;">
                                                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                                            ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                                            Display="Dynamic" ErrorMessage="La Nueva Contraseña y su Confirmación deben coincidir." 
                                                            ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="color: #FF0000">
                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                                            CommandName="ChangePassword" Text="Cambiar Contraseña" 
                                                            ValidationGroup="ChangePassword1" />
                                                    </td>
                                                    <td style="width: 237px;">
                                                        <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="Cancelar" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ChangePasswordTemplate>
                            <SuccessTemplate>
                                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                    <tr>
                                        <td>
                                            <table cellpadding="0">
                                                <tr>
                                                    <td align="center"><h3>¡Tú Contraseña ha sido cambiada exitosamente!</h3></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:Image ID="imgDone" runat="server" Height="87px" 
                                                            ImageUrl="~/Images/Logos/Done128x128.png" Width="91px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" 
                                                            CommandName="Continue" Text="Continuar" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </SuccessTemplate>
                        </asp:ChangePassword>
                    </LoggedInTemplate>
                </asp:LoginView>
            </td>
            <td></td>
        </tr>
        <tr>
            <td style="width: 292px;"></td>
            <td ></td>
            <td></td>
        </tr>
    </table>
</asp:Content>
