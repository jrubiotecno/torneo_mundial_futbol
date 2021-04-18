#region "Using"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PollaMundialista.DAL;
using BLL;
#endregion

namespace PollaMundialista
{
    public partial class Terminos : System.Web.UI.Page
    {

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadPremio();       
            }
        }
        #endregion

        #region "LoadPremio"
        protected void LoadPremio()
        {
            DSPollaMundialista.UsuarioDataTable dt = new DSPollaMundialista.UsuarioDataTable();
            UsuarioBLL objUsuarioBLL = new UsuarioBLL();

            dt = objUsuarioBLL.ConsultarUsuarios(string.Empty);

            if (dt != null)
            {
                if (dt.Rows.Count != 0)
                {
                    lblPremio.Text = string.Concat("Premio Aprox. ", (dt.Rows.Count * 50000).ToString("C0"));
                }
            }
        }
        #endregion

    }
}