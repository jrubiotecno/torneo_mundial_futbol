#region "Using"
using System;
using Entity;
using BLL;
using PollaMundialista.DAL;
using System.Web;

#endregion

namespace PollaMundialista.UserControls
{
    public partial class CambiarContraseña : System.Web.UI.UserControl
    {

        Usuario objUsuario = new Usuario(HttpContext.Current);

        #region "objUsuarioBLL"
        private UsuarioBLL _objUsuarioBLL = null;
        private UsuarioBLL objUsuarioBLL
        {
            get
            {
                if (_objUsuarioBLL == null)
                    _objUsuarioBLL = new UsuarioBLL();
                return _objUsuarioBLL;
            }
        }
        #endregion

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region "btnInsertar_Click"
        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            CambiarPassword();
        }
        #endregion

        #region "Inicializar"
        public void Inicializar()
        {
            LimpiarForm();
        }
        #endregion

        #region "CambiarPassword"
        protected void CambiarPassword()
        {
            #region "Definitions"
            int UsrID;
            string PasswordEncriptado;
            #endregion
            #region "try"
            try
            {
                #region "Objects Instance"
                UsrID = 0;
                PasswordEncriptado = string.Empty;
                lblInfo.Text = string.Empty;
                #endregion

                UsrID = objUsuarioBLL.AutenticarUsuario(objUsuario.Identificacion.Trim(), txtPassword.Text.Trim());

                if (UsrID == 0)
                {
                    lblInfo.Text = "La contraseña es Incorrecta.";
                    return;
                }
                else
                {
                    if (txtNewPassword.Text.Trim() != txtNewPassword2.Text.Trim())
                    {
                        lblInfo.Text = "La contraseña nueva y la confirmación deben ser iguales.";
                        return;
                    }
                    else
                    {
                        PasswordEncriptado = Encrypt.EncryptString(txtNewPassword.Text.Trim()); 
                        objUsuarioBLL.CambiarContrasena(objUsuario.UsuarioID, PasswordEncriptado);
                    }
                }
                lblInfo.Text = "Datos Actualizados correctamente.";
            }
            #endregion
            #region "catch"
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
            }
            #endregion
            #region "finally"
            finally
            {
            }
            #endregion
        }
        #endregion

        #region "LimpiarForm"
        protected void LimpiarForm()
        {
            txtPassword.Text = string.Empty;
            txtNewPassword.Text = string.Empty;
            txtNewPassword2.Text = string.Empty;
            lblInfo.Text = string.Empty;
        }
        #endregion

    }
}