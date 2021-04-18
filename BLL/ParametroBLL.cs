#region "using"
using System.Linq;
using PollaMundialista.DAL;
#endregion

namespace BLL
{
    /// <summary>
    /// Clase que contiene los metodos y funciones de los parametros del sistema.
    /// </summary>
    [System.ComponentModel.DataObject]
    public static class ParametroBLL
    {

        private static PollaMundialista.DAL.DSPollaMundialistaTableAdapters.ParametroTableAdapter _Adapter = null;
        private static PollaMundialista.DAL.DSPollaMundialistaTableAdapters.ParametroTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new PollaMundialista.DAL.DSPollaMundialistaTableAdapters.ParametroTableAdapter();
                return _Adapter;
            }
        }

        #region "ConsultarParametros"
        /// <summary>
        /// Funcion que permite consultar los parametros.
        /// </summary>
        /// <param name="NombreParametro">Nombre del parametro.</param>
        /// <returns>DatataBle con el resultado de la consulta</returns>
        public static DSPollaMundialista.ParametroRow ConsultarParametros(string NombreParametro)
        {
            DSPollaMundialista.ParametroDataTable dt = new DSPollaMundialista.ParametroDataTable();
            DSPollaMundialista.ParametroRow dr = null;

            dt = Adapter.GetData(NombreParametro.Trim());
            if (dt != null)
            {
                if (dt.Rows.Count != 0)
                {
                    dr = dt.First();
                }
            }
            return dr;
        }
        #endregion

        #region "EditarParametro"
        /// <summary>
        /// Función que permite Editar un parametro del sistema.
        /// </summary>
        /// <param name="ParametroID">Código del Parámetro</param>
        /// <param name="ValorParametro">Valor del Parámetro</param>
        /// <returns>Mensaje indicando el error o la correcta ejecución de la función</returns>
        public static void EditarParametro(int original_ParametroID, string ValorParametro)
        {
            Adapter.UpdateParametro(ValorParametro.Trim(), original_ParametroID);
        }
        #endregion

    }

}