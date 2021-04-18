<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="OlvidoPassword.aspx.cs" Inherits="PollaMundialista.OlvidoPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%" border="0" cellspacing="5" cellpadding="0">
        <tr>
            <td height="30" align="right" style="width: 12%">
                &nbsp;
            </td>
            <td align="left">
                <h1>
                    CAMBIAR CONTRASEÑA</h1>
                <br />
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 12%">
                <h7>
                    Identificación:
                </h7>
            </td>
            <td width="65%" align="left">
                <asp:TextBox ID="txtIdentificacion" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txtIdentificacion" runat="server" ControlToValidate="txtIdentificacion"
                    SetFocusOnError="true" Display="None" ValidationGroup="Actualizar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                <ajax:ValidatorCalloutExtender ID="rfv_txtIdentificacion_ValidatorCalloutExtender"
                    runat="server" Enabled="True" TargetControlID="rfv_txtIdentificacion">
                </ajax:ValidatorCalloutExtender>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 12%">
                &nbsp;
            </td>
            <td align="left" class="texto_autorizo">
            </td>
        </tr>
        <tr>
            <td height="30" align="right" style="width: 12%">
                &nbsp;
            </td>
            <td align="left">
                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click"
                    ValidationGroup="Actualizar" />
                &nbsp;<asp:Button ID="btnVolver" runat="server" Text="Volver" 
                    onclick="btnVolver_Click" />
                &nbsp;<asp:Label ID="lblInfo" runat="server" Text="" Font-Bold="true"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
