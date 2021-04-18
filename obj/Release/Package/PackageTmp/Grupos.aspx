<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Grupos.aspx.cs" Inherits="PollaMundialista.Grupos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top">
            <td width="415">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="font-weight: 700">
                            <h1>
                                Partidos -
                                <asp:Label ID="lblGrupo" runat="server" Text="Grupo A."></asp:Label>
                            </h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="grdEquiposGrupos" runat="server" AutoGenerateColumns="False" Width="100%"
                                AllowPaging="True" AllowSorting="True" PagerStyle-CssClass="pgr" PageSize="4"
                                DataSourceID="odsEquiposGrupos" GridLines="None" AlternatingRowStyle-CssClass="alt"
                                CssClass="mGrid">
                                <Columns>
                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Image runat="server" ID="imgPais" ToolTip='<%# Eval("PaisNombre") %>' ImageUrl='<%# "~/Images/Paises/" + Eval("PaisID") + ".png" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PaisNombre" SortExpression="PaisNombre" HeaderText="Pais"
                                        ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="PartidosJugados" SortExpression="PartidosJugados" HeaderText="PJ"
                                        ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="PartidosGanados" SortExpression="PartidosGanados" HeaderText="PG"
                                        ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="PartidosEmpatados" SortExpression="PartidosEmpatados"
                                        HeaderText="PE" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="PartidosPerdidos" SortExpression="PartidosPerdidos" HeaderText="PP"
                                        ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="GolesFavor" SortExpression="GolesFavor" HeaderText="GF"
                                        ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="GolesContra" SortExpression="GolesContra" HeaderText="GC"
                                        ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="DiferenciaGoles" SortExpression="DiferenciaGoles" HeaderText="DG"
                                        ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Puntos" SortExpression="Puntos" HeaderText="Puntos" ItemStyle-HorizontalAlign="Center" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
            <td width="35">
                &nbsp;
            </td>
            <td width="100">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="font-weight: 700">
                            <h1>
                                Grupos
                            </h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ul>
                                <asp:Repeater ID="rptGrupos" runat="server" OnItemDataBound="rptGrupos_ItemDataBound"
                                    DataSourceID="odsGrupos">
                                    <ItemTemplate>
                                        <li>
                                            <h7>
                                                <asp:LinkButton OnClick="lnkGrupo_Click" ID="lnkGrupo" runat="server" Text=""></asp:LinkButton>
                                        </li>
                                        </h7>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="odsGrupos" runat="server" SelectMethod="ConsultarGrupos"
        TypeName="BLL.GrupoBLL" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsEquiposGrupos" runat="server" SelectMethod="ConsultarGrupoPais"
        TypeName="BLL.GrupoPaisBLL" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="GrupoID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
