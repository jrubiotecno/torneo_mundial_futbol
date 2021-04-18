<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Partido.ascx.cs" Inherits="PollaMundialista.UserControls.Admin.Partido" %>
<center>
    <a>Administrar Partidos</a>
    <br />
    <br />
    <a>Fase:</a>
    <asp:DropDownList ID="ddlFase" runat="server" DataTextField="FaseNombre" DataValueField="FaseID"
        DataSourceID="odsFase" AppendDataBoundItems="true">
        <asp:ListItem Text="Todos" Value="-1"></asp:ListItem>
    </asp:DropDownList>
    &nbsp;<a>Fecha Partido:</a>
    <asp:TextBox ID="txtFechaPartidoConsultar" runat="server"></asp:TextBox>
    <ajax:CalendarExtender ID="txtFechaPartidoConsultar_CalendarExtender" runat="server"
        Enabled="True" TargetControlID="txtFechaPartidoConsultar" Format="dd/MM/yyyy">
    </ajax:CalendarExtender>
    &nbsp;<asp:Button ID="btnConsultar" runat="server" Text="Consultar" OnClick="btnConsultar_Click" />
    <br />
    <br />
    <asp:GridView ID="gvPartido" runat="server" CellPadding="4" ForeColor="#333333" AllowPaging="True"
        AllowSorting="True" AutoGenerateColumns="False" RowStyle-HorizontalAlign="Center"
        DataKeyNames="PartidoID" DataSourceID="odsPartidos">
        <Columns>
            <asp:BoundField DataField="PartidoID" HeaderText="PartidoID" InsertVisible="False"
                ReadOnly="True" SortExpression="PartidoID" />
            <asp:TemplateField HeaderText="Estadio" SortExpression="EstadioNombre">
                <ItemTemplate>
                    <%# Eval("EstadioNombre")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <%# Eval("EstadioNombre")%>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fase" SortExpression="FaseNombre">
                <ItemTemplate>
                    <%# Eval("FaseNombre")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <%# Eval("FaseNombre")%>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image runat="server" ID="imgPais1" ImageUrl='<%# "~/Images/Paises/" + Eval("PaisLocalID") + ".png" %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pais" SortExpression="PaisLocal">
                <ItemTemplate>
                    <%# Eval("PaisNombreLocal")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <%# Eval("PaisNombreLocal")%>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="GolesPaisLocal" SortExpression="GolesPaisLocal" HeaderText="Goles"
                ItemStyle-HorizontalAlign="Center" NullDisplayText="-">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image runat="server" ID="imgPais2" ImageUrl='<%# "~/Images/Paises/" + Eval("PaisVisitanteID") + ".png" %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pais" SortExpression="PaisNombreVisitante">
                <ItemTemplate>
                    <%# Eval("PaisNombreVisitante")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <%# Eval("PaisNombreVisitante")%>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="GolesPaisVisitante" SortExpression="GolesPaisVisitante"
                HeaderText="Goles" ItemStyle-HorizontalAlign="Center" NullDisplayText="-">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Fecha del Partido" SortExpression="FechaPartido">
                <ItemTemplate>
                    <%# Eval("FechaPartido")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <%# Eval("FechaPartido")%>
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
<asp:Panel runat="server" ID="pnlPartidos" GroupingText="Partido:" Width="820px">
    <div style="width: 800px">
        <table style="width: 100%;">
            <tr>
                <td>
                    Estadio:
                </td>
                <td>
                    <asp:DropDownList ID="ddlEstadio" runat="server" AppendDataBoundItems="True" DataSourceID="odsEstadio"
                        DataTextField="EstadioNombre" DataValueField="EstadioID">
                        <asp:ListItem Value="" Text="Seleccione..."></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_ddlEstadio" runat="server" ControlToValidate="ddlEstadio"
                        SetFocusOnError="true" Display="None" ValidationGroup="Insertar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="rfv_ddlEstadio_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="rfv_ddlEstadio">
                    </ajax:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td>
                    Fase:
                </td>
                <td>
                    <asp:DropDownList ID="ddlFaseInsert" runat="server" AppendDataBoundItems="True" DataSourceID="odsFase"
                        DataTextField="FaseNombre" DataValueField="FaseID">
                        <asp:ListItem Value="" Text="Seleccione..."></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_ddlFase" runat="server" ControlToValidate="ddlFase"
                        SetFocusOnError="true" Display="None" ValidationGroup="Insertar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="rfv_ddlFaseValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="rfv_ddlFase">
                    </ajax:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td>
                    Equipo Local:
                </td>
                <td>
                    <asp:DropDownList ID="ddlEquipo1" runat="server" AppendDataBoundItems="True" DataSourceID="odsPais"
                        DataTextField="PaisNombre" DataValueField="PaisID">
                        <asp:ListItem Value="" Text="Seleccione..."></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_ddlEquipo1" runat="server" ControlToValidate="ddlEquipo1"
                        SetFocusOnError="true" Display="None" ValidationGroup="Insertar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="rfv_ddlEquipo1_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="rfv_ddlEquipo1">
                    </ajax:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td>
                    Equipo Visitante:
                </td>
                <td>
                    <asp:DropDownList ID="ddlEquipo2" runat="server" AppendDataBoundItems="True" DataSourceID="odsPais"
                        DataTextField="PaisNombre" DataValueField="PaisID">
                        <asp:ListItem Value="" Text="Seleccione..."></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_ddlEquipo2" runat="server" ControlToValidate="ddlEquipo2"
                        SetFocusOnError="true" Display="None" ValidationGroup="Insertar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="frv_ddlEquipo2_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="rfv_ddlEquipo2">
                    </ajax:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td>
                    Fecha Partido:
                </td>
                <td>
                    <asp:TextBox ID="txtFechaPartido" runat="server"></asp:TextBox>
                    <ajax:CalendarExtender ID="txtFechaPartido_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="txtFechaPartido" Format="dd/MM/yyyy">
                    </ajax:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rfv_txtFechaPartido" runat="server" ControlToValidate="txtFechaPartido"
                        SetFocusOnError="true" Display="None" ValidationGroup="Insertar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="rfv_txtFechaPartido_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="rfv_txtFechaPartido">
                    </ajax:ValidatorCalloutExtender>
                    <asp:DropDownList ID="ddlHora" runat="server">
                        <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                        <asp:ListItem Value="1">11:00 AM</asp:ListItem>
                        <asp:ListItem Value="2">02:00 PM</asp:ListItem>
                        <asp:ListItem Value="3">03:00 PM</asp:ListItem>
                        <asp:ListItem Value="4">05:00 PM</asp:ListItem>
                        <asp:ListItem Value="5">08:00 PM</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_ddlHora" runat="server" ControlToValidate="ddlHora"
                        SetFocusOnError="true" Display="None" ValidationGroup="Insertar" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="rfv_ddlHora_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="rfv_ddlHora">
                    </ajax:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" 
                        ValidationGroup="Insertar" onclick="btnAceptar_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
<asp:ObjectDataSource ID="odsEstadio" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="ConsultarEstadio" TypeName="BLL.EstadioBLL"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsFase" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="ConsultarFase" TypeName="BLL.FaseBLL"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsPartidos" runat="server" DeleteMethod="EliminarPartido"
    InsertMethod="InsertarPartido" OldValuesParameterFormatString="original_{0}"
    SelectMethod="ConsultarPartidos" TypeName="BLL.PartidoBLL" UpdateMethod="EditarPartido">
    <DeleteParameters>
        <asp:Parameter Name="original_PartidoID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="EstadioID" Type="Int32" />
        <asp:Parameter Name="FaseID" Type="Int32" />
        <asp:Parameter Name="PaisLocalID" Type="Int32" />
        <asp:Parameter Name="PaisVisitanteID" Type="Int32" />
        <asp:Parameter Name="FechaPartido" Type="DateTime" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter DefaultValue="-1" Name="FaseID" Type="Int32" />
        <asp:Parameter DefaultValue="" Name="FechaPartido" Type="DateTime" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="original_PartidoID" Type="Int32" />
        <asp:Parameter Name="GolesPaisLocal" Type="Int32" />
        <asp:Parameter Name="GolesPaisVisitante" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsPais" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="ConsultarPais" TypeName="BLL.PaisBLL">
    <SelectParameters>
        <asp:Parameter Name="PaisNombre" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
