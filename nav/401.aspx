<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="401.aspx.cs" Inherits="ClariantApp.error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
        }
        .style3
        {
            height: 105px;
        }
        .style6
        {
            width: 273px;
            }
        .style7
        {
            width: 69px;
            }
        .style8
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style3" colspan="3">
                </td>
        </tr>
        <tr>
            <td class="style6" rowspan="2">
            </td>
            <td class="style7" rowspan="2">
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl="~/Images/Logos/Warning128x128.png" />
            </td>
            <td class="style8">
                <h1>
                    Acceso Denegado</h1>
            </td>
        </tr>
        <tr>
            <td>
                La página que intentas acceder no está disponible para tú usuario,<br />
                inicia sesión con una cuenta autorizada para visualizar esta página. 
                <br />
                </td>
        </tr>
        <tr>
            <td class="style2" colspan="3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
