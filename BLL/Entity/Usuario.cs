#region "using"
using System;
using System.Web;
using System.Web.Security;
using PollaMundialista.DAL;
using BLL;
#endregion

namespace Entity
{
    /// <summary>
    /// Clase que maneja la entidad usuario con su información basica
    /// </summary>
    public class Usuario
    {

        #region "Propiedades"

        #region "Autenticado"
        private bool _Autenticado;
        public bool Autenticado
        {
            get
            {
                return _Autenticado;
            }
        }
        #endregion

        #region "UsuarioID"
        private int _UsuarioID;
        public int UsuarioID
        {
            get
            {
                return _UsuarioID;
            }
        }
        #endregion

        #region "Nombres"
        private string _Nombres;
        public string Nombres
        {
            get
            {
                return _Nombres;
            }
        }
        #endregion

        #region "Apellidos"
        private string _Apellidos;
        public string Apellidos
        {
            get
            {
                return _Apellidos;
            }
        }
        #endregion

        #region "Identificacion"
        private string _Identificacion;
        public string Identificacion
        {
            get
            {
                return _Identificacion;
            }
        }
        #endregion

        #region "Genero"
        private string _Genero;
        public string Genero
        {
            get
            {
                return _Genero;
            }
        }
        #endregion

        #region "Email"
        private string _Email;
        public string Email
        {
            get
            {
                return _Email;
            }
        }
        #endregion

        #region "Activo"
        private bool _Activo;
        public bool Activo
        {
            get
            {
                return _Activo;
            }
        }
        #endregion

        #region "Admin"
        private bool _Admin;
        public bool Admin
        {
            get
            {
                return _Admin;
            }
        }
        #endregion

        #region "FechaRegistro"
        private DateTime _FechaRegistro;
        public DateTime FechaRegistro
        {
            get
            {
                return _FechaRegistro;
            }
        }
        #endregion

        #region "CurrentHttpContext"
        private HttpContext _CurrentHttpContext;
        #endregion

        #endregion

        #region "Usuario Constructor"
        public Usuario(HttpContext currentHttpContext)
        {
            DSPollaMundialista.UsuarioRow drUsuario;
            UsuarioBLL objUsuarioBLL = new UsuarioBLL();
            #region "try"
            try
            {
                _CurrentHttpContext = currentHttpContext;
                _Autenticado = false;
                _UsuarioID = 0;
                _Nombres = string.Empty;
                _Apellidos = string.Empty;
                _Identificacion = string.Empty;
                _Genero = string.Empty;
                _Email = string.Empty;
                _Activo = false;
                _Admin = false;
                _FechaRegistro = DateTime.MinValue;
                if (!_CurrentHttpContext.User.Identity.IsAuthenticated)
                {
                    return;
                }
                FormsIdentity id;
                FormsAuthenticationTicket ticket;

                id = (FormsIdentity)HttpContext.Current.User.Identity;
                ticket = id.Ticket;
                if (!int.TryParse(ticket.Name, out _UsuarioID))
                    return;

                #region "Consultar la informacion del Usuario"
                drUsuario = objUsuarioBLL.ConsultarUsuario(UsuarioID);
                if (drUsuario == null)
                {
                    _Autenticado = false;
                    return;
                }
                _Nombres = drUsuario["Nombres"].ToString();
                _Apellidos = drUsuario["Apellidos"].ToString();
                _Identificacion = drUsuario["Identificacion"].ToString();
                _Genero = drUsuario["Genero"].ToString();
                _Email = drUsuario["Email"].ToString();
                _Autenticado = true;
                _Activo = bool.Parse(drUsuario["Activo"].ToString());
                _Admin = bool.Parse(drUsuario["Admin"].ToString());
                _FechaRegistro = DateTime.Parse(drUsuario["FechaRegistro"].ToString());
                #endregion
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
                drUsuario = null;
            }
            #endregion
        }
        #endregion

        #region "Funciones Publicas"

        #region "CerrarSesion"
        public void CerrarSesion()
        {
            FormsAuthentication.SignOut();
            _CurrentHttpContext.Session.Abandon();
            _CurrentHttpContext.Session.Clear();

            _Autenticado = false;
            _UsuarioID = 0;
            _Nombres = string.Empty;
            _Apellidos = string.Empty;
            _Genero = string.Empty;
            _Identificacion = string.Empty;
            _Email = string.Empty;
            _Activo = false;
            _Admin = false;
            _FechaRegistro = DateTime.MinValue;
            
        }
        #endregion

        #endregion

    }
}
