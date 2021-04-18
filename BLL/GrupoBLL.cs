#region "using"
using PollaMundialista.DAL;
#endregion

namespace BLL
{
    /// <summary>
    /// Clase que contiene las funciones y metodos de los Grupos.
    /// </summary>
    [System.ComponentModel.DataObject]
    public class GrupoBLL
    {

        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.GrupoTableAdapter _Adapter = null;
        private PollaMundialista.DAL.DSPollaMundialistaTableAdapters.GrupoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.GrupoTableAdapter();
                return _Adapter;
            }
        }

        #region "GrupoBLL"
        public GrupoBLL()
        {

        }
        #endregion

        #region "ConsultarGrupos"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DSPollaMundialista.GrupoDataTable ConsultarGrupos()
        {
            return Adapter.GetData();
        }
        #endregion

        #region "InsertarGrupo"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public void InsertarGrupo(string GrupoNombre)
        {
            Adapter.InsertGrupo(GrupoNombre);
        }
        #endregion

        #region "EditarGrupo"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public void EditarGrupo(string GrupoNombre, int original_GrupoID)
        {
            Adapter.UpdateGrupo(GrupoNombre.Trim(), original_GrupoID);
        }
        #endregion

        #region "EliminarGrupo"
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public void EliminarGrupo(int original_GrupoID)
        {
            Adapter.DeleteGrupo(original_GrupoID);
        }
        #endregion

    }
}