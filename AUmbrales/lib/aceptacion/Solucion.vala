
/**
 * Clase que obtiene la solucion inicial 
 */
using Gee;
namespace Aumbrales.Aceptacion{
    public class Solucion : GLib.Object {
		/**La maxima distancia de camino inicial*/
		private double max;
		/**El promedio de las distancias*/
		private double avg;
		/**La grafica*/
		private double[,] map;
		/**la semilla*/
        private GLib.Rand rand;
		/*Constante*/
		private int c ;
		/**
		 * Constructor 
		 */
		public Solucion(double[,] map , int semilla,int c){
			this.map = map;
			this.rand = new GLib.Rand();
			this.rand.set_seed(semilla);
			this.max=0;
			this.avg = 0;
			this.c =c;
		}

		/**
		 * Genera un camino aleatorio de tamanio n 
		 * partir de la grafica y de la semilla 
		 */
		public int[] generaCaminoAleatorio(int n){
			var camino = new int[n];
			var x = (int)this.rand.int_range(1,278);
			int i = 0;
			camino[i] = x;
			while(n-1>0){
				var y = (int)this.rand.int_range(1,278);
				if(map[x,y]>0){
					i++;
					camino[i] = y;
					n--;
					x = y;
				}
				
			}
			this.maxAvg(camino);
			stderr.printf("max=========>%2.9f\n", this.max);
			stderr.printf("avg=========>%2.9f\n", this.avg);
			return camino;
		}

		public void caminoNoAleatorio(int[] s){
			this.maxAvg(s);
			//stderr.printf("max=========>%2.9f\n", this.max);
			//stderr.printf("avg=========>%2.9f\n", this.avg);
		}
		
		public void maxAvg(int[] s){
			int c =0;
			double d =0;
			for(int i = 0; i<s.length-2; i++){
				for (int j=i+1;j<s.length-1; j++){
					if(map[s[i],s[j]]>0){
						var de = map[s[i],s[j]];
						this.max = double.max(this.max,de);
						d += de;
						c++;
					}
				}
			}			
			this.avg = d / c;
		}
		
		/**
		 * Genera un vecino apartir de una solucion
		 */
		public int[] vecino(int[] s){
		  	var l = s.length;
			var c1= (int)this.rand.int_range(0,l);
            var c2= (int)this.rand.int_range(0,l);
			var v = new int[l];
			for(int i=0;i<l;i++){
				v[i]=s[i];
			}

			//var aux = s[c1];
			v[c1] = s[c2];
			v[c2] = s[c1];
		    /*for(int i=0;i<l;i++){
				stdout.printf("%d,",s[i]);
			}
			stdout.printf("\n");
			for(int i=0;i<l;i++){
				stdout.printf("%d,",v[i]);
			}
			stdout.printf("\n");*/
			return v;
        }

		/**
		 * Verifica si una solucion es factible 
		 */
        public bool factible(int[] s){
        	for(int i=0;i<s.length-1;i++){
				if (map[s[i],s[i+1]]<=0){
        	        return false;
                }
			}
			//stdout.printf("%s\n", "ffactible");
			return true;
			
        }

		/**
		 * Funcion de costo
		**/
		public double fcosto(int[] s){
			//stdout.printf("CALCULA FUNCION DE COSTO2\n");
			double sum =0;
			for(int i =0; i<s.length-1;i++){
				sum += dprima(s[i],s[i+1]);
				
			}
			var avgf = this.avg * s.length-1;
			//stdout.printf("TERMINA FCOSTO\n");
			return sum/avgf;
			
		}

		private double dprima(int c1,int c2){
			double distancia = 0;
			if(map[c1,c2]<=0){
				distancia= this.max * this.c;
			}else{
				distancia=map[c1,c2];
			}
			return distancia;
		}

		public int desconexiones(int[] s){
			int c =0;
			for(int i = 0 ; i<s.length-1;i++){
				if (map[s[i],s[i+1]]<0){
        	        c++;
                }
			}
			return c;

		}

		public void imprimeSolucion(int[] sol){
			string s ="";
			foreach(int i in sol){
				s+=i.to_string()+",";
			}
			try {
				string name = fcosto(sol).to_string();
				var file = File.new_for_path ("experimentos/"+name+".tsp");
				
				if (file.query_exists ()) {
					file.delete ();
				}
				
				
				var dos = new DataOutputStream (file.create (FileCreateFlags.REPLACE_DESTINATION));

				// writing a short string to the stream
				dos.put_string (s);
        
			
			} catch (Error e) {
				stderr.printf ("%s\n", e.message);
				
			}
		
		}
		
	}
}