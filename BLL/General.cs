#region "using"
using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Net;
using PollaMundialista.DAL;
#endregion

namespace BLL
{
    /// <summary>
    /// Clase que contiene metodos Generales para la aplicación
    /// </summary>
    public static class General
    {

        #region "EnviarCorreo"
        /// <summary>
        /// Funcion que permite el envio de un correo electronico.
        /// </summary>
        /// <param name="De">Correo Electronico de quien envia</param>
        /// <param name="Para">Correo Electronico a quien va dirigido, se puede enviar a varias direcciones separandolas por comas(,)</param>
        /// <param name="CC">Correo Electronico a quien se enviara una Copia</param>
        /// <param name="Asunto">Asunto del correo</param>
        /// <param name="Html">Permite identificar si el mensaje del correo es Html</param>
        /// <param name="Prioridad">Prioridad del correo</param>
        /// <param name="Mensaje">Mensaje del correo Electronico</param>
        /// <returns></returns>
        public static bool EnviarCorreo(string De, string Para, string CC, string Asunto, bool Html, MailPriority Prioridad,
                                        string Mensaje)
        {
            #region "Definitions"
            MailAddress mailFrom;
            MailMessage msg;
            SmtpClient smtp;
            NetworkCredential credencial;
            bool Resultado = false;
            #endregion
            #region "try"
            try
            {
                #region "Objects Instance"
                msg = new MailMessage();
                #endregion

                mailFrom = new MailAddress(De, ":: Polla Mundialista :: GHTV ::", System.Text.Encoding.UTF8);

                msg.From = mailFrom;
                msg.To.Add(Para);
                if (!string.IsNullOrEmpty(CC))
                {
                    msg.CC.Add(CC);
                }
                msg.Subject = Asunto;
                msg.IsBodyHtml = Html;
                msg.Priority = Prioridad;
                msg.Body = Mensaje;
                smtp = new SmtpClient(ConfigurationManager.AppSettings["ServidorSmtp"], int.Parse(ConfigurationManager.AppSettings["Port"]));
                smtp.UseDefaultCredentials = false;
                credencial = new NetworkCredential(ConfigurationManager.AppSettings["UsuarioCredencial"],
                                                    ConfigurationManager.AppSettings["PasswordCredencial"]);
                smtp.Credentials = credencial;
                smtp.EnableSsl = false;
                smtp.Send(msg);
                Resultado = true;
                return Resultado;
            }
            #endregion
            #region "catch"
            catch (Exception ex)
            {
                throw ex;
            }
            #endregion
            #region "finally"
            finally
            {
                msg = null;
                smtp = null;
                mailFrom = null;
                credencial = null;
            }
            #endregion
        }
        #endregion

        #region "MostrarAlerta"
        /// <summary>
        /// Funcion que permite mostrar una alerta.
        /// </summary>
        /// <param name="objWebPage">Pagina</param>
        /// <param name="Mensaje">Mensaje que se mostrara en la alerta</param>
        public static void MostrarAlerta(Page objWebPage, string Mensaje)
        {
            string strScript;

            Mensaje = Mensaje.Replace("'", "\'");
            strScript = "<script language=javascript>";
            strScript += "alert('" + Mensaje + "');";
            strScript += "</script>";

            if (objWebPage.ClientScript.IsStartupScriptRegistered("StartupAlert") == false)
            {
                objWebPage.ClientScript.RegisterStartupScript(objWebPage.GetType(), "StartupAlert", strScript);
            }
        }
        #endregion

        #region "MostrarAlertaRetornar"
        /// <summary>
        /// Funcion que muestra una alerta y permite retornar u a una Url
        /// </summary>
        /// <param name="WebPage">Pagina</param>
        /// <param name="Mensaje">Mensaje que se mostrara en la alerta</param>
        /// <param name="UrlDestino">Url de destino</param>
        public static void MostrarAlertaRetornar(Page WebPage, string Mensaje, string UrlDestino)
        {
            string Script = "window.alert('" + Mensaje + "');";
            Script += "window.location='" + UrlDestino + "';";

            WebPage.ClientScript.RegisterClientScriptBlock(WebPage.GetType(), "Retorna", Script, true);
        }
        #endregion

        #region "GenerarContrasenaAleatoria"
        /// <summary>
        /// Función que genera una contraseña aleatoria
        /// </summary>
        /// <returns>Contraseña aletoria</returns>
        public static string GenerarContrasenaAleatoria()
        {
            int pwdLength = 10;
            char[] pwdChars = { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
            string newPwd = "";
            Random randObj = new Random();

            for (int i = 0; i < pwdLength; i++)
            {
                newPwd += pwdChars[randObj.Next(pwdChars.Length)];
            }
            return newPwd;
        }
        #endregion

        #region "ObtenerValorParametro"
        /// <summary>
        /// Función que permite obtener le valor de un parametro del sistema
        /// </summary>
        /// <param name="NombreParametro">Nombre del Parametro</param>
        /// <returns>Valor del Parametro.</returns>
        public static string ObtenerValorParametro(string NombreParametro)
        {
            #region "Definitions"
            DSPollaMundialista.ParametroRow drParametro;
            #endregion
            #region "try"
            try
            {
                #region "Objects Instance"
                drParametro = null;
                #endregion

                drParametro = ParametroBLL.ConsultarParametros(NombreParametro);
                if (drParametro != null)
                {
                    return drParametro.ValorParametro.Trim();
                }
                else
                {
                    throw new Exception(string.Concat("El Parametro ", NombreParametro, " No existe."));
                }
            }
            #endregion
            #region "catch"
            catch (Exception ex)
            {
                throw ex;
            }
            #endregion
            #region "finally"
            finally
            {
                drParametro = null;
            }
            #endregion
        }
        #endregion

    }
}