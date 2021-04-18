#region "Using"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
#endregion

namespace PollaMundialista
{
    public partial class Registro : System.Web.UI.Page
    {

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region "btnInsertar_Click"
        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            RegistrarUsuario();
        }
        #endregion

        #region "RegistrarUsuario"
        protected void RegistrarUsuario()
        {
            #region "Definitions"
            UsuarioBLL objUsuarioBLL;
            int UsuarioID;
            string Genero;
            #endregion
            #region "try"
            try
            {
                #region "Objects Instance"
                objUsuarioBLL = new UsuarioBLL();
                UsuarioID = -1;
                Genero = string.Empty;
                #endregion

                #region "Creacion del usuario"
                if (rbtMasculino.Checked)
                {
                    Genero = "M";
                }
                if (rbtFemenino.Checked)
                {
                    Genero = "F";
                }

                UsuarioID = objUsuarioBLL.RegistrarUsuario(txtNombres.Text, txtApellidos.Text, Genero, txtIdentificacion.Text.Trim(),
                                                        txtEmail.Text, txtPassword.Text.Trim(), true);
                #endregion

                #region "Verificar si se creo el usuario."
                if (UsuarioID == -1)
                {
                    General.MostrarAlerta(this.Page, "Ya existe un usuario con el mismo número de identificación.");
                    return;
                }
                else
                {
                    General.MostrarAlertaRetornar(this.Page, "El proceso se ha realizado correctamente.", "Default.aspx");
                }
                #endregion
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