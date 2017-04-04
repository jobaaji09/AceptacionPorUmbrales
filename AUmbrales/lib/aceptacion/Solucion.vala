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
			var x = (int)this.rand.int_range(1,277);
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
			return camino;
		}
		
		private double getMax(int[] s){
			double max=0;
			for(int i = 1 ; i<s.length;i++){
				var k = map[s[(i-1)].to_string()+","+s[i].to_string()]; 
				if(k!=null){
					if(k>max){
						max = k;
						
					}
				}else{
					k = map[s[i].to_string()+","+s[(i-1)].to_string()];
					if(k>max){
						max = k;
					}
				}
				//stdout.printf("max = %s\n",max.to_string());
			}
			return max;
		}

		private double getAvg(int[] s){
			double sum =0;
			for(int i = 1;i<s.length;i++){
				var dis = map[s[i-1].to_string()+","+s[i].to_string()];
				if(dis!=null){
					sum+= dis;
				}else{
					dis = map[s[i].to_string()+","+s[i-1].to_string()];
					sum+= dis;
				}
				//stdout.printf("sum = %s\n",dis.to_string());
			}
			//stdout.printf("tam s = %s\n",s.length.to_string());
			//stdout.printf("div = %s\n",(9/3).to_string());
			return sum/s.length;
		}
		/**
		 * Genera un vecino apartir de una solucion
		 */
		public int[] vecino(int[] s){
			var l = s.length-1;
			var out = new int[l+1];
            var c1= (int)this.rand.int_range(0,l+1);
            var c2= (int)this.rand.int_range(0,l+1);
            for(int i = 0;i<=l; i++){
                if(i==c1){
                	out[i]= s[c2];
				}else
                if(i==c2){
					out[i] = s[c1];
				}else{
                out[i] = s[i];
				}
            }
            return out;
        }

		/**
		 * Verifica si una solucion es factible 
		 */
        public bool factible(int[] s){
        	for(int i=1;i<s.length;i++){
                var k1= s[i-1].to_string() +","+ s[i].to_string();
                var k2 = s[i].to_string() +","+ s[i-1].to_string();
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
			for(int i =1; i<s.length;i++){
				sum += dprima(i-1,i,c);
			}
			var avgf = this.avg * s.length; 
			return sum/avgf;
			
		}

		private double dprima(int c1,int c2,int c){
			double distancia = 0;
			var di = map[c1.to_string()+","+c2.to_string()];
			var dv = map[c2.to_string()+","+c1.to_string()];
			if(di==null && dv == null){
				distancia =  this.max * c;
			}else{
				if(di!=null){
					distancia = di;
				}else{
					distancia = dv;
				}
			}
			return distancia;
		}
	    
	}
}