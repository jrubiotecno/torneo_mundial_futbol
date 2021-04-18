#region "Using"
using System;
using System.Web;
using BLL;
using System.IO;
#endregion

namespace PollaMundialista
{
    public partial class Contactenos : System.Web.UI.Page
    {
        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region "imgEnviar_Click"
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            EnviarComentario();
            General.MostrarAlerta(this.Page, "La sugerencia o comentario se ha enviado correctamente.");
            txtNombre.Text = string.Empty;
            txtCorreoElectronico.Text = string.Empty;
            txtComentario.Text = string.Empty;
        }
        #endregion

        #region "EnviarComentario"
        protected void EnviarComentario()
        {
            string MensajeCorreo = string.Empty;
            string Para = string.Empty;

            Para = General.ObtenerValorParametro("EmailContactenos");
            MensajeCorreo = ObtenerCuerpoCorreo(txtNombre.Text.Trim(), txtComentario.Text.Trim());
            General.EnviarCorreo(txtCorreoElectronico.Text.Trim(), Para, string.Empty, "Polla Mundialista :: Contáctenos", true,
                                    System.Net.Mail.MailPriority.Normal, MensajeCorreo);

        }
        #endregion

        #region "ObtenerCuerpoCorreo"
        protected string ObtenerCuerpoCorreo(string NombreUsuario, string Comentario)
        {
            string filePath = HttpContext.Current.Server.MapPath("~/App_Data/Contactenos.html");
            if (!File.Exists(filePath))
            {
                return string.Empty;
            }
            string mailBody = File.ReadAllText(filePath);
            mailBody = mailBody.Replace("#-#Usuario#-#", NombreUsuario);
            mailBody = mailBody.Replace("#-#Comentario#-#", Comentario);

            return mailBody;
        }
        #endregion

    }
}