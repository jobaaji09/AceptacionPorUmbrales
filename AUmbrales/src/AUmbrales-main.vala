namespace Aumbrales{
    class Main : GLib.Object {

        
        public static int main(string[] args){
			var db = new ModeloDB();
			var h = db.getConexiones();
			//for(int j =2 ; j<200;j++){
			var s = new Aceptacion.Solucion(h,20,2);
			
			int[]  sini = {1, 5, 9, 12, 16, 22, 23, 29, 30, 31, 39, 48, 52, 56, 58, 62, 65, 66, 70, 75, 80, 84, 86, 90, 92, 94, 95, 101, 107, 117, 119, 122, 133, 135, 143, 144, 146, 147, 150, 158, 159, 160, 166, 167, 176, 178, 179, 185, 186, 188, 190, 191, 194, 198, 200, 203, 207, 209, 213, 215, 216, 220, 221, 224, 227, 232, 233, 235, 238, 241, 244, 248, 250, 254, 264, 266, 274, 276};

		
			s.caminoNoAleatorio(sini);
			//Solucion lote psi epsilon epsilonp 
			var a = new Aumbrales(s, 500, 0.9, 0.001, 0.1);
			//var t = a.temperaturaInicial(sini,8,0.85);
			a.aceptacionPorUmbrales(4,sini);
			string ou = "";
			foreach(int i in a.mejor){
				ou+=i.to_string()+",";
				stdout.printf("%d ,",i);
			}
			ou+= "\n"+s.desconexiones(a.mejor).to_string()+"\n"+s.factible(a.mejor).to_string()+"\n"+s.fcosto(a.mejor).to_string();
			stdout.printf("desconexiones = %d , f =%s\n",s.desconexiones(a.mejor),s.factible(a.mejor).to_string());
			stdout.printf("fcosto=%2.9f\n",s.fcosto(a.mejor));
			
			try {
				// an output file in the current working directory
				var file = File.new_for_path ("experimentos/"+20.to_string()+"cc2"+".tsp");
				
				// delete if file already exists
				if (file.query_exists ()) {
					file.delete ();
				}
				
				var dos = new DataOutputStream (file.create (FileCreateFlags.REPLACE_DESTINATION));
				
				// writing a short string to the stream
				dos.put_string (ou);
				
			} catch (Error e) {
				stderr.printf ("%s\n", e.message);
					return 1;
			}
			//}
			return 0;
		}
		
    }
}