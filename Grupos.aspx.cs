#region "Using"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
#endregion

namespace PollaMundialista
{
    public partial class Grupos : System.Web.UI.Page
    {
        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region "lnkGrupo_Click"
        protected void lnkGrupo_Click(object sender, EventArgs e)
        {
            LinkButton lnkGrupo = new LinkButton();
            lnkGrupo = (LinkButton)sender;
            string GrupoID = string.Empty;
            GrupoID = lnkGrupo.CommandArgument;

            odsEquiposGrupos.SelectParameters["GrupoID"].DefaultValue = GrupoID;
            lblGrupo.Text = string.Concat("Grupo ", lnkGrupo.Text, ".");
            //odsPartidos.SelectParameters["FechaPartido"] = new Parameter("FechaPartido", DbType.Int32, string.Empty);
            grdEquiposGrupos.DataBind();

        }
        #endregion

        #region "rptGrupos_ItemDataBound"
        protected void rptGrupos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton lnkGrupo = new LinkButton();
            lnkGrupo = (LinkButton)e.Item.FindControl("lnkGrupo");

            ////Definicion para accesar el source del repeater
            DataRowView drvFileContent = (DataRowView)e.Item.DataItem;

            lnkGrupo.Text = drvFileContent.Row["GrupoNombre"].ToString();
            lnkGrupo.CommandArgument = drvFileContent.Row["GrupoID"].ToString();
        }
        #endregion
    }
}