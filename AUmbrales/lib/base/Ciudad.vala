
/**
 * Clase que representa una ciudad
 */
namespace Aumbrales.Base{
    public class Ciudad : GLib.Object{
    	/**
	 * Constructor para una ciudad.
	 */

	public Ciudad( ){}

	/**
	 * Regresa y define el id de la ciudad
	 */

	public int id {get; set;}

	/**
	 * Regresa y define el nombre de la ciudad
	 */

	public string nombre {get; set;}

	/**
	 * Regresa y define el pais de la ciudad
	 */

	public string pais {get; set;}

	/**
	 * Regresa y define la poblacion  de la ciudad
	 */

	public int poblacion {get; set;}

	/**
	 * Regresa y define la latitud de la ciudad
	 */

	public double latitud {get; set;}

	/**
	 * Regresa y define el longitud de la ciudad
	 */

	public double longitud {get; set;}
	
	public string to_string(){
            string ids = this.id.to_string();
            string ps = this.poblacion.to_string();
            string la = this.latitud.to_string();
            string lo = this.longitud.to_string();
            return ids + this.nombre + this.pais + ps + la + lo+"\n"; 
        }
	

    }
  


}
