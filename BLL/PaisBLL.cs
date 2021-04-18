#region "using"
using PollaMundialista.DAL;
using System;
#endregion

namespace BLL
{
    /// <summary>
    /// Clase que contiene las funciones y metodos de los Paises.
    /// </summary>
    [System.ComponentModel.DataObject]
    public class PaisBLL
    {

        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.PaisTableAdapter _Adapter = null;
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.PaisTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.PaisTableAdapter();
                return _Adapter;
            }
        }

        #region "PaisBLL"
        public PaisBLL()
        {

        }
        #endregion

        #region "ConsultarPais"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DSPollaMundialista.PaisDataTable ConsultarPais(string PaisNombre)
        {
            if (string.IsNullOrEmpty(PaisNombre))
            {
                PaisNombre = string.Empty;
            }

            return Adapter.GetByName(PaisNombre);
        }
        #endregion

        #region "InsertarPais"
        public int InsertarPais(string PaisNombre)
        {
            return Convert.ToInt32(Adapter.InsertPais(PaisNombre.Trim()));
        }
        #endregion

        #region "EditarPais"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public void EditarPais(string PaisNombre, int original_PaisID)
        {
            Adapter.UpdatePais(PaisNombre.Trim(), original_PaisID);
        }
        #endregion

        #region "EliminarPais"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public void EliminarPais(int original_PaisID)
        {
            Adapter.DeletePais(original_PaisID);
        }
        #endregion

        //#region "AsociarEquipoGrupo"
        //public static void AsociarEquipoGrupo(int PaisID, int GrupoID)
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

        //        ListaParametros.Add(new SqlParameter("@PaisID", PaisID));
        //        ListaParametros.Add(new SqlParameter("@GrupoID", GrupoID));

        //        DataAccessSQL.ExecuteNonQuery("SP_AsociarEquipoGrupo", ListaParametros);
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

        //#region "EliminarEquiposGrupos"
        //public static void EliminarEquiposGrupos(int GrupoID)
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

        //        ListaParametros.Add(new SqlParameter("@GrupoID", GrupoID));

        //        DataAccessSQL.ExecuteNonQuery("SP_EliminarEquipoGrupo", ListaParametros);
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