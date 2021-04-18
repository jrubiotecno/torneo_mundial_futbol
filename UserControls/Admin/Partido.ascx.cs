#region "Using"
using System;
using BLL;
#endregion

namespace PollaMundialista.UserControls.Admin
{
    public partial class Partido : System.Web.UI.UserControl
    {

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {

        }        
        #endregion

        #region "btnConsultar_Click"
        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            BindGridView();
        }
        #endregion

        #region "btnAceptar_Click"
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            InsertarPartido();
        }
        #endregion

        #region "BindGridView"
        protected void BindGridView()
        {
            odsPartidos.SelectParameters["FaseID"].DefaultValue = ddlFase.SelectedValue.Trim();
            if (string.IsNullOrEmpty(txtFechaPartidoConsultar.Text))
            {
                odsPartidos.SelectParameters["FechaPartido"].DefaultValue = null;
            }
            else
            {
                odsPartidos.SelectParameters["FechaPartido"].DefaultValue = txtFechaPartidoConsultar.Text;
            }
            gvPartido.DataBind();
        }
        #endregion

        #region "InsertarPartido"
        protected void InsertarPartido()
        {
            PartidoBLL objPartidoBLL = new PartidoBLL();
            objPartidoBLL.InsertarPartido(int.Parse(ddlEstadio.SelectedValue), int.Parse(ddlFaseInsert.SelectedValue), int.Parse(ddlEquipo1.SelectedValue),
                                        int.Parse(ddlEquipo2.SelectedValue), DateTime.Parse(string.Concat(txtFechaPartido.Text, " ", ddlHora.SelectedItem.Text)));
            LimpiarForm();
            BindGridView();
        }
        #endregion

        #region "LimpiarForm"
        protected void LimpiarForm()
        {
            ddlEstadio.SelectedIndex = 0;
            ddlFaseInsert.SelectedIndex = 0;
            ddlEquipo1.SelectedIndex = 0;
            ddlEquipo2.SelectedIndex = 0;
            ddlHora.SelectedIndex = 0;
            txtFechaPartido.Text = string.Empty;
        }
        #endregion

    }
}