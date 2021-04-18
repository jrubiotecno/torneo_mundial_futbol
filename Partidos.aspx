<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Partidos.aspx.cs" Inherits="PollaMundialista.Partidos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="830" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top">
            <td width="650">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="text-align: center; font-weight: bold">
                            <h1>
                                Partidos
                            </h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; font-weight: bold">
                            Fecha:
                            <asp:DropDownList ID="ddlFechas" runat="server" AutoPostBack="True" DataSourceID="odsFechas"
                                DataTextField="FechaPartido" DataValueField="FechaPartido" DataTextFormatString="{0:D}"
                                AppendDataBoundItems="true" OnSelectedIndexChanged="ddlFechas_SelectedIndexChanged">
                                <asp:ListItem Text="Todos" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="grdPartidos" runat="server" AutoGenerateColumns="False" Width="100%"
                                AllowPaging="True" AllowSorting="True" DataKeyNames="PartidoID" DataSourceID="odsPartidos"
                                OnSelectedIndexChanged="grdPartidos_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="FechaPartido" SortExpression="FechaPartido" ReadOnly="true"
                                        HeaderText="Fecha del Partido" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:F}">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FaseNombre" SortExpression="FaseNombre" HeaderText="Fase"
                                        ReadOnly="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="EstadioNombre" SortExpression="EstadioNombre" HeaderText="Estadio"
                                        ReadOnly="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Image runat="server" ID="imgPais1" ToolTip='<%# Eval("PaisNombreLocal") %>'
                                                AlternateText='<%# Eval("PaisNombreLocal") %>' ImageUrl='<%# "~/Images/Paises/" + Eval("PaisLocalID") + ".png" %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PaisNombreLocal" SortExpression="PaisNombreLocal" HeaderText="Pais"
                                        ReadOnly="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="GolesPaisLocal" SortExpression="GolesPaisLocal" HeaderText="Goles"
                                        ReadOnly="true" ItemStyle-HorizontalAlign="Center" NullDisplayText="-">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Image runat="server" ID="imgPais2" ToolTip='<%# Eval("PaisNombreVisitante") %>'
                                                AlternateText='<%# Eval("PaisNombreVisitante") %>' ImageUrl='<%# "~/Images/Paises/" + Eval("PaisVisitanteID") + ".png" %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PaisNombreVisitante" SortExpression="PaisNombreVisitante"
                                        HeaderText="Pais" ReadOnly="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="GolesPaisVisitante" SortExpression="GolesPaisVisitante"
                                        ReadOnly="true" HeaderText="Goles" ItemStyle-HorizontalAlign="Center" NullDisplayText="-">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:CommandField ButtonType="Image" ShowSelectButton="true" SelectImageUrl="~/Images/list-icon.png"
                                        ItemStyle-HorizontalAlign="Center" />
                                </Columns>
                                <PagerStyle CssClass="pgr" />
                                <AlternatingRowStyle CssClass="alt" />
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
            <td width="5">
                &nbsp;
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
            height: 400px; width: 650px">
            <div style="text-align: left">
                [<asp:LinkButton ID="lbtCloseDetail" Font-Bold="true" runat="server" OnClick="lbtCloseDetail_Click">Cerrar</asp:LinkButton>]<br />
                <br />
            </div>
            <asp:UpdatePanel runat="server" ID="upnResultados">
                <ContentTemplate>
                    <asp:GridView ID="gvResultado" runat="server" AutoGenerateColumns="False" Width="100%"
                        AllowPaging="True" AllowSorting="True" DataSourceID="odsResultados" OnSelectedIndexChanged="grdPartidos_SelectedIndexChanged">
                        <HeaderStyle />
                        <Columns>
                            <asp:BoundField DataField="NombresApellidos" HeaderText="Nombres y Apellidos" ReadOnly="True"
                                SortExpression="NombresApellidos" />
                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Image runat="server" ID="imgPais2" ToolTip='<%# Eval("PaisNombreLocal") %>'
                                        BorderColor="Black" AlternateText='<%# Eval("PaisNombreLocal") %>' ImageUrl='<%# "~/Images/Paises/" + Eval("PaisLocalID") + ".png" %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="PaisNombreLocal" HeaderText="Pais" SortExpression="PaisNombreLocal"
                                ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="GolesPaisLocal" SortExpression="GolesPaisLocal" HeaderText="Goles"
                                ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Image runat="server" ID="imgPais2" ToolTip='<%# Eval("PaisNombreVisitante") %>'
                                        BorderColor="Black" AlternateText='<%# Eval("PaisNombreVisitante") %>' ImageUrl='<%# "~/Images/Paises/" + Eval("PaisVisitanteID") + ".png" %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="PaisNombreVisitante" HeaderText="Pais" SortExpression="PaisNombreVisitante"
                                ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="GolesPaisVisitante" HeaderText="Goles" SortExpression="GolesPaisVisitante"
                                ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="Puntos" HeaderText="Puntos" SortExpression="Puntos" ItemStyle-HorizontalAlign="Center" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <asp:ObjectDataSource ID="odsPartidos" runat="server" SelectMethod="ConsultarPartidos"
        TypeName="BLL.PartidoBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="-1" Name="FaseID" Type="Int32" />
            <asp:Parameter DefaultValue="" Name="FechaPartido" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsFechas" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="ConsultarFechas" TypeName="BLL.PartidoBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsResultados" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="ConsultarPartidoResultado" TypeName="BLL.PartidoResultadoBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="-1" Name="PartidoID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
