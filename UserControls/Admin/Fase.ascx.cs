#region "Using"
using System;
using BLL;
#endregion

namespace PollaMundialista.UserControls.Admin
{
    public partial class Fase : System.Web.UI.UserControl
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
            FaseBLL objFaseBLL = new FaseBLL();
            objFaseBLL.InsertarFase(txtNombreFase.Text.Trim());
            gvFase.DataBind();
        }
        #endregion
    }
}