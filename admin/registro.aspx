<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="ClariantApp.AdminPages.registro" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
    <tr style="height:50px;">
        <td class="style1">
            <asp:ImageButton ID="ibtnRegresar" runat="server" Height="25px" 
                ImageUrl="~/Images/Botones/Regresar.png" PostBackUrl="~/admin/info.aspx" 
                Width="91px" />
        </td>
        <td>&nbsp;</td>
        <td></td>
    </tr>
    <tr>
        <td class="style1"></td>
        <td align = "center">
            <h1><asp:Image ID="imgRegistro" runat="server" ImageAlign="AbsBottom" 
                     ImageUrl="~/Images/Logos/UsuarioAdd32x32.png" />&nbsp;Registro de Usuarios </h1>
        </td>
            <td></td>
        </tr>
        <tr>
            <td class="style1"></td>
            <td align = "center">
                <asp:CreateUserWizard ID="CreateUserWizard" runat="server" Width="400px" 
                                      LoginCreatedUser="False" 
                    DuplicateEmailErrorMessage="El e-mail que proporcionaste ya existe" 
                    DuplicateUserNameErrorMessage="El nombre de usuario que proporcionaste ya existe" 
                    InvalidAnswerErrorMessage="Por favor, escribe una pregunta de seguridad diferente" 
                    InvalidEmailErrorMessage="Por favor, escribe un e-mail válido" 
                    InvalidPasswordErrorMessage="Longitud de contraseña mínimo: {0}. Caracteres no alfanuméricos requeridos {1}." 
                    InvalidQuestionErrorMessage="Por favor, escribe una pregunta de seguridad válida" 
                    UnknownErrorMessage="Tú cuenta no fué creada, inténtalo nuevamente." >
                    <WizardSteps>
                        <asp:CreateUserWizardStep runat="server" Title="Datos">
                            <ContentTemplate>
                                <table style="font-size:100%;width:400px;">
                                    <tr>
                                        <td align="center" colspan="2">
                                            <p>Ingrese los siguientes datos para agregar un nuevo usuario</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" 
                                                 AssociatedControlID="UserName">Usuario:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                ToolTip="Nombre de usuario requerido." ValidationGroup="CreateUserWizard" 
                                                ForeColor="Red" Font-Bold="true" Font-Size="Medium">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" 
                                                       AssociatedControlID="Password">Contraseña:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="123px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="Password" ErrorMessage="Password is required." 
                                                ToolTip="Contraseña requerida." ValidationGroup="CreateUserWizard" 
                                                ForeColor="Red" Font-Bold="true" Font-Size="Medium">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                                       AssociatedControlID="ConfirmPassword">Confirmar Contraseña:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" 
                                                Width="122px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                                ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." 
                                                ToolTip="Contraseña confirmada es requerida." ValidationGroup="CreateUserWizard" 
                                                ForeColor="Red" Font-Bold="true" Font-Size="Medium">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="EmailLabel" runat="server" 
                                                       AssociatedControlID="Email">E-mail:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                                ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                                ToolTip="E-Mail requerido." ValidationGroup="CreateUserWizard" 
                                                ForeColor="Red" Font-Bold="true" Font-Size="Medium">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="QuestionLabel" runat="server" 
                                                       AssociatedControlID="Question">Pregunta de Seguridad:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                                ControlToValidate="Question" ErrorMessage="Security question is required." 
                                                ToolTip="Pregunta de seguridad requerida." ValidationGroup="CreateUserWizard" 
                                                ForeColor="Red" Font-Bold="true" Font-Size="Medium">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="AnswerLabel" runat="server" 
                                                       AssociatedControlID="Answer">Respuesta de Seguridad:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                                ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                                ToolTip="Respuesta de seguridad requerida." ValidationGroup="CreateUserWizard" 
                                                ForeColor="Red" Font-Bold="true" Font-Size="Medium">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <p><asp:CompareValidator ID="PasswordCompare" runat="server" 
                                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                                    Display="Dynamic" ErrorMessage="La contraseña y confirmación deben coincidir." 
                                                    ValidationGroup="CreateUserWizard" ForeColor="Red"></asp:CompareValidator></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <p><asp:Literal ID="ErrorMessage" runat="server" 
                                                            EnableViewState="False"></asp:Literal></p>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <CustomNavigationTemplate>
                                <table border="0" cellspacing="5" style="width:100%;height:100%;">
                                    <tr align="right">
                                        <td align="right" colspan="0">
                                            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                                                Text="Siguiente" ValidationGroup="CreateUserWizard" />
                                        </td>
                                    </tr>
                                </table>
                            </CustomNavigationTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:WizardStep runat="server" Title="Roles" AllowReturn="False" 
                                        OnActivate="AssignUserToRole_Activate"
                                        OnDeactivate="AssignUserToRole_Deactivate">
                        
                        <table style="width:100%;">
                            <tr>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblRoles" runat="server" 
                                               AssociatedControlID="ddlRoles">Asigna un rol al Usuario:</asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlRoles" runat="server" 
                                                      Width="159px" Height="21px"></asp:DropDownList ><br />
                                </td>
                            </tr>
                            <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            </tr>
                        </table>
                        </asp:WizardStep>
                        
                    <asp:CompleteWizardStep runat="server" Title="Finalizado" >
                        <ContentTemplate>
                            <table style="font-size:100%;width:400px;">
                                <tr>
                                    <td align="center"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <p><asp:Label ID="Label1" runat="server" Font-Size="Medium"
                                                      Text="¡La cuenta fué creada exitosamente!"></asp:Label><br /><br />
                                            <asp:Image ID="imgDone" runat="server" 
                                                       ImageUrl="~/Images/notification_done.png" />
                                        </p><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                            CommandName="Continue" Text="Continuar" 
                                            ValidationGroup="CreateUserWizard" onclick="ContinueButton_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </WizardSteps>
               
                    <FinishNavigationTemplate>
                        <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
                            CommandName="MovePrevious" Text="Atras" Visible="false"/>
                        <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
                            Text="Finalizar" />
                    </FinishNavigationTemplate>
               
                </asp:CreateUserWizard>
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 47px;
        }
    </style>
</asp:Content>
