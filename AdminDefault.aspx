<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDefault.aspx.cs" Inherits="PollaMundialista.AdminDefault" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrador Copa Polla Mundialista</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:aquamarine;">
    <form id="form1" runat="server">
    <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajax:ToolkitScriptManager>
    <div>
        <asp:HyperLink ID="lnkImageLink" runat="server" NavigateUrl="~/Default.aspx">
            <asp:Image ID="imgCabecera" runat="server" ImageUrl="~/Images/Logo.png" Visible="true" />
        </asp:HyperLink>
        <table width="100%">
            <tr>
                <td width="250" style="vertical-align: top; padding-top: 20px;">
                    <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" BackColor="#F7F6F3"
                        DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#7C6F57"
                        StaticSubMenuIndent="10px">
                        <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#F7F6F3" />
                        <DynamicSelectedStyle BackColor="#5D7B9D" />
                        <Items>
                            <asp:MenuItem Text="Estadios" Value="Estadios">
                                <asp:MenuItem Text="Administrar Estadios" ToolTip="Administrar Estadios" Value="1">
                                </asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="Fases" Value="Fases">
                                <asp:MenuItem Text="Administrar Fases" ToolTip="Administrar Fases" Value="5"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="Grupos" Value="Grupos">
                                <asp:MenuItem Text="Administrar Grupos" ToolTip="Administrar Grupos" Value="2"></asp:MenuItem>
                                <asp:MenuItem Text="Añadir Equipos a Grupos" ToolTip="Añadir Paises a Grupos" Value="6">
                                </asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="Paises" Value="Paises">
                                <asp:MenuItem Text="Administrar Paises" ToolTip="Administrar Paises" Value="3"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="Partidos" Value="Partidos">
                                <asp:MenuItem Text="Administrar Partidos" ToolTip="Administrar Partidos" Value="7">
                                </asp:MenuItem>
                                <asp:MenuItem Text="Actualizar Estadisticas Partidos" ToolTip="Actualizar Estadisticas Partidos"
                                    Value="9"></asp:MenuItem>
                                <asp:MenuItem Text="Actualizar Puntos Usuarios" ToolTip="Actualizar Puntos Usuarios"
                                    Value="10"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="Usuarios" Value="Usuarios">
                                <asp:MenuItem Text="Administrar Usuarios" ToolTip="Administrar Usuarios" Value="8">
                                </asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="Cerrar Sesión" Value="4"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#5D7B9D" />
                    </asp:Menu>
                </td>
                <td style="vertical-align: top">
                    <asp:Panel ID="contentPNL" runat="server" Width="850px">
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
