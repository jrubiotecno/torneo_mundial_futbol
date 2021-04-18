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
    public partial class Estadio : System.Web.UI.UserControl
    {
        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region "btnGuardar_Click"
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            InsertarGrupo();
        }
        #endregion

        #region "InsertarGrupo"
        /// <summary>
        /// Metodo que permite insertar un Grupo.
        /// </summary>
        protected void InsertarGrupo()
        {
            EstadioBLL objEstadioBLL = new EstadioBLL();
            objEstadioBLL.InsertarEstadio(txtNombreEstadio.Text.Trim());
            gvEstadio.DataBind();
            txtNombreEstadio.Text = string.Empty;
        }
        #endregion
    }
}