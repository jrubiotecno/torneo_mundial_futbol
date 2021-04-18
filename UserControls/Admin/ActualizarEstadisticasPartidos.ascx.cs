#region "Using"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
#endregion

namespace PollaMundialista.UserControls.Admin
{
    public partial class ActualizarEstadisticasPartidos : System.Web.UI.UserControl
    {

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        #endregion

        #region btnAceptar_Click
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            ActualizarEstadistica(-1);
        }
        #endregion

        #region "ActualizarEstadistica"
        protected void ActualizarEstadistica(int PartidoID)
        {
            PartidoBLL objPartidoBLL = new PartidoBLL();
            objPartidoBLL.ActualizarEstadisticaPartidos(PartidoID);
        }
        #endregion

    }
}