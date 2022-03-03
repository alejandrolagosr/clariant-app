<%@ Page Title="Información" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="ClariantApp.AdminPages.admin" %>
<%@ Register assembly="ExportToExcel" namespace="KrishLabs.Web.Controls" tagprefix="RK" %>
<%@ Register assembly="skmParameters" namespace="skmParameters" tagPrefix="skm" %>

  
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%; height: 12px; margin-bottom: 4px;">
        <tr>
            <td style="width: 31px"></td>
                <td>
                    <asp:Menu ID="menu" runat="server" BackColor="#E3EAEB" 
                        DynamicHorizontalOffset="2" Font-Names="Segoe UI" Font-Size="small" 
                        ForeColor="#666666" Orientation="Horizontal" StaticSubMenuIndent="10px" >
                            <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                            <DynamicMenuStyle BackColor="#E3EAEB" />
                            <DynamicSelectedStyle BackColor="#1C5E55" />
                        <Items>
                             <asp:MenuItem ImageUrl="~/Images/MenuItems/Importar16x16.png" Text=" Importar" Value="Importar">
                                <asp:MenuItem ImageUrl="~/Images/MenuItems/ExcelIcon.PNG" NavigateUrl="~/admin/progbd.aspx" Text=" Prog" Value="Prog"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/admin/ybf2.aspx" Text=" Ybf2" Value="Ybf2" ImageUrl="~/Images/MenuItems/ExcelIcon.PNG"></asp:MenuItem>
                             </asp:MenuItem>
                                <asp:MenuItem ImageUrl="~/Images/MenuItems/Usuarios16x16.png" Text=" Usuarios" Value="Usuarios">
                                <asp:MenuItem ImageUrl="~/Images/MenuItems/UsuarioAdd16x16.png" NavigateUrl="~/admin/registro.aspx" Text=" Agregar" Value="Agregar "></asp:MenuItem>
                             </asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#1C5E55" />
                    </asp:Menu>
                </td>
            <td style="width: 31px"></td>
        </tr>
        <tr>
            <td></td>
                <td>           
                    <asp:Panel ID="panelGridControl" runat="server" Width="100%" Height="100%" >
                        <table style="width:100%;">
                            <tr>
                                <td align="center" style="width: 180px">De
                                    <asp:TextBox ID="txtInicio" runat="server" AutoPostBack="True" Height="22px" Width="70px"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="txtInicio_CalendarExtender" runat="server" 
                                            ClearTime="True" Enabled="True" Format="dd/MM/yy" 
                                            PopupPosition="BottomRight" TargetControlID="txtInicio">
                                        </ajaxToolkit:CalendarExtender>
                                </td>
                                <td align="center" style="width: 135px">a
                                    <asp:TextBox ID="txtFinal" runat="server" AutoPostBack="True" Height="22px" Width="70px"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="txtFinal_CalendarExtender" runat="server" 
                                            ClearTime="True" Enabled="True" Format="dd/MM/yy" 
                                            PopupPosition="BottomRight" TargetControlID="txtFinal">
                                        </ajaxToolkit:CalendarExtender>
                                </td>
                                <td style="width: 300px">
                                    <chk:DropDownCheckBoxes ID="ddcbSheet" runat="server" AddJQueryReference="True" 
                                        AutoPostBack="True" DataSourceID="dsCheckBoxes" DataTextField="IDSheet" 
                                        DataValueField="IDSheet" onselectedindexchanged="ddcbSheet_SelectedIndexChanged" 
                                        RepeatDirection="Horizontal" style="top: 0px; left: 0px; height: 17px;" UseButtons="False" 
                                        UseSelectAllNode="False" AppendDataBoundItems="False" >
                                            <Style DropDownBoxBoxHeight="200" DropDownBoxBoxWidth="100" SelectBoxCssClass="" />
                                            <Style2 DropDownBoxBoxHeight="200px" DropDownBoxBoxWidth="100px" 
                                                SelectBoxCssClass="" SelectBoxWidth="" />
                                            <Texts SelectBoxCaption="Sheets" />
                                    </chk:DropDownCheckBoxes>
                                </td>
                                <td style="width: 450px"></td>
                                <td style="width: 700px; height: 33px;">
                                    CANT.TOTAL:
                                    <asp:Label ID="lblCantidad" runat="server" 
                                        style="text-align: right; font-weight: 700" ForeColor="#0066FF" 
                                        Font-Size="Medium"></asp:Label>
                                        &nbsp;TONS</td>
                                <td style="width: 140px; height: 33px;">
                                    <asp:TextBox ID="txtSearchProducto" runat="server" AutoPostBack="True" 
                                        Height="23px" ontextchanged="txtSearch_TextChanged1" 
                                        style="margin-left: 3px; font-size: small;" Width="115px" MaxLength="20"></asp:TextBox>
                                            <ajaxToolkit:TextBoxWatermarkExtender ID="txtSearchProducto_TextBoxWatermarkExtender" 
                                                runat="server" Enabled="True" TargetControlID="txtSearchProducto" WatermarkText="código/producto">
                                    </ajaxToolkit:TextBoxWatermarkExtender>
                                </td>
                                <td style="height: 33px">
                                    <RK:exporttoexcel ID="ExportToExcel" runat="server" ApplyStyleInExcel="True" 
                                        Charset="utf-8" ContentEncoding="windows-1250" EnableHyperLinks="True" 
                                        ExportFileName="progbd.xls" IncludeTimeStamp="False" PageSize="All" 
                                        style="text-align: right" Text="Exportar" />
                                </td>
                            </tr>

                            <tr>
                                <td align="center" colspan="7">
                                <div>
                                    <asp:GridView ID="gridPrincipal" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" DataKeyNames="IDOrden" DataMember="DefaultView" 
                                        DataSourceID="dsGridView" 
                                        EmptyDataText="No se encontró ningún dato con los criterios seleccionados." 
                                        Font-Names="Segoe UI" Font-Strikeout="False" ForeColor="#333333" 
                                        GridLines="None" Height="16px" onrowdatabound="gridPrincipal_RowDataBound" 
                                        PageSize="250" ShowHeaderWhenEmpty="True" 
                                        style="margin-top: 0px; margin-right: 0px;" Width="100%">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="IDCodigo" HeaderText="CODIGO" SortExpression="IDCodigo" />
                                            <asp:BoundField DataField="Producto" HeaderText="PRODUCTO" SortExpression="Producto" />
                                            <asp:BoundField DataField="Lote" HeaderText="LOTE" SortExpression="Lote" />
                                            <asp:BoundField DataField="Inicio" HeaderText="INICIO" SortExpression="Inicio" DataFormatString="{0:dd/MM/yy HH:mm}" />
                                            <asp:BoundField DataField="Cantidad" HeaderText="CANT." SortExpression="Cantidad" />
                                            <asp:BoundField DataField="FinPlaneado" HeaderText="FIN PLANEADO" SortExpression="FinPlaneado" DataFormatString="{0:dd/MM/yy HH:mm}" />
                                            <asp:BoundField DataField="FinReal" HeaderText="FIN REAL" SortExpression="FinReal" DataFormatString="{0:dd/MM/yy HH:mm}" />
                                            <asp:BoundField DataField="IDOrden" HeaderText="ORDEN" SortExpression="IDOrden" />
                                            <asp:BoundField DataField="IDSheet" HeaderText="SHEET" SortExpression="IDSheet" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                </div>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td></td>
            </tr>
        </table>


        <asp:SqlDataSource ID="dsCheckBoxes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:clariantDBConnectionString %>" 
            SelectCommand="SELECT IDSheet FROM Sheets ORDER BY IDSheet">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsGridView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:clariantDBConnectionString %>" 
            CancelSelectOnNullParameter="False"
            SelectCommand="SELECT p.IDCodigo, y.Producto, p.Lote, p.Inicio, p.Cantidad, p.FinPlaneado, p.FinReal, p.IDOrden, p.IDSheet  
                           FROM Prog p LEFT JOIN Ybf2 y ON p.IDCodigo = y.IDCodigo 
                           WHERE p.IDSheet IN (SELECT Value FROM dbo.Split(@IDSheet, ','))
                           ORDER BY p.IDSheet, p.Inicio ASC" 
            EnableCaching="True"
            FilterExpression="(Inicio >= '{0}' AND Inicio <='{1}') AND (Producto LIKE '%{2}%' OR IDCodigo LIKE '%{2}%')" 
            onfiltering="dsGridView_Filtering" >
            <SelectParameters>
                <skm:checkboxlistparameter ControlID="ddcbSheet" Name="IDSheet" />
            </SelectParameters>
            <FilterParameters>
                <asp:ControlParameter ControlID="txtInicio" Name="Inicio" DbType="String" ConvertEmptyStringToNull="true" />
                <asp:ControlParameter ControlID="txtFinal" Name="Final" DbType="String" ConvertEmptyStringToNull="true" />
                <asp:ControlParameter ControlID="txtSearchProducto" Name="Producto" DbType="String" ConvertEmptyStringToNull="false" />
            </FilterParameters>
        </asp:SqlDataSource>
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager" runat="server"></ajaxToolkit:ToolkitScriptManager>
    </asp:Content>