<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="PollaMundialista.Login" %>

<%@ Register Src="UserControls/ActualizarDatos.ascx" TagName="ActualizarDatos" TagPrefix="uc1" %>
<%@ Register Src="UserControls/CambiarContraseña.ascx" TagName="CambiarContraseña"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlLogin" runat="server">
        <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="14%" style="text-align: center">
                </td>
                <td>
                    <h1>
                        Inicio de Sesión</h1>
                </td>
            </tr>
            <tr>
                <td align="right" class="texto_tablas" width="14%">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" class="texto_tablas" width="14%">
                    <h7>Cédula:</h7>
                </td>
                <td>
                    <label>
                        <asp:TextBox ID="txtIdentificacion" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_txtIdentificacion" runat="server" ControlToValidate="txtIdentificacion"
                            Display="None" ErrorMessage="Campo Obligatorio" SetFocusOnError="true" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                        <ajax:ValidatorCalloutExtender ID="rfv_txtIdentificacion_ValidatorCalloutExtender"
                            runat="server" Enabled="True" TargetControlID="rfv_txtIdentificacion">
                        </ajax:ValidatorCalloutExtender>
                        <asp:CompareValidator ID="cv_txtIdentificacion" runat="server" ControlToValidate="txtIdentificacion"
                            Display="None" ErrorMessage="Dato Incorrecto" Operator="DataTypeCheck" SetFocusOnError="true"
                            Type="Double" ValidationGroup="Ingresar"></asp:CompareValidator>
                        <ajax:ValidatorCalloutExtender ID="cv_txtIdentificacion_ValidatorCalloutExtender"
                            runat="server" Enabled="True" TargetControlID="cv_txtIdentificacion">
                        </ajax:ValidatorCalloutExtender>
                    </label>
                </td>
            </tr>
            <tr>
                <td align="right" class="texto_tablas" width="14%">
                    <br />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" class="texto_tablas">
                    <h7>Contraseña:</h7>
                </td>
                <td width="57%" class="bienvenida">
                    <label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_txtPassword" runat="server" ControlToValidate="txtPassword"
                            SetFocusOnError="true" Display="None" ValidationGroup="Ingresar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                        <ajax:ValidatorCalloutExtender ID="rfv_txtPassword_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfv_txtPassword">
                        </ajax:ValidatorCalloutExtender>
                    </label>
                </td>
            </tr>
            <tr>
                <td align="right" width="14%">
                    <br />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" class="texto_tablas">
                    &nbsp;
                </td>
                <td class="bienvenida" width="57%">
                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" ValidationGroup="Ingresar"
                        OnClick="btnIngresar_Click1" />
                </td>
            </tr>
            <tr>
                <td align="right" class="texto_tablas">
                    &nbsp;
                </td>
                <td class="bienvenida" width="57%">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" class="texto_tablas">
                    &nbsp;
                </td>
                <td class="bienvenida" width="57%">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Image ID="Image1" runat="server" Width="13" Height="5" ImageUrl="~/Images/bullet_home.jpg"
                        AlternateText="Recordar Contraseña" ToolTip="Recordar Contraseña" />
                </td>
                <td>
                    <h7>
                    <asp:LinkButton ID="lnkRecordarContrasena" runat="server" PostBackUrl="~/OlvidoPassword.aspx" >Recordar Contraseña</asp:LinkButton>
                        </h7>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Image ID="Image2" runat="server" Width="13" Height="5" ImageUrl="~/Images/bullet_home.jpg"
                        AlternateText="Registrarme por primera vez" ToolTip="Registrarme por primera vez" />
                </td>
                <td>
                    <h7>
                    <asp:LinkButton ID="lnkRegistrarme" runat="server" PostBackUrl="~/Registro.aspx" >Registrarme por primera vez</asp:LinkButton>
                    </h7>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel runat="server" ID="pnlUsuario" Visible="false">
        <div style="text-align: center">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td>
                        <table width="89%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="5%">
                                </td>
                                <td style="text-align: left">
                                    <h1>
                                        <strong>Bienvenido (a):</strong>
                                    </h1>
                                </td>
                            </tr>
                            <tr>
                                <td width="5%">
                                </td>
                                <td style="text-align: left">
                                    <asp:HyperLink ID="lnkUsuario" runat="server">
                                        <asp:Label ID="lblUsuario" runat="server" Text=""></asp:Label>
                                    </asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td width="5%">
                                </td>
                                <td style="text-align: left">
                                    <asp:Image ID="imgActualizarDatos" runat="server" Width="13" Height="5" ImageUrl="~/Images/bullet_home.jpg" />
                                    <asp:LinkButton ID="lnkActualizarDatos" runat="server" OnClick="lnkActualizarDatos_Click">Actualizar Datos</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td width="5%">
                                </td>
                                <td style="text-align: left">
                                    <asp:Image ID="imgCambiarContrasena" runat="server" Width="13" Height="5" ImageUrl="~/Images/bullet_home.jpg" />
                                    <asp:LinkButton ID="lnkCambiarContrasena" runat="server" OnClick="lnkCambiarContrasena_Click">Cambiar Contraseña</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td width="5%">
                                </td>
                                <td style="text-align: left">
                                    <asp:Image ID="imgCerrarSesion" runat="server" Width="13" Height="5" ImageUrl="~/Images/bullet_home.jpg" />
                                    <asp:LinkButton ID="lnkCerrarSesion" runat="server" OnClick="lnkCerrarSesion_Click">Cerrar Sesión</asp:LinkButton>
                                    &nbsp;&nbsp;
                                    <asp:LinkButton ID="lnkAdministrador" runat="server" Visible="false" OnClick="lnkAdministrador_Click">Administrador</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <br />
    <asp:Panel ID="pnlOptions" runat="server">
        <uc1:ActualizarDatos ID="usc_ActualizarDatos" runat="server" Visible="false" />
        <uc2:CambiarContraseña ID="usc_CambiarContraseña" runat="server" Visible="false" />
    </asp:Panel>
</asp:Content>
