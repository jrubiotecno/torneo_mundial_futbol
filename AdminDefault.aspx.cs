#region "Using"
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using BLL;
#endregion

namespace PollaMundialista
{
    public partial class AdminDefault : System.Web.UI.Page
    {
        Usuario objUsuario = new Usuario(HttpContext.Current);

        #region "Metodos Eventos"

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {

            #region "Verificar Sesion"
            if (Session["UsuarioSesionID"] == null)
            {
                General.MostrarAlertaRetornar(this.Page, "Su sesión ha caducado.", "Default.aspx");
            }
            if (!objUsuario.Autenticado || !objUsuario.Admin)
            {
                Response.Redirect("~/AdminDefault.aspx");
            }
            #endregion

            if (!Page.IsPostBack)
            {

            }
        }
        #endregion

        #region "Page_Init"
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.QueryString["ItemMenu"] != null && !string.IsNullOrEmpty(Request.QueryString["ItemMenu"]))
            {
                SeleccionarOpcionMenu(Request.QueryString["ItemMenu"]);
            }
        }
        #endregion

        #region "Menu1_MenuItemClick"
        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            Response.Redirect("AdminDefault.aspx?ItemMenu=" + Menu1.SelectedValue);
        }
        #endregion

        #endregion

        #region "Metodos Privados"

        #region "SeleccionarOpcionMenu"
        private void SeleccionarOpcionMenu(string MenuID)
        {
            if (MenuID == "1")
            {
                Control newControl = TemplateControl.LoadControl("UserControls/Admin/Estadio.ascx");
                contentPNL.Controls.Add(newControl);
                return;
            }
            if (MenuID == "2")
            {
                Control newControl = TemplateControl.LoadControl("UserControls/Admin/Grupo.ascx");
                contentPNL.Controls.Add(newControl);
                return;
            }
            if (MenuID == "3")
            {
                Control newControl = TemplateControl.LoadControl("UserControls/Admin/Pais.ascx");
                contentPNL.Controls.Add(newControl);
                return;
            }
            if (MenuID == "4")
            {
                objUsuario.CerrarSesion();
                Response.Redirect("~/");
            }
            if (MenuID == "5")
            {
                Control newControl = TemplateControl.LoadControl("UserControls/Admin/Fase.ascx");
                contentPNL.Controls.Add(newControl);
                return;
            }
            if (MenuID == "6")
            {
                Control newControl = TemplateControl.LoadControl("UserControls/Admin/GrupoPais.ascx");
                contentPNL.Controls.Add(newControl);
                return;
            }
            if (MenuID == "7")
            {
                Control newControl = TemplateControl.LoadControl("UserControls/Admin/Partido.ascx");
                contentPNL.Controls.Add(newControl);
                return;
            }
            if (MenuID == "8")
            {
                Control newControl = TemplateControl.LoadControl("UserControls/Admin/Usuarios.ascx");
                contentPNL.Controls.Add(newControl);
                return;
            }
            if (MenuID == "9")
            {
                Control newControl = TemplateControl.LoadControl("UserControls/Admin/ActualizarEstadisticasPartidos.ascx");
                contentPNL.Controls.Add(newControl);
                return;
            }
            if (MenuID == "10")
            {
                Control newControl = TemplateControl.LoadControl("UserControls/Admin/ActualizarPuntosUsuario.ascx");
                contentPNL.Controls.Add(newControl);
                return;
            }
        }
        #endregion

        #endregion
    }
}