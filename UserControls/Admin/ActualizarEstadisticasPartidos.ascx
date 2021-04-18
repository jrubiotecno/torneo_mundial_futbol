<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActualizarEstadisticasPartidos.ascx.cs" Inherits="PollaMundialista.UserControls.Admin.ActualizarEstadisticasPartidos" %>
<div style="width: 100%; font-size: 15px; font-weight: bold; text-align: center">
    </div>
<asp:Panel runat="server" ID="pnlAgregarPais" GroupingText="Actualizar Estadisticas"
    Width="820px">
    <div style="width: 800px">
        <table style="width: 100%;">
            <tr>
                <td>
                    Desea Actualizar los partigos Jugados, Ganados, Empatados, Perdidos, Goles a Favor,
                    En Contra, Diferencia y Puntos de los Partidos.
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnAceptar" runat="server" onclick="btnAceptar_Click" 
                        Text="Aceptar" />
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>