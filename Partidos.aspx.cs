#region "Using"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
#endregion

namespace PollaMundialista
{
    public partial class Partidos : System.Web.UI.Page
    {

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }
        #endregion

        #region "ddlFechas_SelectedIndexChanged"
        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            odsPartidos.SelectParameters["FechaPartido"].DefaultValue = ddlFechas.SelectedValue;
            grdPartidos.DataBind();
        }
        #endregion

        #region "rptFechas_ItemDataBound"
        protected void rptFechas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton lnkFechas = new LinkButton();
            lnkFechas = (LinkButton)e.Item.FindControl("lnkFechas");

            ////Definicion para accesar el source del repeater
            DataRowView drvFileContent = (DataRowView)e.Item.DataItem;

            lnkFechas.Text = DateTime.Parse(drvFileContent.Row["FechaPartido"].ToString()).ToLongDateString();
            lnkFechas.CommandArgument = drvFileContent.Row["FechaPartido"].ToString();
        }
        #endregion

        #region "lnkTodos_Click"
        protected void lnkTodos_Click(object sender, EventArgs e)
        {
            odsPartidos.SelectParameters["FechaPartido"] = new Parameter("FechaPartido", DbType.Int32, string.Empty);
            grdPartidos.DataBind();
        }
        #endregion

        #region "grdPartidos_SelectedIndexChanged"
        protected void grdPartidos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string PartidoID = string.Empty;
            PartidoID = grdPartidos.SelectedDataKey.Value.ToString();
            if (!string.IsNullOrEmpty(PartidoID))
            {
                odsResultados.SelectParameters["PartidoID"].DefaultValue = PartidoID;
                gvResultado.DataBind();
                if (gvResultado.Rows.Count > 0)
                {
                    grdPartidos.SelectedIndex = -1;
                    mpe_Alerta.Show();
                }
                else
                {
                    General.MostrarAlerta(this.Page, "El partido no se ha Jugado.");
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