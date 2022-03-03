<%@ Page Title="Importar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="progbd.aspx.cs" Inherits="ClariantApp.AdminPages.importar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
    .style79
    {
        width: 34px;
        height: 13px;
    }
    .style80
    {
        }
    .style81
    {
        width: 24px;
    }
    .style82
    {
        width: 36px;
    }
        .style85
        {
            height: 21px;
        }
        .style96
        {
            width: 568px;
            height: 96px;
        }
        .style98
        {
            width: 568px;
            height: 83px;
        }
        .style99
        {
            width: 184px;
        }
        .style100
        {
            width: 246px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <table style="width:100%;">
        <tr>
            <td class="style85" colspan="2">
                <asp:Panel ID="panelRegresar" runat="server" Height="27px" Width="88px">
                    <asp:ImageButton ID="ibtnRegresar" runat="server" Height="25px" 
                        ImageUrl="~/Images/Botones/Regresar.png" 
                        Width="85px" onclick="ibtnRegresar_Click" style="margin-bottom: 0px" />
                </asp:Panel>
            </td>
            <td>
                    <asp:LinkButton ID="lbtnAdminSheets" runat="server" 
                        onclick="lbtnAdminSheets_Click">Administrar Sheets</asp:LinkButton>
                </td>
        </tr>
        <tr>
            <td class="style100" rowspan="2">
                </td>
            <td class="style98">
                <asp:Panel ID="PanelUploadFile" runat="server" Height="99px" Width="490px">
        <table style="width:81%; height: 67px;">
            <tr>
                <td style="height: 8px" colspan="4">
                    <h6>
                        Selecciona el archivo [prog].xlsx:</h6>
                </td>
            </tr>
            <tr>
                <td class="style99">
                    <asp:FileUpload ID="fileUpload" runat="server" />
                </td>
                <td style="width: 118px">
                    <asp:Button ID="btnUpload" runat="server" Height="22px" Text="Subir Archivo" 
                        ValidationGroup="FileUploadEmpty" Width="114px" 
                        onclick="btnUpload_Click" />
                </td>
                <td style="width: 118px">
                    <asp:Button ID="btnImportarTodo" runat="server" Enabled="False" Height="22px" 
                        onclick="btnImportarTodo_Click" Text="Importar Todo" Width="118px" />
                </td>
                <td style="width: 118px">
                    <asp:Image ID="imgOk" runat="server" Height="23px" 
                        ImageUrl="~/Images/Status/Ok.png" Visible="False" Width="24px" />
                </td>
            </tr>
            <tr>
                <td class="style46" colspan="4">
                    <asp:Label ID="lblUploadStatus" runat="server" ForeColor="#0066FF"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:RequiredFieldValidator ID="rfvUploadVacio" runat="server" 
            ControlToValidate="fileUpload" Display="None" 
            ErrorMessage="&lt;b&gt;ERROR:&lt;/b&gt;&lt;br /&gt;No se especificó ningún archivo." 
            ForeColor="Red" ValidationGroup="FileUploadEmpty"></asp:RequiredFieldValidator>
        <ajaxToolkit:ValidatorCalloutExtender ID="rfvUploadVacio_ValidatorCalloutExtender" 
            runat="server" Enabled="True" TargetControlID="rfvUploadVacio">
        </ajaxToolkit:ValidatorCalloutExtender>
        <asp:Label ID="lblPathExcel" runat="server" Enabled="False" Visible="False"></asp:Label>
        <br />
        <br />
    </asp:Panel></td>
        </tr>
        <tr>
            <td class="style96">
                <asp:Panel ID="PanelSheet" runat="server" Width="269px" Height="98px" 
    Visible="False">
        <table style="width:98%; height: 25px;">
            <tr>
                <td class="style80" colspan="3">
                    <h6>
                        Agregar/Eliminar sheets:</h6>
                </td>
            </tr>
            <tr>
                <td class="style80">
                    <asp:TextBox ID="txtNombre" runat="server" Height="22px" MaxLength="10" 
                        Width="73px"></asp:TextBox>
                </td>
                <td class="style81">
                    <asp:ImageButton ID="ibtnAgregarSheet" runat="server" Height="24px" 
                        ImageUrl="~/Images/Botones/Agregar.png" onclick="ibtnAgregarSheet_Click" 
                        ToolTip="Agregar un nuevo Sheet" ValidationGroup="Empty" Width="77px" />
                </td>
                <td class="style82">
                    <asp:LinkButton ID="lbtnCancelarUploadSheet" runat="server" 
                        onclick="lbtnCancelarUploadSheet_Click">Ocultar</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="style79">
                    <asp:DropDownList ID="ddlSheets" runat="server" AutoPostBack="True" 
                        DataTextField="IDSheet" DataValueField="IDSheet" Height="22px" 
                        OnSelectedIndexChanged="ddlSheets_OnSelectedIndex" Width="80px" 
                        DataSourceID="SqlDataSourceSheets" >
                    </asp:DropDownList>
                </td>
                <td style="width: 24px; height: 13px">
                    <asp:ImageButton ID="ibtnEliminarSheet" runat="server" Height="24px" 
                        ImageUrl="~/Images/Botones/Eliminar.png" onclick="ibtnEliminarSheet_Click" 
                        ToolTip="Eliminar Sheet" Width="82px" />
                </td>
                <td style="height: 13px; width: 36px">
                    <asp:Button ID="ibtnBorrar" runat="server" onclick="ibtnBorrar_Click" 
                        Text="Borrar BD" />
                </td>
            </tr>
        </table>
        <asp:RequiredFieldValidator ID="rfvNombreSheetVacio" runat="server" 
            ControlToValidate="txtNombre" Display="None" 
            ErrorMessage="&lt;b&gt;ERROR:&lt;/b&gt;&lt;br /&gt;El campo está vacio." 
            ForeColor="Red" ValidationGroup="Empty"></asp:RequiredFieldValidator>
        <ajaxToolkit:ValidatorCalloutExtender ID="rfvNombreSheetVacio_ValidatorCalloutExtender" 
            runat="server" Enabled="True" TargetControlID="rfvNombreSheetVacio">
        </ajaxToolkit:ValidatorCalloutExtender>
                    <asp:Label ID="lblStatus" runat="server" ForeColor="#0066FF"></asp:Label>
        <br />
    </asp:Panel></td>
        </tr>
    </table>
    <br />
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager" runat="server">
        </ajaxToolkit:ToolkitScriptManager>
    <asp:SqlDataSource ID="SqlDataSourceSheets" runat="server" 
        ConnectionString="<%$ ConnectionStrings:clariantDBConnectionString %>" 
        DeleteCommand="DELETE FROM [Sheets] WHERE [IDSheet] = @IDSheet" 
        InsertCommand="INSERT INTO [Sheets] ([IDSheet]) VALUES (@IDSheet)" 
        SelectCommand="SELECT [IDSheet] FROM [Sheets] ORDER BY [IDSheet]">
        <DeleteParameters>
            <asp:ControlParameter ControlID="ddlSheets" Name="IDSheet" PropertyName="SelectedValue" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtNombre" Name="IDSheet" PropertyName="Text" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
