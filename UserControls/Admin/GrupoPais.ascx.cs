#region "Using"
using System;
using System.Web.UI.WebControls;
using PollaMundialista.DAL;
using BLL;

#endregion

namespace PollaMundialista.UserControls.Admin
{
    public partial class GrupoPais : System.Web.UI.UserControl
    {

        #region "objProcessExecution_BLL"
        private GrupoPaisBLL _objGrupoPaisBLL = null;
        private GrupoPaisBLL objGrupoPaisBLL
        {
            get
            {
                if (_objGrupoPaisBLL == null)
                    _objGrupoPaisBLL = new GrupoPaisBLL();
                return _objGrupoPaisBLL;
            }
        }
        #endregion

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region "ddlGrupo_SelectedIndexChanged"
        protected void ddlGrupo_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridView();
        }
        #endregion

        #region "ddlGrupoInsert_SelectedIndexChanged"
        protected void ddlGrupoInsert_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarPaises(ddlGrupoInsert.SelectedValue.Trim());
        }
        #endregion

        #region "btnAccept_Click"
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            AsociarPaisGrupo();
        }
        #endregion

        #region "BindGridView"
        protected void BindGridView()
        {
            odsGrupoPais.SelectParameters["GrupoID"].DefaultValue = ddlGrupo.SelectedValue.Trim();
            gvGrupoPais.DataBind();
        }
        #endregion

        #region "CargarPaises"
        protected void CargarPaises(string GrupoID)
        {
            foreach (ListItem Pais in chkPaises.Items)
            {
                Pais.Selected = false;
            }
            if (!string.IsNullOrEmpty(GrupoID))
            {
                DSPollaMundialista.GrupoPaisDataTable dt = new DSPollaMundialista.GrupoPaisDataTable();
                dt = objGrupoPaisBLL.ConsultarGrupoPais(int.Parse(GrupoID));

                foreach (DSPollaMundialista.GrupoPaisRow Fila in dt.Rows)
                {
                    foreach (ListItem Pais in chkPaises.Items)
                    {
                        if (Fila.PaisID.ToString() == Pais.Value)
                        {
                            Pais.Selected = true;
                        }
                    }
                }
            }
        }
        #endregion

        #region "AsociarPaisGrupo"
        protected void AsociarPaisGrupo()
        {
            if (string.IsNullOrEmpty(ddlGrupoInsert.SelectedValue))
            {
                General.MostrarAlerta(this.Page, "Debe Seleccionar un Grupo.");
                return;
            }

            int GrupoID = int.Parse(ddlGrupoInsert.SelectedValue);
            objGrupoPaisBLL.EliminarGrupoPais(GrupoID);
            foreach (ListItem Pais in chkPaises.Items)
            {
                if (Pais.Selected)
                {
                    objGrupoPaisBLL.InsertarGrupoPais(GrupoID, int.Parse(Pais.Value));
                }
            }
            BindGridView();
        }
        #endregion

    }
}