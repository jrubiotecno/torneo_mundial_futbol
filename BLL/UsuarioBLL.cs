#region "using"
using System;
using PollaMundialista.DAL;
using System.Collections.Generic;
#endregion

namespace BLL
{
    /// <summary>
    /// Clase que realiza todas las funciones o metodos de logica de negocio relacionados al usuario
    /// </summary>
    [System.ComponentModel.DataObject]
    public class UsuarioBLL
    {

        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.UsuarioTableAdapter _Adapter = null;
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.UsuarioTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.UsuarioTableAdapter();
                return _Adapter;
            }
        }

        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.UsuarioPuntajeTableAdapter _AdapterUsuarioPuntaje = null;
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.UsuarioPuntajeTableAdapter AdapterUsuarioPuntaje
        {
            get
            {
                if (_AdapterUsuarioPuntaje == null)
                    _AdapterUsuarioPuntaje = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.UsuarioPuntajeTableAdapter();
                return _AdapterUsuarioPuntaje;
            }
        }

        #region "UsuarioBLL"
        public UsuarioBLL()
        {

        }
        #endregion

        #region "ConsultarUsuario"
        /// <summary>
        /// Funcion que permite consultar la información de un usuario por medio del ID
        /// </summary>
        /// <param name="UsuarioID">Identificador único del usuario</param>
        /// <returns>DataRow con la información del usuario</returns>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DSPollaMundialista.UsuarioRow ConsultarUsuario(int UsuarioID)
        {
            DSPollaMundialista.UsuarioDataTable dt = new DSPollaMundialista.UsuarioDataTable();
            DSPollaMundialista.UsuarioRow dr = null;

            dt = Adapter.GetData(UsuarioID);
            if (dt != null)
            {
                if (dt.Rows.Count != 0)
                {
                    dr = (DSPollaMundialista.UsuarioRow)dt.Rows[0];
                }
            }
            return dr;
        }
        #endregion

        #region "ConsultarUsuarios"
        /// <summary>
        /// Funcion que permite consultar todos los usuarios.
        /// </summary>
        /// <param name="Identificacion">Identificacion del usuario</param>
        /// <param name="Nombres">Nombres del usuario</param>
        /// <param name="Apellidos">Apellidos del usuario</param>
        /// <param name="Email">Correo Electronico del usuario</param>
        /// <returns>DataTable con la informacion de los usuarios.</returns>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public DSPollaMundialista.UsuarioDataTable ConsultarUsuarios(string Identificacion)
        {
            if (string.IsNullOrEmpty(Identificacion))
            {
                Identificacion = string.Empty;
            }
            return Adapter.GetByIdentificacion(Identificacion);
        }
        #endregion

        #region "UpdateUsuario"
        /// <summary>
        /// Funcion que modifica la informacion del usuario
        /// </summary>
        /// <param name="UsuarioID">Identificador unico del usuario</param>
        /// <param name="Nombres">Nombres del usuario</param>
        /// <param name="Apellidos">Apellidos del usuario</param>
        /// <param name="Genero">Genero del usuario debe ser M o F</param>
        /// <param name="Identificacion">Numero de identificacion del usuario</param>
        /// <param name="Email">Correo electronico del usuario</param>
        /// <param name="Activo">Si el usuario esta activo </param>
        /// <returns>Cadena con  el codigo del usuario al que se le modifico la información</returns>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public void UpdateUsuario(int Original_UsuarioID, string Nombres, string Apellidos, string Genero, string Identificacion, string Email, bool Activo, bool Admin)
        {
            Adapter.UpdateUsuario(Nombres.Trim(), Apellidos.Trim(), Identificacion.Trim(), Genero.Trim(), Email.Trim(), Activo, Admin, Original_UsuarioID);
        }
        #endregion

        #region "EditarInfoUsuario"
        /// <summary>
        /// Funcion que modifica la informacion del usuario
        /// </summary>
        /// <param name="UsuarioID">Identificador unico del usuario</param>
        /// <param name="Nombres">Nombres del usuario</param>
        /// <param name="Apellidos">Apellidos del usuario</param>
        /// <param name="Genero">Genero del usuario debe ser M o F</param>
        /// <param name="Identificacion">Numero de identificacion del usuario</param>
        /// <param name="Email">Correo electronico del usuario</param>
        /// <param name="Activo">Si el usuario esta activo </param>
        /// <returns>Cadena con  el codigo del usuario al que se le modifico la información</returns>
        public void EditarInfoUsuario(int Original_UsuarioID, string Nombres, string Apellidos, string Genero, string Email)
        {
            Adapter.UpdateUsuarioInfo(Nombres.Trim(), Apellidos.Trim(), Genero.Trim(), Email.Trim(), Original_UsuarioID);
        }
        #endregion

        #region "ConsultarPuntajeUsuarios"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public DSPollaMundialista.UsuarioPuntajeDataTable ConsultarPuntajeUsuarios()
        {
            return AdapterUsuarioPuntaje.GetData();
        }
        #endregion

        #region "RegistrarUsuario"
        /// <summary>
        /// Funcion que permite el registro de un usuario en el sistema
        /// </summary>
        /// <param name="Nombres">Nombres del usuario</param>
        /// <param name="Apellidos">Apellidos del usuario</param>
        /// <param name="Genero">Sexo del Usuario</param>
        /// <param name="Identificacion">Numero de identificacion</param>
        /// <param name="Email">Correo electronico del usuario</param>
        /// <param name="Password">Contraseña del usuario</param>
        /// <param name="Activo">Indica si el usuario ya se encuentra activo</param>
        /// <returns>Id del usuario creado</returns>
        public int RegistrarUsuario(string Nombres, string Apellidos, string Genero, string Identificacion, string Email,
                                            string Password, bool Activo)
        {
            DSPollaMundialista.UsuarioDataTable dt = new DSPollaMundialista.UsuarioDataTable();
            dt = Adapter.GetByIdentificacion(Identificacion.Trim());

            if (dt != null)
            {
                if (dt.Rows.Count != 0)
                {
                    return -1;
                }
            }

            string PasswordEncriptado = string.Empty;
            PasswordEncriptado = Encrypt.EncryptString(Password);
            return Convert.ToInt32(Adapter.InsertUsuario(Nombres.Trim(), Apellidos.Trim(), Identificacion.Trim(), Genero.Trim(),
                                            Email.Trim(), PasswordEncriptado, false, DateTime.Now));
        }
        #endregion

        #region "AutenticarUsuario"
        /// <summary>
        /// Funcion que permite autenticar a un usuario.
        /// </summary>
        /// <param name="Identificacion">Identificacion del usuario</param>
        /// <param name="Password">Contraseña del usuario</param>
        /// <returns>Identificador Unico del usuario.</returns>
        public int AutenticarUsuario(string Identificacion, string Password)
        {
            #region "Definitions"
            DSPollaMundialista.UsuarioDataTable dt;
            int UsuarioID;
            string PasswordEncriptado;
            #endregion
            #region "try"
            try
            {
                #region "Objects Instance"
                UsuarioID = 0;
                PasswordEncriptado = string.Empty;
                dt = new DSPollaMundialista.UsuarioDataTable();
                #endregion

                #region "Consultamos la cedula"
                dt = Adapter.GetByIdentificacion(Identificacion);
                if (dt == null)
                {
                    throw new Exception("La Identificación No existe.");
                }
                else
                {
                    if (dt.Rows.Count == 0)
                    {
                        throw new Exception("La Identificación No existe.");
                    }
                }
                #endregion

                #region "Autenticamos el usuario"
                PasswordEncriptado = Encrypt.EncryptString(Password);
                dt = new DSPollaMundialista.UsuarioDataTable();
                dt = Adapter.AutenticarUsuario(Identificacion.Trim(), PasswordEncriptado);

                if (dt == null)
                {
                    throw new Exception("La contraseña es incorrecta.");
                }
                else
                {
                    if (dt.Rows.Count == 0)
                    {
                        throw new Exception("La contraseña es incorrecta.");
                    }
                    else
                    {
                        UsuarioID = int.Parse(dt.Rows[0]["UsuarioID"].ToString());
                    }
                }
                #endregion

                return UsuarioID;
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
                dt = null;
                GC.Collect();
            }
            #endregion
        }
        #endregion

        #region "CambiarContrasena"
        /// <summary>
        /// Función que camnbia la contraseña del usuario por una nueva.
        /// </summary>
        /// <param name="UsuarioID">Código del usuario</param>
        /// <param name="ContrasenaNueva">Nueva Contraseña</param>
        /// <returns></returns>
        public void CambiarContrasena(int UsuarioID, string ContrasenaNueva)
        {
            Adapter.UpdatePassword(ContrasenaNueva, UsuarioID);
        }
        #endregion

        //#region "ConsultarUsuario"
        ///// <summary>
        ///// Funcion que permite consultar la información de un usuario por medio del numero de identificacion
        ///// </summary>
        ///// <param name="Identificacion">Identificación del usuario</param>
        ///// <returns>DataRow con la información del usuario</returns>
        //public static DataRow ConsultarUsuario(string Identificacion)
        //{
        //    #region "Definitions"
        //    List<SqlParameter> ListaParametros;
        //    DataTable dtUsuario;
        //    #endregion
        //    #region "try"
        //    try
        //    {
        //        #region "Objects Instance"
        //        ListaParametros = new List<SqlParameter>();
        //        dtUsuario = new DataTable();
        //        #endregion

        //        ListaParametros.Add(new SqlParameter("@Identificacion", Identificacion));
        //        dtUsuario = DataAccessSQL.ExecuteSelect("SP_ConsultarUsuarioPorIdentificacion", ListaParametros);

        //        if (dtUsuario.Rows.Count > 0)
        //        {
        //            return dtUsuario.Rows[0];
        //        }
        //        else
        //        {
        //            return null;
        //        }
        //    }
        //    #endregion
        //    #region "catch"
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    #endregion
        //    #region "finally"
        //    finally
        //    {
        //        ListaParametros = null;
        //        dtUsuario = null;
        //    }
        //    #endregion
        //}
        //#endregion

        //#region "CambiarContrasena"
        ///// <summary>
        ///// Función que permite cambiar la contraseña de un usuario.
        ///// </summary>
        ///// <param name="UsuarioID">Código del usuario.</param>
        ///// <param name="Contrasena">Contraseña actual del usuario.</param>
        ///// <param name="ContrasenaNueva">Contraseña nueva del usuario.</param>
        ///// <returns></returns>
        //public static string CambiarContrasena(int UsuarioID, string Contrasena, string ContrasenaNueva)
        //{
        //    #region "Definitions"
        //    List<SqlParameter> ListaParametros;
        //    String ContrasenaEncriptada;
        //    String ContrasenaNuevaEncriptada;
        //    #endregion
        //    #region "try"
        //    try
        //    {
        //        #region "Objects Instance"
        //        ListaParametros = new List<SqlParameter>();
        //        ContrasenaEncriptada = string.Empty;
        //        ContrasenaNuevaEncriptada = string.Empty;
        //        #endregion

        //        ContrasenaEncriptada = Encrypt.EncryptPassword_SHA1(Contrasena);
        //        ContrasenaNuevaEncriptada = Encrypt.EncryptPassword_SHA1(ContrasenaNueva);
        //        ListaParametros.Add(new SqlParameter("@UsuarioID", UsuarioID));
        //        ListaParametros.Add(new SqlParameter("@Password", ContrasenaEncriptada));
        //        ListaParametros.Add(new SqlParameter("@PasswordNuevo", ContrasenaNuevaEncriptada));

        //        return DataAccessSQL.ExecuteScalar("SP_CambiarPassword", ListaParametros);
        //    }
        //    #endregion
        //    #region "catch"
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    #endregion
        //    #region "finally"
        //    finally
        //    {
        //        ListaParametros = null;
        //    }
        //    #endregion
        //}
        //#endregion

        //#region "EditarUsuario"
        ///// <summary>
        ///// Funcion que modifica la informacion del usuario
        ///// </summary>
        ///// <param name="UsuarioID">Identificador unico del usuario</param>
        ///// <param name="Nombres">Nombres del usuario</param>
        ///// <param name="Apellidos">Apellidos del usuario</param>
        ///// <param name="Genero">Genero del usuario debe ser M o F</param>
        ///// <param name="Identificacion">Numero de identificacion del usuario</param>
        ///// <param name="Email">Correo electronico del usuario</param>
        ///// <returns>Cadena con  el codigo del usuario al que se le modifico la información</returns>
        //public static string EditarUsuario(int UsuarioID, string Nombres, string Apellidos, string Genero, string Identificacion, string Email)
        //{
        //    #region "Definitions"
        //    List<SqlParameter> ListaParametros;
        //    #endregion
        //    #region "try"
        //    try
        //    {
        //        #region "Objects Instance"
        //        ListaParametros = new List<SqlParameter>();
        //        #endregion

        //        ListaParametros.Add(new SqlParameter("@UsuarioID", UsuarioID));
        //        ListaParametros.Add(new SqlParameter("@Nombres", Nombres));
        //        ListaParametros.Add(new SqlParameter("@Apellidos", Apellidos));
        //        ListaParametros.Add(new SqlParameter("@Genero", Genero));
        //        ListaParametros.Add(new SqlParameter("@Identificacion", Identificacion));
        //        ListaParametros.Add(new SqlParameter("@Email", Email));

        //        return DataAccessSQL.ExecuteScalar("SP_EditarUsuario", ListaParametros);
        //    }
        //    #endregion
        //    #region "catch"
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    #endregion
        //    #region "finally"
        //    finally
        //    {
        //        ListaParametros = null;
        //    }
        //    #endregion
        //}
        //#endregion

    }

}