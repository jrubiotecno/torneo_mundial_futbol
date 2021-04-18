<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="~/Registro.aspx.cs" Inherits="PollaMundialista.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%" border="0" cellspacing="5" cellpadding="0">
        <tr>
            <td height="30" align="right">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="35%" align="right">
                <h7>
                    Nombres:
                </h7>
            </td>
            <td width="65%" align="left">
                <asp:TextBox ID="txtNombres" runat="server" MaxLength="100" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txtNombres" runat="server" ControlToValidate="txtNombres"
                    SetFocusOnError="true" Display="None" ValidationGroup="Registro" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
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
                <asp:TextBox ID="txtApellidos" runat="server" MaxLength="100" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txtApellidos" runat="server" ControlToValidate="txtApellidos"
                    SetFocusOnError="true" Display="None" ValidationGroup="Registro" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
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
                <asp:TextBox ID="txtIdentificacion" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txtIdentificacion" runat="server" ControlToValidate="txtIdentificacion"
                    SetFocusOnError="true" Display="None" ValidationGroup="Registro" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                <ajax:ValidatorCalloutExtender ID="rfv_txtIdentificacion_ValidatorCalloutExtender"
                    runat="server" Enabled="True" TargetControlID="rfv_txtIdentificacion">
                </ajax:ValidatorCalloutExtender>
                <asp:CompareValidator ID="cv_txtIdentificacion" runat="server" ControlToValidate="txtIdentificacion"
                    Display="None" SetFocusOnError="true" ValidationGroup="Registro" Type="Double"
                    Operator="DataTypeCheck" ErrorMessage="Dato Incorrecto"></asp:CompareValidator>
                <ajax:ValidatorCalloutExtender ID="cv_txtIdentificacion_ValidatorCalloutExtender"
                    runat="server" Enabled="True" TargetControlID="cv_txtIdentificacion">
                </ajax:ValidatorCalloutExtender>
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
                    GroupName="Registro" />
                &nbsp;<asp:RadioButton ID="rbtFemenino" runat="server" Text="Femenino" GroupName="Registro" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <h7>
                    Correo Electronico:
                </h7>
            </td>
            <td align="left">
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="120" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txtEmail" runat="server" ControlToValidate="txtEmail"
                    SetFocusOnError="true" Display="None" ValidationGroup="Registro" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                <ajax:ValidatorCalloutExtender ID="rfv_txtEmail_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="rfv_txtEmail">
                </ajax:ValidatorCalloutExtender>
                <asp:RegularExpressionValidator ID="revtxtEmail" runat="server" Display="None" ValidationGroup="Registro"
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
                <h7>
                    Password:
                </h7>
            </td>
            <td align="left">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="200"
                    Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txtPassword" runat="server" ControlToValidate="txtPassword"
                    SetFocusOnError="true" Display="None" ValidationGroup="Registro" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                <ajax:ValidatorCalloutExtender ID="rfv_txtPassword_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="rfv_txtPassword">
                </ajax:ValidatorCalloutExtender>
            </td>
        </tr>
        <tr>
            <td align="right">
                <h7>
                    Confirme Password:
                </h7>
            </td>
            <td align="left">
                <asp:TextBox ID="txtConfirmePassword" runat="server" TextMode="Password" MaxLength="200"
                    Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txtConfirmePassword" runat="server" ControlToValidate="txtConfirmePassword"
                    SetFocusOnError="true" Display="None" ValidationGroup="Registro" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                <ajax:ValidatorCalloutExtender ID="rfv_txtConfirmePassword_ValidatorCalloutExtender"
                    runat="server" Enabled="True" TargetControlID="rfv_txtConfirmePassword">
                </ajax:ValidatorCalloutExtender>
                <asp:CompareValidator ID="cv_txtConfirmePassword" runat="server" ControlToCompare="txtPassword"
                    ControlToValidate="txtConfirmePassword" Display="None" ErrorMessage="La contraseña no coincide."
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
                <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click"
                    ValidationGroup="Registro" />
            </td>
        </tr>
    </table>
</asp:Content>
