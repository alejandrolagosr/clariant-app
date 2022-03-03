<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ybf2.aspx.cs" Inherits="ClariantApp.admin.ybf2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 488px;
        }
        .style2
        {
            width: 222px;
        }
        .style3
        {
        }
        .style7
        {
            width: 134px;
        }
        .style8
        {
            width: 222px;
            height: 20px;
        }
        .style9
        {
            width: 488px;
            height: 20px;
        }
        .style10
        {
            height: 20px;
        }
        .style11
        {
            width: 110px;
        }
        .style12
        {
            width: 179px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style2">
                <asp:Panel ID="Panel1" runat="server" Width="102px">
                    <asp:ImageButton ID="ImageButton1" runat="server" 
    Height="25px" ImageUrl="~/Images/Botones/Regresar.png" 
    PostBackUrl="~/admin/info.aspx" Width="85px" />
                </asp:Panel>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
            </td>
            <td class="style9">
                <h6>
                    Selecciona el archivo [ybf2].xlsx:</h6>
            </td>
            <td class="style10">
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style1">
                <asp:Panel ID="panelUploadFile" runat="server" Height="74px" Width="485px">
                    <table style="width:101%;">
                        <tr>
                            <td class="style12">
                                <asp:FileUpload ID="fileUpload" runat="server" />
                            </td>
                            <td class="style11">
                                <asp:Button ID="btnUpload" runat="server" Height="22px" 
                                    onclick="btnUpload_Click" Text="Subir Archivo" 
                                    ValidationGroup="FileUploadEmpty" Width="114px" />
                            </td>
                            <td class="style7">
                                <asp:Button ID="btnImportar" runat="server" Enabled="False" Height="22px" 
                                    onclick="btnImportar_Click" Text="Importar" Width="114px" />
                            </td>
                            <td class="style7">
                                <asp:Image ID="imgOk" runat="server" Height="23px" 
                                    ImageUrl="~/Images/Status/Ok.png" Visible="False" Width="24px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" colspan="4">
                                <asp:Label ID="lblUploadStatus" runat="server" ForeColor="#0066FF"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" colspan="4">
                                <asp:RequiredFieldValidator ID="rfvUploadVacio" runat="server" 
                                    ControlToValidate="fileUpload" Display="None" 
                                    ErrorMessage="&lt;b&gt;ERROR:&lt;/b&gt;&lt;br /&gt;No se especificó ningún archivo." 
                                    ForeColor="Red" ValidationGroup="FileUploadEmpty"></asp:RequiredFieldValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="rfvUploadVacio_ValidatorCalloutExtender" 
                                    runat="server" Enabled="True" TargetControlID="rfvUploadVacio">
                                </ajaxToolkit:ValidatorCalloutExtender>
                                <asp:Label ID="lblPathExcel" runat="server" Enabled="False" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
</asp:Content>
