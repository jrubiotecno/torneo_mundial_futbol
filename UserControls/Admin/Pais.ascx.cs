#region "Using"
using System;
using BLL;
using System.Web.UI.WebControls;
using System.IO;
#endregion

namespace PollaMundialista.UserControls.Admin
{
    public partial class Pais : System.Web.UI.UserControl
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

        #region "btnGuardar_Click"
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            InsertarPais();
        }
        #endregion

        #region "gvPais_RowUpdated"
        protected void gvPais_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            string PaisID = e.Keys["PaisID"].ToString();
            GridViewRow gvrGridViewRow = gvPais.Rows[gvPais.EditIndex];
            FileUpload fuPais = new FileUpload();
            fuPais = (FileUpload)gvrGridViewRow.FindControl("fuPais");
            if (fuPais.HasFile)
            {
                string ImageFileName = Request.PhysicalApplicationPath.ToString() + "\\Images\\Paises\\" + PaisID + ".png";
                File.Delete(ImageFileName);
                fuPais.SaveAs(ImageFileName);
            }
            gvPais.DataBind();
        }
        #endregion

        #region "BindGridView"
        protected void BindGridView()
        {
            odsPais.SelectParameters["PaisNombre"].DefaultValue = txtPais.Text.Trim();
            gvPais.DataBind();
        }
        #endregion

        #region "InsertarPais"
        /// <summary>
        /// Metodo que permite insertar una Pais.
        /// </summary>
        protected void InsertarPais()
        {
            PaisBLL objPaisBLL = new PaisBLL();
            int PaisID = objPaisBLL.InsertarPais(txtNombrePais.Text.Trim());
            GuardarImagen(PaisID.ToString());
            txtNombrePais.Text = string.Empty;
            gvPais.DataBind();
        }
        #endregion

        #region "GuardarImagen"
        private void GuardarImagen(string PaisID)
        {
            FileUpload fuPais = (FileUpload)pnlAgregarPais.FindControl("fuPais");
            if (fuPais.HasFile)
            {
                string ImageFileName = Request.PhysicalApplicationPath.ToString() + "\\Images\\Paises\\" + PaisID + ".png";
                fuPais.SaveAs(ImageFileName);
            }
        }
        #endregion

    }
}