#region "Using"
using System;
using System.Linq;
using System.Web;
using PollaMundialista.DAL;
using BLL;
using System.IO;
using System.Configuration;
#endregion

namespace PollaMundialista
{
    public partial class OlvidoPassword : System.Web.UI.Page
    {
        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region "btnEnviar_Click"
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            EnviarContraseña();
        }
        #endregion

        #region "btnVolver_Click"
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        #endregion

        #region "Inicializar"
        public void Inicializar()
        {
            lblInfo.Text = string.Empty;
            txtIdentificacion.Text = string.Empty;
        }
        #endregion

        #region "EnviarContraseña"
        protected void EnviarContraseña()
        {
            #region "Definitions"
            DSPollaMundialista.UsuarioDataTable dtUsuario;
            UsuarioBLL objUsuarioBLL;
            string NuevaContrasena;
            string MensajeCorreo;
            string CorreoSaliente;
            #endregion
            #region "try"
            try
            {
                #region "Objects Instance"
                NuevaContrasena = string.Empty;
                MensajeCorreo = string.Empty;
                CorreoSaliente = string.Empty;
                dtUsuario = new DSPollaMundialista.UsuarioDataTable();
                objUsuarioBLL = new UsuarioBLL();
                lblInfo.Text = string.Empty;
                #endregion

                dtUsuario = objUsuarioBLL.ConsultarUsuarios(txtIdentificacion.Text.Trim());
                if (dtUsuario != null)
                {
                    NuevaContrasena = General.GenerarContrasenaAleatoria();
                    MensajeCorreo = ObtenerCuerpoCorreo(dtUsuario.First().Nombres.Trim(), dtUsuario.First().Apellidos.Trim(),
                                                        NuevaContrasena);
                    CorreoSaliente = ConfigurationManager.AppSettings["MailCorreoSaliente"];

                    #region "Actualizar Contraseña"
                    string Contrasena = Encrypt.EncryptString(NuevaContrasena);
                    objUsuarioBLL.CambiarContrasena(dtUsuario.First().UsuarioID, Contrasena);
                    #endregion

                    if (General.EnviarCorreo(CorreoSaliente, dtUsuario.First().Email.Trim(), string.Empty, "Polla Mundialista :: Recordar Contraseña", true,
                                            System.Net.Mail.MailPriority.Normal, MensajeCorreo) == true)
                    {
                        lblInfo.Text = "Se ha enviado un mensaje de correo electrónico con la nueva contraseña.";
                    }
                }
                else
                {
                    lblInfo.Text = "No existe información para la identificación ingresada.";
                }
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
                dtUsuario = null;
                objUsuarioBLL = null;
                GC.Collect();
            }
            #endregion
        }
        #endregion

        #region "ObtenerCuerpoCorreo"
        /// <summary>
        /// Función que permite obtener el cuerpo del correo para recordar la contraseña.
        /// </summary>
        /// <param name="NombresUsuario">Nombres del usuario</param>
        /// <param name="ApellidosUsuario">Apellidos del usuario</param>
        /// <param name="Contrasena">Nueva contraseña del usuario</param>
        /// <returns>Cuerpo del correo con la información del usuario y la nueva contraseña.</returns>
        protected string ObtenerCuerpoCorreo(string NombresUsuario, string ApellidosUsuario, string Contrasena)
        {
            string filePath = HttpContext.Current.Server.MapPath("~/App_Data/RecordarContrasena.html");
            if (!File.Exists(filePath))
            {
                return string.Empty;
            }
            string mailBody = File.ReadAllText(filePath);
            mailBody = mailBody.Replace("#-#Usuario#-#", string.Concat(NombresUsuario, " ", ApellidosUsuario));
            mailBody = mailBody.Replace("#-#Contrasena#-#", Contrasena);

            return mailBody;
        }
        #endregion

    }
}