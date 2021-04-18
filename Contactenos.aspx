<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Contactenos.aspx.cs" Inherits="PollaMundialista.Contactenos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top">
            <td width="80">
            </td>
            <td width="460">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="text4" colspan="2" style="text-align: center; font-weight: 700">
                            <h1>
                                CONTACTENOS
                            </h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Nombre:</b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNombre" runat="server"  Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_txtNombre" runat="server" ControlToValidate="txtNombre"
                                Display="None" SetFocusOnError="true" ValidationGroup="Contactenos" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                            <ajax:ValidatorCalloutExtender ID="rfv_txtNombre_ValidatorCalloutExtender" runat="server"
                                Enabled="True" TargetControlID="rfv_txtNombre">
                            </ajax:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Correo Eléctronico:</b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCorreoElectronico" runat="server"  Width="300px" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_txtCorreoElectronico" runat="server" ControlToValidate="txtCorreoElectronico"
                                Display="None" SetFocusOnError="true" ValidationGroup="Contactenos" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                            <ajax:ValidatorCalloutExtender ID="rfv_txtCorreoElectronico_ValidatorCalloutExtender"
                                runat="server" Enabled="True" TargetControlID="rfv_txtCorreoElectronico">
                            </ajax:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Comentario:</b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtComentario" runat="server" TextMode="MultiLine"
                                Columns="12" Height="69px" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_txtComentario" runat="server" ControlToValidate="txtComentario"
                                Display="None" SetFocusOnError="true" ValidationGroup="Contactenos" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                            <ajax:ValidatorCalloutExtender ID="rfv_txtComentario_ValidatorCalloutExtender" runat="server"
                                Enabled="True" TargetControlID="rfv_txtComentario">
                            </ajax:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" ValidationGroup="Contactenos" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
