#region "using"
using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using PollaMundialista.DAL;
#endregion

namespace BLL
{
    /// <summary>
    /// Clase que contiene las funciones y metodos de los estadios.
    /// </summary>
    [System.ComponentModel.DataObject]
    public class EstadioBLL
    {
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.EstadioTableAdapter _Adapter = null;
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.EstadioTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.EstadioTableAdapter();
                return _Adapter;
            }
        }

        #region "EstadioBLL"
        public EstadioBLL()
        {

        }
        #endregion

        #region "ConsultarEstadio"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DSPollaMundialista.EstadioDataTable ConsultarEstadio()
        {
            return Adapter.GetData();
        }
        #endregion

        #region "EditarEstadio"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public void EditarEstadio(string EstadioNombre, int original_EstadioID)
        {
            Adapter.UpdateEstadio(EstadioNombre.Trim(), original_EstadioID);
        }
        #endregion

        #region "InsertarEstadio"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public void InsertarEstadio(string EstadioNombre)
        {
            Adapter.InsertEstadio(EstadioNombre.Trim());
        }
        #endregion

        #region "EliminarEstadio"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public void EliminarEstadio(int original_EstadioID)
        {
            Adapter.DeleteEstadio(original_EstadioID);
        }
        #endregion

    }
}