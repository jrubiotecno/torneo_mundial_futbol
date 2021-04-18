<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CambiarContraseña.ascx.cs"
    Inherits="PollaMundialista.UserControls.CambiarContraseña" %>
<table width="100%" border="0" cellspacing="5" cellpadding="0">
    <tr>
        <td height="30" align="right">
            &nbsp;
        </td>
        <td align="left">
            <h1>
                CAMBIAR CONTRASEÑA</h1>
            <br />
        </td>
    </tr>
    <tr>
        <td width="35%" align="right">
            <h7>
                    Contraseña Actual:
                </h7>
        </td>
        <td width="65%" align="left">
            <asp:TextBox ID="txtPassword" runat="server" MaxLength="50" Width="250px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_txtPassword" runat="server" ControlToValidate="txtPassword"
                SetFocusOnError="true" Display="None" ValidationGroup="Actualizar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender ID="rfv_txtPassword_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="rfv_txtPassword">
            </ajax:ValidatorCalloutExtender>
        </td>
    </tr>
    <tr>
        <td align="right">
            <h7>Nueva Contraseña:
                </h7>
        </td>
        <td align="left">
            <asp:TextBox ID="txtNewPassword" runat="server" MaxLength="60" Width="250px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_txtNewPassword" runat="server" ControlToValidate="txtNewPassword"
                SetFocusOnError="true" Display="None" ValidationGroup="Actualizar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender ID="rfv_txtNewPassword_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="rfv_txtNewPassword">
            </ajax:ValidatorCalloutExtender>
        </td>
    </tr>
    <tr>
        <td align="right">
            <h7>Repetir Nueva Contraseña:
                </h7>
        </td>
        <td align="left">
            <asp:TextBox ID="txtNewPassword2" runat="server" MaxLength="20" Width="250px"
                TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_txtNewPassword2" runat="server" ControlToValidate="txtNewPassword2"
                SetFocusOnError="true" Display="None" ValidationGroup="Actualizar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender ID="rfv_txtNewPassword2_ValidatorCalloutExtender"
                runat="server" Enabled="True" TargetControlID="rfv_txtNewPassword2">
            </ajax:ValidatorCalloutExtender>
            <asp:CompareValidator ID="cv_txtConfirmePassword" runat="server" ControlToCompare="txtNewPassword"
                ControlToValidate="txtNewPassword2" Display="None" ErrorMessage="La contraseña no coincide."
                SetFocusOnError="True"></asp:CompareValidator>
            <ajax:ValidatorCalloutExtender ID="cv_txtConfirmePassword_ValidatorCalloutExtender"
                runat="server" Enabled="True" TargetControlID="cv_txtConfirmePassword">
            </ajax:ValidatorCalloutExtender>
        </td>
    </tr>
    <tr>
        <td align="right">
            &nbsp;
        </td>
        <td align="left" class="texto_autorizo">
        </td>
    </tr>
    <tr>
        <td height="30" align="right">
            &nbsp;
        </td>
        <td align="left">
            <asp:Button ID="btnInsertar" runat="server" Text="Guardar" OnClick="btnInsertar_Click"
                ValidationGroup="Actualizar" />
            &nbsp;<asp:Label ID="lblInfo" runat="server" Text="" Font-Bold="true"></asp:Label>
        </td>
    </tr>
</table>
