<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="recuperar.aspx.cs" Inherits="ClariantApp.Account.recuperar" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <table style="width:100%;">
            <tr style="height:50px;">
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td align = "center">
                    <h1><asp:Image ID="imgRecuperar" runat="server" ImageAlign="AbsBottom" 
                             ImageUrl="~/Images/security_keyandlock.png" />&nbsp;Recuperar Contraseña</h1>
                </td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td align = "center">
                    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
                        <QuestionTemplate>
                            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                <tr>
                                    <td>
                                        <table cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <p>Responde la siguiente pregunta para obtener tú Contraseña.</p>
                                                </td>
                                            </tr>
                                            <tr style="height: 40px;">
                                                <td align="right">Usuario:&nbsp;</td>
                                                <td>
                                                    <asp:Literal ID="UserName" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr style="height: 40px;">
                                                <td align="right">Pregunta:&nbsp;</td>
                                                <td>
                                                    <asp:Literal ID="Question" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr style="height: 40px;">
                                                <td align="right">
                                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Respuesta:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                                        ControlToValidate="Answer" ErrorMessage="Answer is required." 
                                                        ToolTip="La Respuesta es requerida." ValidationGroup="PasswordRecovery1"
                                                        ForeColor="Red" Font-Bold="true" Font-Size="Medium">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr style="height: 40px;">
                                                <td align="center" colspan="2" style="color:Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Siguiente" 
                                                        ValidationGroup="PasswordRecovery1" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </QuestionTemplate>
                        <SuccessTemplate>
                            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                <tr>
                                    <td>
                                        <table cellpadding="0">
                                            <tr>
                                                <td>
                                                    <p>La Contraseña ha sido enviada a tú correo electrónico.</p><br />
                                                    <asp:Image ID="imgRecuperar" runat="server" 
                                                         ImageUrl="~/Images/mail_send.png" />
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </SuccessTemplate>
                        <UserNameTemplate>
                            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                <tr>
                                    <td>
                                        <table cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="height: 40px;">
                                                    <p>Ingresa tú nombre de Usuario, tú contraseña será enviada a tú correo electrónico.<br /> 
                                                       También puedes contactar a un Administrador de la aplicación para obtenerla.</p>
                                                </td>
                                            </tr>
                                            <tr style="height: 40px;">
                                                <td align="right" style="width: 335px;">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuario:&nbsp;</asp:Label>
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                        ToolTip="Nombre de Usuario requerido." ValidationGroup="PasswordRecovery1"
                                                        ForeColor="Red" Font-Bold="true" Font-Size="Medium">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color:Red; height: 40px;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Siguiente" 
                                                        ValidationGroup="PasswordRecovery1" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </UserNameTemplate>
                    </asp:PasswordRecovery>
                </td>
                <td></td>
            </tr>
        </table>
</asp:Content>
