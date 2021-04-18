#region "Using"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
#endregion

namespace PollaMundialista
{
    public partial class _Default : System.Web.UI.Page
    {

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        #endregion

        #region "grdPuntaje_SelectedIndexChanged"
        protected void grdPuntaje_SelectedIndexChanged(object sender, EventArgs e)
        {
            string UsuarioID = string.Empty;
            UsuarioID = grdPuntaje.SelectedDataKey.Value.ToString();
            if (!string.IsNullOrEmpty(UsuarioID))
            {
                odsUsuario.SelectParameters["UsuarioID"].DefaultValue = UsuarioID;
                gvUsuario.DataBind();
                grdPuntaje.SelectedIndex = -1;
                if (gvUsuario.Rows.Count > 0)
                {
                    mpe_Alerta.Show();
                }
                else
                {
                    mpe_Alerta.Hide();
                    General.MostrarAlerta(this.Page, "El usuario no tiene partidos.");
                }
            }
        }
        #endregion

        #region "lbtCloseDetail_Click"
        protected void lbtCloseDetail_Click(object sender, EventArgs e)
        {
            mpe_Alerta.Hide();
        }
        #endregion

    }
}
