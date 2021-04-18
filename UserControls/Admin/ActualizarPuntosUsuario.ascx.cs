#region "Using"
using System;
using BLL;
#endregion

namespace PollaMundialista.UserControls.Admin
{
    public partial class ActualizarPuntosUsuario : System.Web.UI.UserControl
    {
        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region "btnAceptar_Click"
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            PartidoBLL objPartidoBLL = new PartidoBLL();
            objPartidoBLL.ActualizarPuntosUsuarios(-1, int.Parse(ddlFase.SelectedValue));
        }
        #endregion

    }
}