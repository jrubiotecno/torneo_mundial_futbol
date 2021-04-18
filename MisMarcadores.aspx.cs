#region "Using"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using BLL;
using PollaMundialista.DAL;
#endregion

namespace PollaMundialista
{
    public partial class MisMarcadores : System.Web.UI.Page
    {

        Usuario objUsuario = new Usuario(HttpContext.Current);

        #region "objPartidoBLL"
        private PartidoBLL _objPartidoBLL = null;
        private PartidoBLL objPartidoBLL
        {
            get
            {
                if (_objPartidoBLL == null)
                    _objPartidoBLL = new PartidoBLL();
                return _objPartidoBLL;
            }
        }
        #endregion

        #region "objPartidoResultadoBLL"
        private PartidoResultadoBLL _objPartidoResultadoBLL = null;
        private PartidoResultadoBLL objPartidoResultadoBLL
        {
            get
            {
                if (_objPartidoResultadoBLL == null)
                    _objPartidoResultadoBLL = new PartidoResultadoBLL();
                return _objPartidoResultadoBLL;
            }
        }
        #endregion

        #region "Metodos Eventos"

        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {
            #region "Verificamos la sesion del usuario."
            if (!objUsuario.Autenticado)
            {
                General.MostrarAlertaRetornar(this.Page, "Debe iniciar sesión para verificar sus Marcadores", "Default.aspx");
                return;
            }
            if (!objUsuario.Activo)
            {
                General.MostrarAlertaRetornar(this.Page, "Debe estar activo para poder ingresar sus Marcadores", "Default.aspx");
                return;
            }
            #endregion

            odsPartidos.SelectParameters["UsuarioID"].DefaultValue = objUsuario.UsuarioID.ToString();
            grdPartidos.DataBind();

            if (!Page.IsPostBack)
            {
                pnlMarcador.Enabled = false;
                pnlMarcador.Visible = false;
            }
        }
        #endregion

        #region "ddlFechas_SelectedIndexChanged"
        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            odsPartidos.SelectParameters["FechaPartido"].DefaultValue = ddlFechas.SelectedValue;
            odsPartidos.SelectParameters["FaseID"].DefaultValue = ddlFase.SelectedValue;
            odsPartidos.SelectParameters["UsuarioID"].DefaultValue = objUsuario.UsuarioID.ToString();
            grdPartidos.DataBind();
        }
        #endregion

        #region "ddlFase_SelectedIndexChanged"
        protected void ddlFase_SelectedIndexChanged(object sender, EventArgs e)
        {
            odsPartidos.SelectParameters["FechaPartido"].DefaultValue = ddlFechas.SelectedValue;
            odsPartidos.SelectParameters["FaseID"].DefaultValue = ddlFase.SelectedValue;
            odsPartidos.SelectParameters["UsuarioID"].DefaultValue = objUsuario.UsuarioID.ToString();
            grdPartidos.DataBind();
        }
        #endregion

        #region "grdPartidos_SelectedIndexChanged"
        protected void grdPartidos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string PartidoID = string.Empty;
            PartidoID = grdPartidos.SelectedDataKey.Value.ToString();
            if (!string.IsNullOrEmpty(PartidoID))
            {
                if (ValidarFechaPartido(PartidoID))
                {
                    CargarPartido(PartidoID);
                }
                else
                {
                    General.MostrarAlerta(this.Page, "El Partido ya se ha cerrado.");
                }
            }
        }
        #endregion

        #region "btnInsertar_Click"
        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            if (!objUsuario.Autenticado)
            {
                General.MostrarAlertaRetornar(this.Page, "Debe iniciar sesión para verificar sus Marcadores", "Default.aspx");
                return;
            }
            InsertarPartidoResultado();
        }
        #endregion

        #endregion

        #region "Metodos Propios"

        #region "CargarPartido"
        protected void CargarPartido(string PartidoID)
        {
            DSPollaMundialista.PartidoResultadoRow drPartido = null;
            drPartido = objPartidoResultadoBLL.ConsultarPartidoUsuario(objUsuario.UsuarioID, int.Parse(PartidoID));
            if (drPartido != null)
            {
                lblFechaPartido.Text = string.Concat(drPartido.FechaPartido.ToLongDateString(), " ", drPartido.FechaPartido.ToLongTimeString());
                imgPais1.ImageUrl = string.Concat("~/Images/Paises/", drPartido.PaisLocalID.ToString(), ".png");
                lblPais1.Text = drPartido.PaisNombreLocal.Trim();
                if (!drPartido.IsGolesPaisLocalNull())
                {
                    //txtMarcadorPais1.Text = drPartido.GolesPaisLocal.ToString();
                    txtMarcadorPais1.Text = string.Empty;
                }               

                imgPais2.ImageUrl = string.Concat("~/Images/Paises/", drPartido.PaisVisitanteID.ToString(), ".png");
                lblPais2.Text = drPartido.PaisNombreVisitante.Trim();
                if (!drPartido.IsGolesPaisVisitanteNull())
                {
                    //txtMarcadorPais2.Text = drPartido.GolesPaisVisitante.ToString();
                    txtMarcadorPais2.Text = string.Empty;
                }                

                pnlMarcador.Visible = true;
                pnlMarcador.Enabled = true;
                ViewState["PartidoID"] = PartidoID;
            }
        }
        #endregion

        #region "ValidarFechaPartido"
        protected bool ValidarFechaPartido(string PartidoID)
        {
            bool Resultado = false;
            #region "Consultamos la informacion del partido"
            DSPollaMundialista.PartidoRow drPartido = null;
            drPartido = objPartidoBLL.ConsultarPartido(int.Parse(PartidoID));
            #endregion

            if (drPartido != null)
            {
                DateTime FechaPartido = new DateTime();
                DateTime FechaValidacion = new DateTime();

                FechaPartido = drPartido.FechaPartido;
                FechaValidacion = FechaPartido.AddDays(-1).Date;

                //Response.Write("+++++"+FechaValidacion.ToString());

                if (DateTime.Now.Date <= FechaValidacion)
                {
                    Resultado = true;
                }
            }
            return Resultado;
        }
        #endregion

        #region "InsertarPartidoResultado"
        protected void InsertarPartidoResultado()
        {
            #region "Definitions"
            string PartidoID;
            #endregion
            #region "try"
            try
            {
                #region "Objects Instance"
                PartidoID = string.Empty;
                #endregion

                PartidoID = ViewState["PartidoID"].ToString();
                if (!string.IsNullOrEmpty(PartidoID))
                {
                    if (ValidarFechaPartido(PartidoID))
                    {
                        int GolesLocal = int.Parse(txtMarcadorPais1.Text);
                        int GolesVisitante = int.Parse(txtMarcadorPais2.Text);

                        objPartidoResultadoBLL.InsertarPartidoUsuario(objUsuario.UsuarioID, int.Parse(PartidoID), GolesLocal, GolesVisitante);
                        ViewState["PartidoID"] = null;
                        txtMarcadorPais1.Text = string.Empty;
                        txtMarcadorPais2.Text = string.Empty;
                        pnlMarcador.Visible = false;
                        pnlMarcador.Enabled = false;

                        grdPartidos.SelectedIndex = -1;
                        odsPartidos.SelectParameters["UsuarioID"].DefaultValue = objUsuario.UsuarioID.ToString(); ;
                        grdPartidos.DataBind();
                    }
                    else
                    {
                        General.MostrarAlerta(this.Page, "El Partido ya se ha jugado.");
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

            }
            #endregion
        }
        #endregion

        #endregion

    }
}