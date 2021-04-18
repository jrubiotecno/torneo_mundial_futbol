<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Estadio.ascx.cs" Inherits="PollaMundialista.UserControls.Admin.Estadio" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<style type="text/css">
    .style1
    {
        text-align: left;
    }
    .style2
    {
        text-align: right;
    }
</style>
<center>
    <a>Administrar Estadios</a>
    <br />
    <br />
    <asp:GridView ID="gvEstadio" runat="server" CellPadding="4" ForeColor="#333333" AllowPaging="True"
        AllowSorting="True" AutoGenerateColumns="False" RowStyle-HorizontalAlign="Center"
        DataKeyNames="EstadioID" DataSourceID="odsEstadio">
        <Columns>
            <asp:BoundField DataField="EstadioID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="EstadioID" />
            <asp:BoundField DataField="EstadioNombre" HeaderText="Nombre" SortExpression="EstadioNombre" />
            <asp:TemplateField HeaderText="Opciones">
                <FooterStyle HorizontalAlign="Center"></FooterStyle>
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                <ItemTemplate>
                    <asp:ImageButton ID="imgBtnEdit" ImageUrl="~/Images/ico_editar.gif" CommandName="Edit"
                        runat="server" AlternateText="Editar" ToolTip="Editar" />
                    <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Images/ico_eliminar.gif" CommandName="Delete"
                        runat="server" AlternateText="Eliminar" ToolTip="Eliminar" OnClientClick="return confirm('¿Esta seguro que desea eliminar\neste elemento?')" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ID="imgBtnUpdate" ImageUrl="~/Images/ico_ok.gif" CommandName="Update"
                        runat="server" AlternateText="Guardar" ToolTip="Guardar" ValidationGroup="vgEdit" />
                    <asp:ImageButton ID="imgBtnCancel" ImageUrl="~/Images/ico_eliminar.gif" CommandName="Cancel"
                        runat="server" AlternateText="Cancelar" ToolTip="Cancelar" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle HorizontalAlign="Center"></RowStyle>
    </asp:GridView>
</center>
<br />
<br />
<asp:Panel runat="server" ID="pnlAgregarEstadio" GroupingText="Insertar Estadio"
    Width="620px">
    <div style="width: 500px">
        <table style="width: 100%;">
            <tr>
                <td class="style2">
                    Nombre:
                </td>
                <td>
                    <asp:TextBox ID="txtNombreEstadio" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_txtNombreEstadio" runat="server" ControlToValidate="txtNombreEstadio"
                        SetFocusOnError="true" Display="None" ValidationGroup="Insertar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="rfv_txtNombreEstadio_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="rfv_txtNombreEstadio">
                    </ajax:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" ValidationGroup="Insertar"
                        Text="Guardar" />
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
<asp:ObjectDataSource ID="odsEstadio" runat="server" DeleteMethod="EliminarEstadio"
    OldValuesParameterFormatString="original_{0}" SelectMethod="ConsultarEstadio"
    TypeName="BLL.EstadioBLL" UpdateMethod="EditarEstadio">
    <DeleteParameters>
        <asp:Parameter Name="original_EstadioID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="EstadioNombre" Type="String" />
        <asp:Parameter Name="original_EstadioID" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>
