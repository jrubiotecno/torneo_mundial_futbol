#region "Using"
using System;
using System.Web;
using Entity;
using BLL;
using PollaMundialista.DAL;
#endregion

namespace PollaMundialista.UserControls
{
    public partial class ActualizarDatos : System.Web.UI.UserControl
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
            ActualizarInfo();
        }
        #endregion

        #region "Inicializar"
        public void Inicializar()
        {
            #region "Definitions"
            DSPollaMundialista.UsuarioRow drUsuario;
            #endregion
            #region "try"
            try
            {
                #region "Objects Instance"
                drUsuario = null;
                #endregion

                LimpiarForm();
                drUsuario = objUsuarioBLL.ConsultarUsuario(objUsuario.UsuarioID);
                if (drUsuario != null)
                {
                    txtNombres.Text = drUsuario.Nombres.Trim();
                    txtApellidos.Text = drUsuario.Apellidos.Trim();
                    txtIdentificacion.Text = drUsuario.Identificacion.Trim();
                    txtEmail.Text = drUsuario.Email.Trim();
                    if (drUsuario.Genero == "M")
                    {
                        rbtMasculino.Checked = true;
                    }
                    if (drUsuario.Genero == "F")
                    {
                        rbtFemenino.Checked = true;
                    }
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
                drUsuario = null;
            }
            #endregion
        }
        #endregion

        #region "LimpiarForm"
        protected void LimpiarForm()
        {
            txtNombres.Text = string.Empty;
            txtApellidos.Text = string.Empty;
            txtIdentificacion.Text = string.Empty;
            txtEmail.Text = string.Empty;
            rbtMasculino.Checked = true;
            rbtFemenino.Checked = false;
            lblInfo.Text = string.Empty;
        }
        #endregion

        #region "ActualizarInfo"
        protected void ActualizarInfo()
        {
            #region "Definitions"
            #endregion
            #region "try"
            try
            {
                #region "Objects Instance"
                string Genero = "M";
                #endregion

                if (rbtFemenino.Checked)
                {
                    Genero = "F";
                }

                objUsuarioBLL.EditarInfoUsuario(objUsuario.UsuarioID, txtNombres.Text.Trim(), txtApellidos.Text.Trim(), Genero, txtEmail.Text.Trim());
                lblInfo.Text= "Datos Actualizados correctamente.";
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
            }
            #endregion
        }
        #endregion

    }
}