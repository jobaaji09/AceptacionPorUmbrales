namespace Aumbrales{
    class Main : GLib.Object {

		/**
		 *Dibuja la solucion en un svg 
		 **/
		public static  void graficaMapa(Base.Ciudad[] c,int[] sol,int seed){
			var w  =3500;
			var h = 1500;
			string s = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n"
			+"<svg width=\""+w.to_string()+"\" height=\""+h.to_string()+"\">\n"
			+"<g>\n";
			s+="<rect width='"+w.to_string()+"' height='"+h.to_string()+"' fill='black'/>\n";
			
			for(int i =1;i<c.length;i++){
				s+= creaCirculo(13.0*(c[i].longitud +125.0),13.0*(70.0-c[i].latitud));
			}
			for(int i =0;i<sol.length-1;i++){
				Base.Ciudad c1 = c[sol[i]];
				Base.Ciudad c2 = c[sol[i+1]];
				s+=linea(13.0*(c1.longitud +125.0) , 13.0*(70.0-c1.latitud), 13.0*(c2.longitud +125.0), 13.0*(70.0-c2.latitud));
			}
			
			s+="</g>"+"</svg>";
			try {
				var file = File.new_for_path ("experimentos/svg"+seed.to_string()+".svg");
				
					// delete if file already exists
				if (file.query_exists ()) {
					file.delete ();
				}
				
				var dos = new DataOutputStream (file.create (FileCreateFlags.REPLACE_DESTINATION));
				dos.put_string (s);
				
			} catch (Error e) {
				stderr.printf ("%s\n", e.message);
				
			}
			
		}
		
		/**
		 *Dubuja linea
		 */
		private static  string linea(double x, double y, double v, double w){
			return "<line x1='"+x.to_string()+ "' y1='"+y.to_string()+
			"' x2='"+v.to_string()+"' y2='"+w.to_string()+"' style='stroke:rgb(239,1,255);stroke-width:1'/>\n";
		}
		
		/**
		 * Dibuja un circulo
		 */
		private static string creaCirculo(double x, double y){
			return "<circle cx='"+x.to_string()+"' cy='"+y.to_string() +"' r='3' stroke='red' stroke-width='1' fill='black' />\n";  
		}
		/**
		 * recibe el nombre de el archivo donde esta la entrada del programa
		 */
		public static string[] archivo(string arc){
			var file = File.new_for_path (arc);
			string[] s={};
			if (!file.query_exists ()) {
				stderr.printf ("File '%s' doesn't exist.\n", file.get_path ());
				
			}
			
			try {
				// Open file for reading and wrap returned FileInputStream into a
				// DataInputStream, so we can read line by line
				var dis = new DataInputStream (file.read ());
				string line;
				// Read lines until end of file (null) is reached
				while ((line = dis.read_line (null)) != null) {
					s = line.split(",");
					//stdout.printf ("%s\n", line);
				}
			} catch (Error e) {
				error ("%s", e.message);
			}
			return s;
		}
		
		public static int main(string[] args){
			
			int seed = 0;
			int[] sol = {};
			if(args.length==3){
				seed = int.parse(args[1]);
				var ent = archivo(args[2]);
				sol = new int[ent.length];
				for(int i = 0;i<ent.length;i++){
					sol[i]=int.parse(ent[i]);
				}
				
			}else{
				return 1;
			}
		    
			
	 
			var db = new ModeloDB();
			
			var h = db.getConexiones();
					
			var s =new Aceptacion.Solucion(h ,seed,2);
					
			s.caminoNoAleatorio(sol);
			var a = new Aumbrales( s,500,0.9,0.0001,0.0001, seed.to_string());
			a.aceptacionPorUmbrales(4,sol);
			foreach(int i in a.mejor){
				stdout.printf("%d,",i);
			}
			stdout.printf("\n");
			stdout.printf("fcostomejor=%2.9f\n",s.fcosto(a.mejor));
			stdout.printf("factiblemejor=%s\n",s.factible(a.mejor).to_string());
			//s.imprimeSolucion(a.mejor);
	   
			
			Base.Ciudad[] l = db.getCiudades();
			graficaMapa(l,a.mejor,seed);
			return 0;
		}
		
    }
}