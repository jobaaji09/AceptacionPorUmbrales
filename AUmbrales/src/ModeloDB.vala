/**
 * Clase que obtiene la ciudades
 * de la base de datos
 */
namespace Aumbrales{
    public class ModeloDB : GLib.Object {
        private Sqlite.Database db;
		//private string errmsg;
		private Sqlite.Statement stmt;
        /*
	 	* Constructor que abre una Conexion a la base de datos.
	 	*/
        public ModeloDB(){
            int ec = Sqlite.Database.open ("ciudades", out this.db);
	    	if (ec != Sqlite.OK) {
                stderr.printf ("Can't open database: %d: %s\n",
				this.db.errcode (), this.db.errmsg ());
            }
	 	}
        
		/* Metodo que obtiene todas la ciudades */
		public List<Base.Ciudad> getCiudades(){
            var ci = new List<Base.Ciudad>();
            const string prepared_query_str = "SELECT * FROM cities;";
            int ec = db.prepare_v2 (prepared_query_str,
									prepared_query_str.length,
									out this.stmt);
            if (ec != Sqlite.OK) {
                stderr.printf ("Error: %d: %s\n",
							   this.db.errcode (),
							   this.db.errmsg ());
            }
            int cols = this.stmt.column_count();
            while (stmt.step () == Sqlite.ROW) {
                var c = new Base.Ciudad();
                for (int i = 0; i < cols; i++) {
                    var col_name = stmt.column_name (i) ?? "<none>";
                    var val = stmt.column_text (i) ?? "<none>";
                    //stdout.printf ("column: %s\n", col_name);
                    switch (col_name) {
                        case "id":
                            c.id = int.parse(val);
                            break;
                        case "name":
                            c.nombre =val;
                            break;
                        case "country":
                            c.pais =val;
                            break;
                        case "population":
                            c.poblacion= int.parse(val);
                            break;
                        case "latitude":
                            c.latitud = double.parse(val);
                            break;
                        case "longitude":
                            c.longitud = double.parse(val);
                            break;
                    }
                    //stdout.printf ("value: %s\n", val);
                    
                    
                }
                ci.append(c);
            }
            // Reset the statement to rebind parameters:
            this.stmt.reset ();
            return ci;
		}

		/* Metodo que obtiene una ciudad dado el id */
		public Base.Ciudad getCiudad(int id){
            var c = new Base.Ciudad();
            const string prepared_query_str = "SELECT * FROM cities WHERE id =$UID;";
            int ec = db.prepare_v2 (prepared_query_str,
									prepared_query_str.length,
									out this.stmt);
            if (ec != Sqlite.OK) {
                stderr.printf ("Error: %d: %s\n",
							   this.db.errcode (),
							   this.db.errmsg ());
            }
	    	int param_position = stmt.bind_parameter_index ("$UID");
	    	assert (param_position > 0);
	    	stmt.bind_int (param_position, id);
            int cols = this.stmt.column_count();
            while (stmt.step () == Sqlite.ROW) {
                for (int i = 0; i < cols; i++) {
                    var col_name = stmt.column_name (i) ?? "<none>";
                    var val = stmt.column_text (i) ?? "<none>";
                    //stdout.printf ("column: %s\n", col_name);
                    switch (col_name) {
                        case "id":
                            c.id = int.parse(val);
                            break;
                        case "name":
                            c.nombre =val;
                            break;
                        case "country":
                            c.pais =val;
                            break;
                        case "population":
                            c.poblacion= int.parse(val);
                            break;
                        case "latitude":
                            c.latitud = double.parse(val);
                            break;
                        case "longitude":
                            c.longitud = double.parse(val);
                            break;
                    }
                    //stdout.printf ("value: %s\n", val);
                    
                    
                }
            }
            // Reset the statement to rebind parameters:
            this.stmt.reset ();
            return c;
		}

        /* Metodo que obtiene la grafica de las ciudades */
		public Gee.HashMap<string,double?> getConexiones(){
            var map = new Gee.HashMap<string,double?>();
            const string prepared_query_str = "SELECT * FROM connections;";
            int ec = db.prepare_v2 (prepared_query_str,
									prepared_query_str.length,
									out this.stmt);
            if (ec != Sqlite.OK) {
                stderr.printf ("Error: %d: %s\n",
							   this.db.errcode (),
							   this.db.errmsg ());
            }
            int cols = this.stmt.column_count();
            while (stmt.step () == Sqlite.ROW) {
                var key = "";
                for (int i = 0; i < cols; i++) {
                    var col_name = stmt.column_name (i) ?? "<none>";
                    var val = stmt.column_text (i) ?? "<none>";
                    //stdout.printf ("column: %s\n", col_name);

					 switch (col_name) {
                        case "distance":
							var d = double.parse(val);
							map[key] = d;
							//stdout.printf ("val: %s\n", val);
							//stdout.printf ("valparse: %s\n", d.to_string());
							break;
                        case "id_city_1":
                            key += val + ",";
                            break;
                        case "id_city_2":
                            key += val;
                            break;
                    }
                    
                    
                }
            }
            // Reset the statement to rebind parameters:
            this.stmt.reset ();
            return map;
		}
    }

}
