#region "Using"
using System;
using System.Web;
using Entity;
#endregion

namespace PollaMundialista
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        Usuario objUsuario = new Usuario(HttpContext.Current);

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {
            if (objUsuario.Autenticado)
            {
                lblLogin.Text = "Mi Cuenta";
                VerificarUsuario();
            }
            else
            {
                lblLogin.Text = "Login/Registrar";
            }
        }
        #endregion

        #region "VerificarUsuario"
        /// <summary>
        /// Metodo que identifica si el usuario esta logueado
        /// </summary>
        protected void VerificarUsuario()
        {
            
            if (objUsuario.Autenticado)
            {
                LabelLoginJr.Text = string.Concat(objUsuario.Nombres, " ", objUsuario.Apellidos);                
            }            
        }
        #endregion

    }
}
