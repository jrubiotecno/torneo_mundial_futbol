<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActualizarPuntosUsuario.ascx.cs"
    Inherits="PollaMundialista.UserControls.Admin.ActualizarPuntosUsuario" %>
<div style="width: 100%; font-size: 15px; font-weight: bold; text-align: center">
</div>
<asp:Panel runat="server" ID="pnlAgregarPais" GroupingText="Actualizar Estadisticas"
    Width="820px">
    <div style="width: 800px">
        <table style="width: 100%;">
            <tr>
                <td>
                    Desea Actualizar los puntajes de los usuarios segun el resultado de los partidos.
                </td>
            </tr>
            <tr>
                <td>
                    FASE:
                    <asp:DropDownList ID="ddlFase" runat="server" AutoPostBack="True" AppendDataBoundItems="True"
                        DataSourceID="odsFase" DataTextField="FaseNombre" DataValueField="FaseID">
                        <asp:ListItem Value="" Text="Seleccione..."></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_ddlFase" runat="server" ControlToValidate="ddlFase"
                        SetFocusOnError="true" Display="None" ValidationGroup="Insertar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="rfv_ddlFaseValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="rfv_ddlFase">
                    </ajax:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" ValidationGroup="Insertar"
                        OnClick="btnAceptar_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
<asp:ObjectDataSource ID="odsFase" runat="server" SelectMethod="ConsultarFase" TypeName="BLL.FaseBLL"
    OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
