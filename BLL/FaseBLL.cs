#region "using"
using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using PollaMundialista.DAL;
#endregion

namespace BLL
{
    /// <summary>
    /// Clase que contiene las funciones y metodos de los Fases.
    /// </summary>
    [System.ComponentModel.DataObject]
    public class FaseBLL
    {
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.FaseTableAdapter _Adapter = null;
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.FaseTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.FaseTableAdapter();
                return _Adapter;
            }
        }

        #region "FaseBLL"
        public FaseBLL()
        {

        }
        #endregion

        #region "ConsultarFase"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DSPollaMundialista.FaseDataTable ConsultarFase()
        {
            return Adapter.GetData();
        }
        #endregion

        #region "EditarFase"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public void EditarFase(string FaseNombre, int original_FaseID)
        {
            Adapter.UpdateFase(FaseNombre.Trim(), original_FaseID);
        }
        #endregion

        #region "InsertarFase"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public void InsertarFase(string FaseNombre)
        {
            Adapter.InsertFase(FaseNombre.Trim());
        }
        #endregion

        #region "EliminarFase"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public void EliminarFase(int original_FaseID)
        {
            Adapter.DeleteFase(original_FaseID);
        }
        #endregion

    }
}