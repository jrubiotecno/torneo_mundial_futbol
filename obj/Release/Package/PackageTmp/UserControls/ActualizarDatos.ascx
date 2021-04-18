<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActualizarDatos.ascx.cs"
    Inherits="PollaMundialista.UserControls.ActualizarDatos" %>
<table width="100%" border="0" cellspacing="5" cellpadding="0">
    <tr>
        <td height="30" align="right">
            &nbsp;
        </td>
        <td align="left">
            <h1>
                ACTUALIZAR DATOS</h1>
            <br />
        </td>
    </tr>
    <tr>
        <td width="35%" align="right">
            <h7>
                    Nombres:
                </h7>
        </td>
        <td width="65%" align="left">
            <asp:TextBox ID="txtNombres" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_txtNombres" runat="server" ControlToValidate="txtNombres"
                SetFocusOnError="true" Display="None" ValidationGroup="Actualizar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender ID="rfv_txtNombres_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="rfv_txtNombres">
            </ajax:ValidatorCalloutExtender>
        </td>
    </tr>
    <tr>
        <td align="right">
            <h7>
                    Apellidos:
                </h7>
        </td>
        <td align="left">
            <asp:TextBox ID="txtApellidos" runat="server" MaxLength="60" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_txtApellidos" runat="server" ControlToValidate="txtApellidos"
                SetFocusOnError="true" Display="None" ValidationGroup="Actualizar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender ID="rfv_txtApellidos_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="rfv_txtApellidos">
            </ajax:ValidatorCalloutExtender>
        </td>
    </tr>
    <tr>
        <td align="right">
            <h7>
                    Identificación:
                </h7>
        </td>
        <td align="left">
            <asp:TextBox ID="txtIdentificacion" runat="server" MaxLength="20" Enabled="false"
                Width="200px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            <h7>
                    Genero:
                </h7>
        </td>
        <td align="left">
            <asp:RadioButton ID="rbtMasculino" runat="server" Checked="true" Text="Masculino"
                GroupName="Datos" />
            &nbsp;<asp:RadioButton ID="rbtFemenino" runat="server" Text="Femenino" GroupName="Datos" />
        </td>
    </tr>
    <tr>
        <td align="right">
            <h7>
                    Correo Electronico:
                </h7>
        </td>
        <td align="left">
            <asp:TextBox ID="txtEmail" runat="server" MaxLength="40" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_txtEmail" runat="server" ControlToValidate="txtEmail"
                SetFocusOnError="true" Display="None" ValidationGroup="Actualizar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender ID="rfv_txtEmail_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="rfv_txtEmail">
            </ajax:ValidatorCalloutExtender>
            <asp:RegularExpressionValidator ID="revtxtEmail" runat="server" Display="None" ValidationGroup="Actualizar"
                SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ErrorMessage="Correo Eléctronico Incorrecto" ControlToValidate="txtEmail">
            </asp:RegularExpressionValidator>
            <ajax:ValidatorCalloutExtender ID="revtxtEmail_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="revtxtEmail">
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
