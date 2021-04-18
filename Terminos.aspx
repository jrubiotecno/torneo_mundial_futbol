<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Terminos.aspx.cs" Inherits="PollaMundialista.Terminos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h7>
<strong>Polla Mundialista - Inscripción $50.000 </strong> &nbsp;<asp:Label ID="lblPremio" runat="server" Text="" Font-Bold="true" ></asp:Label> <br />
        <ul style=" margin-left: 145px;text-align:justify">
        <li>La mecánica consiste en obtener puntos por acertar el resultado y/o el ganador o perdedor de los partidos del Mundial.</li>
        <li>Los puntos varían de acuerdo a la fase y se acumulan hasta la final.</li>
        <li>La prediccion se debera hacer sobre el resultado real del partido al finalizar los 90 o 120 minutos. No incluye definición por penalti.</li>
        <li>El ganador obtendra el 70% del dinero recogido, el segundo puesto el 20% y el tercer puesto el 10% restante.</li>
        <li>Los marcadores se podrán ingresar hasta 1 dia antes de cada partido.</li>
        <li>De no ingresar marcador, no se sumaran ningun tipo de puntos.</li>
        <li>Usuario que no cancele el dinero de la inscripción no podrá ingresar sus predicciones.</li>
        </ul>
        <br />
        Los Puntajes son:<br />
        <br />
        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-color:Gray; width:347pt" width="329">
            <colgroup>
                <col style="mso-width-source:userset;mso-width-alt:5668;width:116pt" 
                    width="155" />
                <col style="mso-width-source:userset;mso-width-alt:4534;width:93pt" 
                    width="124" />
                <col style="mso-width-source:userset;mso-width-alt:1828;width:38pt" 
                    width="50" />
            </colgroup>
            <tr height="20">
                <td height="20" 
                    
                    style="border: 1pt solid windowtext; background: #DAEEF3; height: 15.0pt; width: 184px; color: black; font-size: 11.0pt; font-weight: 700;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px;">
                    Fase</td>
                <td style="border: 1pt solid windowtext; background: #DAEEF3; width: 205px; color: black; font-size: 11.0pt; font-weight: 700;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px;">
                    Acertar</td>
                <td style="border: 1pt solid windowtext; background: #DAEEF3; width: 57px; color: black; font-size: 11.0pt; font-weight: 700;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px;">
                    Puntos</td>
            </tr>
            <tr height="20">
                <td 
                    
                    style="border: 1pt solid windowtext; height: 40px; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 184px;" 
                    rowspan="2">
                    Grupo</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 205px;">
                    Partido Ganador/Empate</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 57px;">
                    5</td>
            </tr>
            <tr height="20">
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 205px;">
                    Marcador</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 57px;">
                    10</td>
            </tr>
            <tr height="20">
                <td 
                    
                    style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 184px;" 
                    rowspan="2">
                    Octavos de Final</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 205px;">
                    Partido Ganador/Empate</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 57px;">
                    5</td>
            </tr>
            <tr height="20">
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 205px;">
                    Marcador</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 57px;">
                    10</td>
            </tr>
            <tr height="20">
                <td 
                    
                    style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 184px;" 
                    rowspan="2">
                    Cuartos de Final</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 205px;">
                    Partido Ganador/Empate</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 57px;">
                    5</td>
            </tr>
            <tr height="20">
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 205px;">
                    Marcador</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 57px;">
                    10</td>
            </tr>
            <tr height="20">
                <td 
                    
                    style="border: 1pt solid windowtext; height: 40px; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 184px;" 
                    rowspan="2">
                    Semifinal - 3 y 4<span style="mso-spacerun:yes">&nbsp; </span>Puesto</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 205px;">
                    Partido Ganador/Empate</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 57px;">
                    5</td>
            </tr>
            <tr height="20">
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 205px;">
                    Marcador</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 57px;">
                    10</td>
            </tr>
            <tr height="20">
                <td 
                    
                    style="border: 1pt solid windowtext; height: 40px; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 184px;" 
                    rowspan="2">
                    Final</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 205px;">
                    Partido Ganador/Empate</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 57px;">
                    10</td>
            </tr>
            <tr height="20">
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 205px;">
                    Marcador</td>
                <td style="border: 1pt solid windowtext; color: black; font-size: 11.0pt; font-weight: 400;  text-decoration: none;  text-align: center; vertical-align: middle; white-space: nowrap; padding-left: 1px; padding-right: 1px; padding-top: 1px; width: 57px;">
                    15</td>
            </tr>
        </table>
        </h7>
    </center>
</asp:Content>
