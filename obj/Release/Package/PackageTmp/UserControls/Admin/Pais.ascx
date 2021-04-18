<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pais.ascx.cs" Inherits="PollaMundialista.UserControls.Admin.Pais" %>
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
<a>Administrar Paises</a>
<br />
<br />
<asp:Panel runat="server" ID="Panel1" GroupingText="Consultar">
    <center>
        <a>Pais:</a>
        <asp:TextBox ID="txtPais" runat="server"></asp:TextBox>
        <asp:Button ID="btnConsultar" runat="server" OnClick="btnConsultar_Click" Text="Consultar" />
    </center>
</asp:Panel>
<br />
<br />
<center>
    <asp:GridView ID="gvPais" runat="server" CellPadding="4" ForeColor="#333333" AllowPaging="True"
        AllowSorting="True" AutoGenerateColumns="False" RowStyle-HorizontalAlign="Center"
        DataKeyNames="PaisID" DataSourceID="odsPais" 
        onrowupdated="gvPais_RowUpdated">
        <Columns>
            <asp:BoundField DataField="PaisID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="PaisID" />
            <asp:BoundField DataField="PaisNombre" HeaderText="Nombre" SortExpression="PaisNombre" />
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image runat="server" ID="imgPais" ImageUrl='<%# "~/Images/Paises/" + Eval("PaisID") + ".png" %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="fuPais" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
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
<asp:Panel runat="server" ID="pnlAgregarPais" GroupingText="Insertar Pais" Width="620px">
    <div style="width: 500px">
        <table style="width: 100%;">
            <tr>
                <td class="style2">
                    Nombre:
                </td>
                <td>
                    <asp:TextBox ID="txtNombrePais" runat="server" MaxLength="50" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_txtNombrePais" runat="server" ControlToValidate="txtNombrePais"
                        SetFocusOnError="true" Display="None" ValidationGroup="Insertar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                    <ajax:validatorcalloutextender id="rfv_txtNombrePais_ValidatorCalloutExtender" runat="server"
                        enabled="True" targetcontrolid="rfv_txtNombrePais">
                    </ajax:validatorcalloutextender>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Imagen:
                </td>
                <td class="style1">
                    <asp:FileUpload ID="fuPais" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="btnGuardar" runat="server" onclick="btnGuardar_Click" ValidationGroup="Insertar"
                        Text="Guardar" />

                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
<asp:ObjectDataSource ID="odsPais" runat="server" DeleteMethod="EliminarPais" OldValuesParameterFormatString="original_{0}"
    SelectMethod="ConsultarPais" TypeName="BLL.PaisBLL" UpdateMethod="EditarPais">
    <DeleteParameters>
        <asp:Parameter Name="original_PaisID" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:Parameter Name="PaisNombre" Type="String" DefaultValue="" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="PaisNombre" Type="String" />
        <asp:Parameter Name="original_PaisID" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>
