#region "Using"
using System;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using BLL;
using System.Configuration;
using Entity;
#endregion

namespace PollaMundialista
{
    public partial class Login : System.Web.UI.Page
    {
        Usuario objUsuario = new Usuario(HttpContext.Current);

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {
            VerificarUsuario();
        }
        #endregion

        #region "btnIngresar_Click"
        protected void btnIngresar_Click1(object sender, EventArgs e)
        {
            AutenticarUsuario(txtIdentificacion.Text.Trim(), txtPassword.Text.Trim());
            VerificarUsuario();
        }
        #endregion

        #region "lnkCerrarSesion_Click"
        protected void lnkCerrarSesion_Click(object sender, EventArgs e)
        {
            Request.Cookies.Remove(FormsAuthentication.FormsCookieName);
            Response.Cookies.Remove(FormsAuthentication.FormsCookieName);

            objUsuario.CerrarSesion();
            Session.RemoveAll();
            lblUsuario.Text = string.Empty;
            pnlUsuario.Visible = false;
            pnlLogin.Visible = true;
            Response.Redirect(Page.Request.Path);
        }
        #endregion

        #region "lnkAdministrador_Click"
        protected void lnkAdministrador_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDefault.aspx");
        }
        #endregion

        #region "lnkActualizarDatos_Click"
        protected void lnkActualizarDatos_Click(object sender, EventArgs e)
        {
            usc_ActualizarDatos.Inicializar();
            usc_ActualizarDatos.Visible = true;
            usc_CambiarContraseña.Visible = false;
        }
        #endregion

        #region "lnkCambiarContrasena_Click"
        protected void lnkCambiarContrasena_Click(object sender, EventArgs e)
        {
            usc_CambiarContraseña.Inicializar();
            usc_ActualizarDatos.Visible = false;
            usc_CambiarContraseña.Visible = true;
        }
        #endregion

        #region "AutenticarUsuario"
        protected void AutenticarUsuario(string Identificacion, string Password)
        {
            #region "Definitions"
            int UsuarioID;
            UsuarioBLL objUsuarioBLL;
            #endregion
            #region "try"
            try
            {
                #region "Objects Instance"
                UsuarioID = 0;
                objUsuarioBLL = new UsuarioBLL();
                #endregion

                FormsAuthentication.Initialize();
                UsuarioID = objUsuarioBLL.AutenticarUsuario(txtIdentificacion.Text.Trim(), txtPassword.Text.Trim());

                if (UsuarioID != 0)
                {
                    string TiempoCookie = ConfigurationManager.AppSettings["TiempoCookie"];

                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, UsuarioID.ToString(), DateTime.Now, DateTime.Now.AddMinutes(double.Parse(TiempoCookie)), false, string.Empty, FormsAuthentication.FormsCookiePath);
                    string hash = FormsAuthentication.Encrypt(ticket);
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);
                    Response.Cookies.Add(cookie);
                    Response.Redirect(Page.Request.Path);
                }
            }
            #endregion
            #region "catch"
            catch (Exception ex)
            {
                General.MostrarAlerta(this.Page, ex.Message);
            }
            #endregion
            #region "finally"
            finally
            {
                objUsuarioBLL = null;
                GC.Collect();
            }
            #endregion
        }
        #endregion

        #region "VerificarUsuario"
        /// <summary>
        /// Metodo que identifica si el usuario esta logueado
        /// </summary>
        protected void VerificarUsuario()
        {
            pnlLogin.Visible = false;
            pnlUsuario.Visible = false;

            if (objUsuario.Autenticado)
            {
                pnlUsuario.Visible = true;
                lblUsuario.Text = string.Concat(objUsuario.Nombres, " ", objUsuario.Apellidos);
                if (objUsuario.Admin)
                {
                    lnkAdministrador.Visible = true;
                }
            }
            else
            {
                pnlLogin.Visible = true;
            }
        }
        #endregion

    }
}