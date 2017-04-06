
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
			this.max=0;
			this.avg = 0;
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
			this.maxAvg(camino);
			return camino;
		}

		public void caminoNoAleatorio(int[] s){
			this.maxAvg(s);
			stderr.printf("max=========>%2.9f\n", this.max);
			stderr.printf("avg=========>%2.9f\n", this.avg);
		}
		
		public void maxAvg(int[] s){
			int c =0;
			double d =0;
			for(int i = 0; i<s.length-2; i++){
				for (int j=i+1;j<s.length-1; j++){
					var dis= map[i.to_string()+","+j.to_string()];
					var dis1= map[j.to_string()+","+i.to_string()];
					if(dis != null){
						this.max = double.max(this.max,dis);
						d += dis;
						c++;
					}else if(dis1 != null){
						this.max = double.max(this.max,dis1);
						d += dis1;
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
			stdout.printf("EMPIEZA A CALCULAR VECINO\n");
			var l = s.length;
            var c1= (int)this.rand.int_range(0,(l-1));
            var c2= (int)this.rand.int_range(0,(l-1));
			var aux=s[c1];
			s[c1] = s[c2];
			s[c2] = aux;
			stdout.printf("TERMINO DE CALCULAR VECINO\n");
            return s;
        }

		/**
		 * Verifica si una solucion es factible 
		 */
        public bool factible(int[] s){
			stdout.printf("CALCULA FACTIBLES\n");
        	for(int i=0;i<s.length-2;i++){
                var k1= s[i].to_string() +","+ s[i+1].to_string();
                var k2 = s[i+1].to_string() +","+ s[i].to_string();
				//stdout.printf("k1=%s,k2=%s\n",k1,k2);
        	    if (map[k1] == null && map[k2] == null){
        	        return false;
                }
			}
			//stdout.printf("%s\n", "ffactible");
			return true;
			
        }

		/**
		 * Funcion de costo
		**/
		public double fcosto(int[] s,int c){
			stdout.printf("CALCULA FUNCION DE COSTO2\n");
			double sum =0;
			for(int i =0; i<s.length-2;i++){
				sum += dprima(s[i],s[i+1],c);
				
			}
			var avgf = this.avg * s.length-1;
			stdout.printf("TERMINA FCOSTO\n");
			return sum/avgf;
			
		}

		private double dprima(int c1,int c2,int c){
			stdout.printf("CALCULA DPRIMAddddddd\n");
			double distancia = 0;
			stdout.printf("tugfa %d %d\n",c1,c2);
			var s1 = c1.to_string()+","+c2.to_string();
			stdout.printf("tugfa\n");
			var s2 = c2.to_string()+","+c1.to_string();
			if(!map.has_key(s1) && !map.has_key(s2)){
				distancia= this.max * c;
			}else{
				if(map.has_key(s1)){
					distancia = map[s1];
				}else{
					distancia = map[s2];
				}
			}
			//stderr.printf("=========>%2.9f\n", distancia);
			stdout.printf("TERMINA DPRIMA\n");
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