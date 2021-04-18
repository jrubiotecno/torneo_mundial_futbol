#region "Using"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
#endregion

namespace PollaMundialista.UserControls.Admin
{
    public partial class Usuarios : System.Web.UI.UserControl
    {

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }
        #endregion

        #region "btnConsultar_Click"
        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            BindGridView();
        }
        #endregion

        #region "BindGridView"
        protected void BindGridView()
        {
            odsUsuario.SelectParameters["Identificacion"].DefaultValue = txtIdentificacion.Text.Trim();
            gvUsuario.DataBind();
        }
        #endregion

    }
}