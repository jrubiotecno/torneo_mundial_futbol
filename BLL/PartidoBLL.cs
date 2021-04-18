#region "using"
using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using PollaMundialista.DAL;
using System.Data;
#endregion

namespace BLL
{
    /// <summary>
    /// Clase que contiene las funciones y metodos de los Partidos.
    /// </summary>
    [System.ComponentModel.DataObject]
    public class PartidoBLL
    {

        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.PartidoTableAdapter _Adapter = null;
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.PartidoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.PartidoTableAdapter();
                return _Adapter;
            }
        }

        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.FechaPartidoTableAdapter _AdapterFecha = null;
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.FechaPartidoTableAdapter AdapterFecha
        {
            get
            {
                if (_AdapterFecha == null)
                    _AdapterFecha = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.FechaPartidoTableAdapter();
                return _AdapterFecha;
            }
        }

        #region "PartidoBLL"
        public PartidoBLL()
        {

        }
        #endregion

        #region "ConsultarPartidos"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DSPollaMundialista.PartidoDataTable ConsultarPartidos(int FaseID, Nullable<DateTime> FechaPartido)
        {
            return Adapter.GetData(FaseID, FechaPartido);
        }
        #endregion

        #region "ConsultarPartido"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public DSPollaMundialista.PartidoRow ConsultarPartido(int PartidoID)
        {
            DSPollaMundialista.PartidoDataTable dt = new DSPollaMundialista.PartidoDataTable();
            DSPollaMundialista.PartidoRow dr = null;

            dt = Adapter.GetSingle(PartidoID);
            if (dt != null)
            {
                if (dt.Rows.Count != 0)
                {
                    dr = (DSPollaMundialista.PartidoRow)dt.Rows[0];
                }
            }

            return dr;
        }
        #endregion

        #region "InsertarPartido"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public void InsertarPartido(int EstadioID, int FaseID, int PaisLocalID, int PaisVisitanteID, DateTime FechaPartido)
        {
            Adapter.InsertPartido(EstadioID, FaseID, PaisLocalID, PaisVisitanteID, FechaPartido);
        }
        #endregion

        #region "EliminarPartido"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public void EliminarPartido(int original_PartidoID)
        {
            Adapter.DeletePartido(original_PartidoID);
        }
        #endregion

        #region "EditarPartido"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public void EditarPartido(int original_PartidoID, int GolesPaisLocal, int GolesPaisVisitante)
        {
            DSPollaMundialista.PartidoRow dr = ConsultarPartido(original_PartidoID);
            
            Adapter.UpdatePartido(GolesPaisLocal, GolesPaisVisitante, original_PartidoID);
            ActualizarEstadisticaPartidos(original_PartidoID);
            if (dr != null)
            {
                ActualizarPuntosUsuarios(original_PartidoID, dr.FaseID);
            }
            
        }
        #endregion

        #region "ActualizarEstadisticaPartidos"
        public void ActualizarEstadisticaPartidos(int PartidoID)
        {
            if (PartidoID != -1)
            {
                Adapter.ActualizarResultadoPartido(PartidoID);
            }
            else
            {
                Adapter.ActualizarResultadoPartido(null);
            }
        }
        #endregion

        #region "ActualizarPuntosUsuarios"
        public void ActualizarPuntosUsuarios(int PartidoID, int FaseID)
        {
            if (PartidoID != -1)
            {
                Adapter.ActualizarPuntosUsuarios(PartidoID, FaseID);
            }
            else
            {
                Adapter.ActualizarPuntosUsuarios(null, FaseID);
            }
        }
        #endregion

        #region "ConsultarFechas"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public DSPollaMundialista.FechaPartidoDataTable ConsultarFechas()
        {
            return AdapterFecha.GetData();
        }
        #endregion

    }
}