<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MisMarcadores.aspx.cs" Inherits="PollaMundialista.MisMarcadores" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top">
            <td width="615">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <h1>
                                Mis Marcadores
                            </h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <strong>FECHA:</strong>
                            <asp:DropDownList ID="ddlFechas" runat="server" AutoPostBack="True" DataSourceID="odsFechas"
                                DataTextFormatString="{0:D}" DataTextField="FechaPartido" DataValueField="FechaPartido"
                                OnSelectedIndexChanged="ddlFechas_SelectedIndexChanged" AppendDataBoundItems="true">
                                <asp:ListItem Value="" Text="Seleccione..."></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>FASE:</strong>
                            <asp:DropDownList ID="ddlFase" runat="server" AutoPostBack="True" AppendDataBoundItems="True"
                                DataSourceID="odsFase" DataTextField="FaseNombre" DataValueField="FaseID" OnSelectedIndexChanged="ddlFase_SelectedIndexChanged">
                                <asp:ListItem Value="-1" Text="Todas"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <asp:GridView ID="grdPartidos" runat="server" AutoGenerateColumns="False" Width="100%" PageSize="5"
                                AllowPaging="True" AllowSorting="True" PagerStyle-CssClass="pgr" DataKeyNames="PartidoID"
                                GridLines="None" AlternatingRowStyle-CssClass="alt" CssClass="mGrid" DataSourceID="odsPartidos"
                                OnSelectedIndexChanged="grdPartidos_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="FechaPartido" SortExpression="FechaPartido" ReadOnly="true"
                                        ItemStyle-Width="250px" HeaderText="Fecha del Partido" ItemStyle-HorizontalAlign="Center"
                                        DataFormatString="{0:F}">
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
                                    <asp:BoundField DataField="Puntos" SortExpression="Puntos" ReadOnly="true" HeaderText="Puntos"
                                        ItemStyle-HorizontalAlign="Center" NullDisplayText="-">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/ico_ok.gif" ShowSelectButton="true" />
                                </Columns>
                                <PagerStyle CssClass="pgr" />
                                <AlternatingRowStyle CssClass="alt" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="pnlMarcador" runat="server" GroupingText="Marcador" Width="100%">
                                <table width="100%">
                                    <tr>
                                        <td style="text-align: center; width: 273px">
                                            <strong>Fecha:
                                                <asp:Label ID="lblFechaPartido" runat="server" Text="" ></asp:Label></strong>
                                        </td>
                                        <td style="width: 143px">
                                            <asp:Image ID="imgPais1" runat="server" />
                                            <asp:Label ID="lblPais1" runat="server" Text=""></asp:Label>
                                            <asp:TextBox ID="txtMarcadorPais1" Style="text-align: center" runat="server" Width="25px"
                                                MaxLength="2"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_txtMarcadorPais1" runat="server" Display="None"
                                                SetFocusOnError="true" ControlToValidate="txtMarcadorPais1" ErrorMessage="Campo Obligatorio"
                                                ValidationGroup="Resultado"></asp:RequiredFieldValidator>
                                            <ajax:ValidatorCalloutExtender ID="rfv_txtMarcadorPais1_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="rfv_txtMarcadorPais1">
                                            </ajax:ValidatorCalloutExtender>
                                            <asp:CompareValidator ID="cv_txtMarcadorPais1" runat="server" ControlToValidate="txtMarcadorPais1"
                                                Display="None" SetFocusOnError="true" ValidationGroup="Resultado" Type="Integer"
                                                Operator="DataTypeCheck" ErrorMessage="Dato Incorrecto"></asp:CompareValidator>
                                            <ajax:ValidatorCalloutExtender ID="cv_txtMarcadorPais1_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="cv_txtMarcadorPais1">
                                            </ajax:ValidatorCalloutExtender>
                                            <asp:RangeValidator ID="rv_txtMarcadorPais1" runat="server" ErrorMessage="El Marcador debe estar entre 0 y 10"
                                                Display="None" ControlToValidate="txtMarcadorPais1" MinimumValue="0" MaximumValue="10"
                                                ValidationGroup="Resultado" SetFocusOnError="true" Type="Integer"></asp:RangeValidator>
                                            <ajax:ValidatorCalloutExtender ID="rv_txtMarcadorPais1_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="rv_txtMarcadorPais1">
                                            </ajax:ValidatorCalloutExtender>
                                        </td>
                                        <td style="width: 42px">
                                            VS.
                                        </td>
                                        <td>
                                            <asp:Image ID="imgPais2" runat="server" />
                                            <asp:Label ID="lblPais2" runat="server" Text=""></asp:Label>
                                            <asp:TextBox ID="txtMarcadorPais2" Style="text-align: center" runat="server" Width="25px"
                                                MaxLength="2"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_txtMarcadorPais2" runat="server" Display="None"
                                                SetFocusOnError="true" ControlToValidate="txtMarcadorPais2" ErrorMessage="Campo Obligatorio"
                                                ValidationGroup="Resultado"></asp:RequiredFieldValidator>
                                            <ajax:ValidatorCalloutExtender ID="rfv_txtMarcadorPais2_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="rfv_txtMarcadorPais2">
                                            </ajax:ValidatorCalloutExtender>
                                            <asp:CompareValidator ID="cv_txtMarcadorPais2" runat="server" ControlToValidate="txtMarcadorPais2"
                                                Display="None" SetFocusOnError="true" ValidationGroup="Resultado" Type="Integer"
                                                Operator="DataTypeCheck" ErrorMessage="Dato Incorrecto"></asp:CompareValidator>
                                            <ajax:ValidatorCalloutExtender ID="cv_txtMarcadorPais2_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="cv_txtMarcadorPais2">
                                            </ajax:ValidatorCalloutExtender>
                                            <asp:RangeValidator ID="rv_txtMarcadorPais2" runat="server" ErrorMessage="El Marcador debe estar entre 0 y 10"
                                                Display="None" ControlToValidate="txtMarcadorPais2" MinimumValue="0" MaximumValue="10"
                                                ValidationGroup="Resultado" SetFocusOnError="true" Type="Integer"></asp:RangeValidator>
                                            <ajax:ValidatorCalloutExtender ID="rv_txtMarcadorPais2_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="rv_txtMarcadorPais2">
                                            </ajax:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">
                                            <asp:Button ID="btnInsertar" runat="server" onclick="btnInsertar_Click" 
                                                Text="Guardar" ValidationGroup="Resultado" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            &nbsp; &nbsp; &nbsp;
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="odsPartidos" runat="server" SelectMethod="ConsultarPartidosUsuario"
        TypeName="BLL.PartidoResultadoBLL" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:Parameter DefaultValue="-1" Name="UsuarioID" Type="Int32" />
            <asp:Parameter DefaultValue="-1" Name="FaseID" Type="Int32" />
            <asp:Parameter DefaultValue="" Name="FechaPartido" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsFechas" runat="server" SelectMethod="ConsultarFechas"
        TypeName="BLL.PartidoBLL" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsFase" runat="server" SelectMethod="ConsultarFase" TypeName="BLL.FaseBLL"
        OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
</asp:Content>
