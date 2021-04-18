<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GrupoPais.ascx.cs" Inherits="PollaMundialista.UserControls.Admin.GrupoPais" %>

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
    <a>Asociar Paises a Grupos</a>
    <br />
    <br />
    <a>Grupo: </a>
    <asp:DropDownList ID="ddlGrupo" runat="server" DataSourceID="odsGrupo" DataTextField="GrupoNombre"
        DataValueField="GrupoID" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="ddlGrupo_SelectedIndexChanged">
        <asp:ListItem Text="Todos" Value="-1"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:GridView ID="gvGrupoPais" runat="server" CellPadding="4" ForeColor="#333333"
        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" RowStyle-HorizontalAlign="Center"
        DataKeyNames="GrupoID,PaisID" DataSourceID="odsGrupoPais">
        <Columns>
            <asp:BoundField DataField="GrupoID" HeaderText="Grupo ID" ReadOnly="True" SortExpression="GrupoID"
                Visible="false" />
            <asp:BoundField DataField="GrupoNombre" HeaderText="Grupo" SortExpression="GrupoNombre" />
            <asp:BoundField DataField="PaisID" HeaderText="Pais ID" ReadOnly="True" SortExpression="PaisID"
                Visible="false" />
            <asp:BoundField DataField="PaisNombre" HeaderText="Pais" SortExpression="PaisNombre" />
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image runat="server" ID="imgPais" ImageUrl='<%# "~/Images/Paises/" + Eval("PaisID") + ".png" %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="fuPais" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle HorizontalAlign="Center"></RowStyle>
    </asp:GridView>
</center>
<asp:Panel runat="server" ID="pnlAgregarEquiposGrupos" GroupingText="Asociar Equipos a Grupo:"
    Width="820px">
    <div style="width: 800px">
        <table style="width: 100%;">
            <tr>
                <td>
                    Grupo:
                </td>
                <td>
                    <asp:DropDownList ID="ddlGrupoInsert" runat="server" DataSourceID="odsGrupo" DataTextField="GrupoNombre" CausesValidation="true"
                        DataValueField="GrupoID" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="ddlGrupoInsert_SelectedIndexChanged">
                        <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Equipos:
                </td>
                <td>
                    <asp:CheckBoxList ID="chkPaises" runat="server" DataSourceID="odsPaises" DataTextField="PaisNombre"
                        DataValueField="PaisID" RepeatColumns="4">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="btnAccept" runat="server" Text="Aceptar" ValidationGroup="Insertar"
                        OnClick="btnAccept_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
<asp:ObjectDataSource ID="odsGrupo" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="ConsultarGrupos" TypeName="BLL.GrupoBLL"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsGrupoPais" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="ConsultarGrupoPais" TypeName="BLL.GrupoPaisBLL">
    <SelectParameters>
        <asp:Parameter DefaultValue="-1" Name="GrupoID" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsPaises" runat="server" SelectMethod="ConsultarPais"
    TypeName="BLL.PaisBLL" OldValuesParameterFormatString="original_{0}">
    <SelectParameters>
        <asp:Parameter Name="PaisNombre" Type="String" DefaultValue="" />
    </SelectParameters>
</asp:ObjectDataSource>
