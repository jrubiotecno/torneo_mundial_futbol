#region "using"
using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using PollaMundialista.DAL;
#endregion

namespace BLL
{
    /// <summary>
    /// Clase que contiene las funciones y metodos de los GrupoPaiss.
    /// </summary>
    [System.ComponentModel.DataObject]
    public class GrupoPaisBLL
    {
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.GrupoPaisTableAdapter _Adapter = null;
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.GrupoPaisTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.GrupoPaisTableAdapter();
                return _Adapter;
            }
        }

        #region "GrupoPaisBLL"
        public GrupoPaisBLL()
        {

        }
        #endregion

        #region "ConsultarGrupoPais"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DSPollaMundialista.GrupoPaisDataTable ConsultarGrupoPais(int GrupoID)
        {
            return Adapter.GetData(GrupoID);
        }
        #endregion

        #region "InsertarGrupoPais"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public void InsertarGrupoPais(int original_GrupoID, int original_PaisID)
        {
            Adapter.InsertGrupoPais(original_GrupoID, original_PaisID);
        }
        #endregion

        #region "EliminarGrupoPais"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public void EliminarGrupoPais(int original_GrupoID)
        {
            Adapter.DeleteGrupoPais(original_GrupoID);
        }
        #endregion

        #region "ConsultarEquiposGrupos"
        public DSPollaMundialista.GrupoPaisDataTable ConsultarEquiposGrupos(int GrupoID)
        {
            return Adapter.GetData(GrupoID);
        }
        #endregion

    }
}