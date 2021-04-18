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
    public class PartidoResultadoBLL
    {
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.PartidoResultadoTableAdapter _Adapter = null;
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.PartidoResultadoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.PartidoResultadoTableAdapter();
                return _Adapter;
            }
        }

        #region "PartidoResultadoBLL"
        public PartidoResultadoBLL()
        {

        }
        #endregion

        #region "ConsultarPartidoResultado"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DSPollaMundialista.PartidoResultadoDataTable ConsultarPartidoResultado(int PartidoID)
        {
            return Adapter.GetData(PartidoID);
        }
        #endregion

        #region "ConsultarPartidosUsuario"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public DSPollaMundialista.PartidoResultadoDataTable ConsultarPartidosUsuario(int UsuarioID)
        {
            return Adapter.GetDataByUsuario(UsuarioID);
        }
        #endregion

        #region "ConsultarPartidoUsuario"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public DSPollaMundialista.PartidoResultadoRow ConsultarPartidoUsuario(int UsuarioID, int PartidoID)
        {
            DSPollaMundialista.PartidoResultadoDataTable dt = new DSPollaMundialista.PartidoResultadoDataTable();
            DSPollaMundialista.PartidoResultadoRow dr = null;

            dt = Adapter.GetByUserPartido(UsuarioID, PartidoID);
            if (dt != null)
            {
                if (dt.Rows.Count != 0)
                {
                    dr = (DSPollaMundialista.PartidoResultadoRow)dt.Rows[0];
                }
            }

            return dr;
        }
        #endregion

        #region "ConsultarPartidosUsuario"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public DSPollaMundialista.PartidoResultadoDataTable ConsultarPartidosUsuario(int UsuarioID, int FaseID, Nullable<DateTime> FechaPartido)
        {
            return Adapter.GetByFilters(UsuarioID, FaseID, FechaPartido);
        }
        #endregion

        #region "InsertarPartidoUsuario"
        public void InsertarPartidoUsuario(int UsuarioID, int PartidoID, int GolesLocal, int GolesVisitante)
        {
            Adapter.DeletePartidoResultado(PartidoID, UsuarioID);
            Adapter.InsertPartidoResultado(PartidoID, UsuarioID, GolesLocal, GolesVisitante);
        }
        #endregion

    }
}