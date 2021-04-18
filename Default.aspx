<%@ Page Title="Polla Mundialista - Brasil 2014" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PollaMundialista._Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <center>
        <br />
        <h1>
            <b>Tabla de Posiciones</b>
        </h1>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr valign="top" align="center">
                <td width="560">
                    <br />
                    <br />
                    <asp:GridView ID="grdPuntaje" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        DataKeyNames="UsuarioID" AllowSorting="True" DataSourceID="odsPuntaje" PageSize="10"
                        OnSelectedIndexChanged="grdPuntaje_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Posicion" SortExpression="Posicion" HeaderText="Posición"
                                ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                            <asp:BoundField DataField="NombresApellidos" HeaderText="Nombres y Apellidos" SortExpression="NombresApellidos" />
                            <asp:BoundField DataField="TotalPuntos" HeaderText="Puntos" ItemStyle-HorizontalAlign="Center"
                                SortExpression="TotalPuntos" />
                            <asp:CommandField ButtonType="Image" ShowSelectButton="true" SelectImageUrl="~/Images/list-icon.png"
                                ItemStyle-HorizontalAlign="Center" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnmpe_Alerta" runat="server" Text="" Style="display: none" />
        <ajax:ModalPopupExtender ID="mpe_Alerta" runat="server" TargetControlID="btnmpe_Alerta"
            PopupControlID="pnlProcessDetail" CancelControlID="lbtCloseDetail" BackgroundCssClass="modalBackground"
            DropShadow="true">
        </ajax:ModalPopupExtender>
        <asp:Panel ID="pnlProcessDetail" runat="server">
            <div style="background-color: White; padding: 10px; border: 1px solid gray; overflow: auto;
                height: 380px; width: 670px; text-align: center;">
                <div style="text-align: left">
                    [<asp:LinkButton ID="lbtCloseDetail" Font-Bold="true" runat="server" OnClick="lbtCloseDetail_Click">Cerrar</asp:LinkButton>]<br />
                    <br />
                </div>
                <asp:UpdatePanel runat="server" ID="upnResultados">
                    <ContentTemplate>
                        <asp:GridView ID="gvUsuario" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                            AllowSorting="True" DataSourceID="odsUsuario" PageSize="10" OnSelectedIndexChanged="grdPuntaje_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="FaseNombre" HeaderText="Fase" ItemStyle-HorizontalAlign="Center"
                                    SortExpression="FaseNombre" />
                                <asp:BoundField DataField="FechaPartido" HeaderText="Fecha" SortExpression="FechaPartido"
                                    DataFormatString="{0:D}" />
                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="imgPais1" ToolTip='<%# Eval("PaisNombreLocal") %>'
                                            AlternateText='<%# Eval("PaisNombreLocal") %>' ImageUrl='<%# "~/Images/Paises/" + Eval("PaisLocalID") + ".png" %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="PaisNombreLocal" HeaderText="Pais" SortExpression="PaisNombreLocal" />
                                <asp:BoundField DataField="GolesPaisLocal" HeaderText="Goles" SortExpression="GolesPaisLocal" />
                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="imgPais2" ToolTip='<%# Eval("PaisNombreVisitante") %>'
                                            AlternateText='<%# Eval("PaisNombreVisitante") %>' ImageUrl='<%# "~/Images/Paises/" + Eval("PaisVisitanteID") + ".png" %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="PaisNombreVisitante" HeaderText="Pais" SortExpression="PaisNombreVisitante" />
                                <asp:BoundField DataField="GolesPaisVisitante" HeaderText="Goles" SortExpression="GolesPaisVisitante" />
                                <asp:BoundField DataField="Puntos" HeaderText="Puntos" SortExpression="Puntos" />
                            </Columns>
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </asp:Panel>
    </center>
    <asp:ObjectDataSource ID="odsUsuario" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="ConsultarPartidosUsuario" TypeName="BLL.PartidoResultadoBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="-1" Name="UsuarioID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsPuntaje" runat="server" SelectMethod="ConsultarPuntajeUsuarios"
        TypeName="BLL.UsuarioBLL" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
</asp:Content>
