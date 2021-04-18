<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.ascx.cs" Inherits="PollaMundialista.UserControls.Admin.Usuarios" %>
<style type="text/css">
    .style1
    {
        text-align: right;
    }
</style>
<center>
    <a>Administrar Usuarios</a>
    <br />
    <br />
</center>
<asp:Panel runat="server" ID="Panel1" GroupingText="Consultar">
    <center>
        <a>Identificacion:</a>
        <asp:TextBox ID="txtIdentificacion" runat="server"></asp:TextBox>
        <asp:Button ID="btnConsultar" runat="server" OnClick="btnConsultar_Click" Text="Consultar" />
    </center>
</asp:Panel>
<br />
<br />
<center>
    <asp:GridView ID="gvUsuario" runat="server" CellPadding="4" ForeColor="#333333" AllowPaging="True"
        AllowSorting="True" AutoGenerateColumns="False" ShowFooter="false" DataKeyNames="UsuarioID"
        DataSourceID="odsUsuario" RowStyle-HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="UsuarioID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="UsuarioID" />
            <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
            <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" SortExpression="Identificacion" />
            <asp:BoundField DataField="Genero" HeaderText="Genero" SortExpression="Genero" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
            <asp:CheckBoxField DataField="Admin" HeaderText="Administrador" SortExpression="Admin" />
            <asp:BoundField DataField="FechaRegistro" HeaderText="Fecha de Registro" SortExpression="FechaRegistro"
                ReadOnly="true" />
            <asp:TemplateField HeaderText="Opciones">
                <FooterStyle HorizontalAlign="Center"></FooterStyle>
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                <ItemTemplate>
                    <asp:ImageButton ID="imgBtnEdit" ImageUrl="~/Images/ico_editar.gif" CommandName="Edit"
                        runat="server" AlternateText="Editar" ToolTip="Editar" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ID="imgBtnUpdate" ImageUrl="~/Images/ico_ok.gif" CommandName="Update"
                        runat="server" AlternateText="Guardar" ToolTip="Guardar" ValidationGroup="vgEdit" />
                    <asp:ImageButton ID="imgBtnCancel" ImageUrl="~/Images/ico_eliminar.gif" CommandName="Cancel"
                        runat="server" AlternateText="Cancelar" ToolTip="Cancelar" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</center>
<asp:ObjectDataSource ID="odsUsuario" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="ConsultarUsuarios" TypeName="BLL.UsuarioBLL" UpdateMethod="UpdateUsuario">
    <SelectParameters>
        <asp:Parameter DefaultValue="" Name="Identificacion" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Original_UsuarioID" Type="Int32" />
        <asp:Parameter Name="Nombres" Type="String" />
        <asp:Parameter Name="Apellidos" Type="String" />
        <asp:Parameter Name="Genero" Type="String" />
        <asp:Parameter Name="Identificacion" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Activo" Type="Boolean" />
        <asp:Parameter Name="Admin" Type="Boolean" />
    </UpdateParameters>
</asp:ObjectDataSource>
