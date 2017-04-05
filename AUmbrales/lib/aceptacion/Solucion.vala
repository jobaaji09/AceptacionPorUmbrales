
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
		private HashMap<string, double?> map;
		/**la semilla*/
        private GLib.Rand rand;
		/**
		 * Constructor 
		 */
		public Solucion(HashMap<string, double?> map , int semilla){
			this.map = map;
			this.rand = new GLib.Rand();
			this.rand.set_seed(semilla);
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
			//stdout.printf("x=%d\n",x);
			while(n-1>0){
				var y = (int)this.rand.int_range(1,278);
				var k =map[x.to_string()+","+y.to_string()];
				var k1 =map[y.to_string()+","+x.to_string()];
				//stdout.printf ("key1: %s , key2 : %s\n", k ,k1);
				if( k != null || k1 != null){
					//stdout.printf("y=%d\n",y);
					i++;
					camino[i] = y;
					x =y;
					n--;
				}
				//stdout.printf("x =%d\n",x);
			}
			this.max = getMax(camino);
			this.avg = getAvg(camino);
			//stderr.printf("====>%2.9f\n", this.max);
			//stderr.printf("====>%2.9f\n", this.avg);
			return camino;
		}

		public void caminoNoAleatorio(int[] s){
			this.max = getMax(s);
			this.avg = getAvg(s);
			//stdout.printf("max = %2.9f\n",this.max);
			//stdout.printf("avg = %2.9f\n",this.avg);
			
		}
		
		public double getMax(int[] s){
			double max=0;
			for(int i =0 ; i<s.length-1;i++){
				var di = map[s[(i)].to_string()+","+s[i+1].to_string()];
				var dv = map[s[i].to_string()+","+s[(i+1)].to_string()];
				if(di!=null && dv != null ){
					if(di !=null){
						max+= di;
					}else{
						max+=dv;
					}
				}
			
			    
			}
			return max;
		}
		
		public double getAvg(int[] s){
			double sum =0;
			for(int i = 0;i<s.length-1;i++){
				var di = map[s[(i)].to_string()+","+s[i+1].to_string()];
				var dv = map[s[i].to_string()+","+s[(i+1)].to_string()];
				if(di!=null && dv != null ){
					if(di !=null){
						sum+= di;
					}else{
						sum+=dv;
					}
				}
				//stdout.printf("avg = %2.9f\n",sum);
			}
			
			return sum/s.length;
		}
		/**
		 * Genera un vecino apartir de una solucion
		 */
		public int[] vecino(int[] s){
			var l = s.length;
			var o = new int[l];
			for(int i = 0 ;i<l;i++){
				o[i] = s[i];
			}
            var c1= (int)this.rand.int_range(0,l);
            var c2= (int)this.rand.int_range(0,l);
			var aux=o[c1];
			o[c1] = o[c2];
			o[c2] = aux;
            return o;
        }

		/**
		 * Verifica si una solucion es factible 
		 */
        public bool factible(int[] s){
        	for(int i=0;i<s.length-1;i++){
                var k1= s[i].to_string() +","+ s[i+1].to_string();
                var k2 = s[i+1].to_string() +","+ s[i].to_string();
				//stdout.printf("k1=%s,k2=%s\n",k1,k2);
        	    if (map[k1] == null && map[k2] == null){
        	        return false;
                }
			}
			return true;
			
        }

		/**
		 * Funcion de costo
		**/
		public double fcosto(int[] s,int c){
			double sum =0;
			for(int i =0; i<s.length-1;i++){
				sum += dprima(s[i],s[i+1],c);
				//stderr.printf("sum=========>%2.9f\n", sum);
			}
			var avgf = this.avg * s.length;
			
			return sum/avgf;
			
		}

		private double dprima(int c1,int c2,int c){
			double distancia = 0;
			var di = map[c1.to_string()+","+c2.to_string()];
			var dv = map[c2.to_string()+","+c1.to_string()];
			//stderr.printf("=========>%2.9f %2.9f\n", di, dv);
			if(di==null && dv == null){
				//stderr.printf("Siempre aqui?\n");
				distancia= this.max * c;
			}else{
				if(di!=null){
					distancia = di;
				}else{
					distancia = dv;
				}
			}
			//stderr.printf("=========>%2.9f\n", distancia);
			return distancia;
		}

		public int desconexiones(int[] s){
			int c =0;
			for(int i = 0 ; i<s.length-1;i++){
				var k1= s[i].to_string() +","+ s[i+1].to_string();
                var k2 = s[i+1].to_string() +","+ s[i].to_string();
				//stdout.printf("k1=%s,k2=%s\n",k1,k2);
        	    if (map[k1] == null && map[k2] == null){
        	        c++;
                }
			}
			return c;

		} 
	    
	}
}