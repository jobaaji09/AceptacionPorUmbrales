namespace Aumbrales{
	class Aumbrales : GLib.Object {
		/*Solucion*/
		private Aceptacion.Solucion s;
		/*Tamanio del lote*/
		private int lote;
		
		/*Mejor solucion*/
		public int[] mejorS{get;set;}
		
		/*psi factor de enfriamiento*/
		private double psi;
		/*epsilon equlibrio termico*/
		private double epsilon;
		/*epsilonp cero virtual*/
		private double epsilonp;
                
                /*Constante C*/
                private int ce;
		/*
		 *Constructor
		 */

		public Aumbrales(Aceptacion.Solucion solucion,
						 int lote,
						 double psi,
						 double epsilon,
						 double epsilonp,
                                                 int c){
			this.s = solucion;
			this.lote =lote;
			this.psi =psi;
			this.epsilon = epsilon;
			this.epsilonp = epsilonp;
                        this.ce = c;
		}

		/*
		 * Calcuala la temepratura inicial 
		 * apartir de una solucion una temperatura t talque 0<= t <=2^k 
		 * con k muy grande
		 */  
		public double temperaturaInicial(int[] s,double t , double pacept){
			double p = porcentajesAceptados(s,t);
			stdout.printf("porcentage = %s\n",p.to_string());
			if((pacept-p).abs()<=this.epsilonp){
				return t;
			}
			double t1=0;
			double t2=0;
			if(p<pacept){
				while(p<pacept){
					t =t*2;
					p = porcentajesAceptados(s,t);
					stdout.printf("p<pacept , %s\n",p.to_string());
				}
				t1 = t/2;
				t2 = t;
			}else{
				while(p>pacept){
					t = t/2;
					p = porcentajesAceptados(s,t);
					stdout.printf("p>pacept , %s\n",p.to_string());
				}
				t1 = t;
				t2 = t*2;
				
			}
			stdout.printf(" antes de bin t1 = %s,t2=%s",t1.to_string(),t2.to_string());
			return busquedaBinaria(s,t1,t2,pacept);
		}


		private double porcentajesAceptados(int[] sol,double t){
			double c = 0;
			int[] sprima = null;
			for(int i =1;i<sol.length;i++){
				sprima = this.s.vecino(sol);
				//foreach (int a in sprima) { stdout.printf("%d,", a); }
				//stdout.printf("\n");
				if(this.s.fcosto(sprima,this.ce) <= (this.s.fcosto(sol,this.ce)+t)){
					c++;
				}
				sol = sprima;
			}
			return c / sol.length;
		}
		/**
		 * Busqueda binaria
		 */
		private double busquedaBinaria(int[] sol , double t1, double t2,double pacept){
			var tmedia = (t1+t2)/2;
			if(t2-t1<this.epsilonp){
				return tmedia;
			}
			double p = porcentajesAceptados(sol,tmedia);
			if((pacept - p).abs() < this.epsilonp){
				return tmedia;
			}
			if(p> pacept){
				//que p va?
				return busquedaBinaria(sol,t1,tmedia,pacept);
			}else{
				//que p do?
				return busquedaBinaria(sol,tmedia,t2,p);
			}
		}

		/**
		 *Calcula un lote
		 */
		public double calculaLote(double t,int[] sol){
			int c = 0;
			double r =0.0;
			int[] sprima = null;
			while(c<this.lote){
				sprima = this.s.vecino(sol);
				if(this.s.fcosto(sprima,this.ce)<= (this.s.fcosto(sol,this.ce)+t)){
					if(this.s.fcosto(sprima,this.ce)<= this.s.fcosto(this.mejorS,this.ce)  && this.s.factible(sprima)){
						this.mejorS = sprima;
						foreach (int a in sprima) { stdout.printf("%d,", a); }
						stdout.printf("\n");
					}
					sol = sprima;
					c++;
					r = r+this.s.fcosto(sprima,this.ce);
				}
			}
			return r/this.lote;
		}

		/**
		 *Aceptacion por umbrales
		 */
		public void aceptacionPorUmbrales(double t,int[]s){
			double p = double.MAX;
			while(t>this.epsilon){
				double pprima = 0;
				while((p-pprima).abs()>this.epsilonp){
					stdout.printf("p=%s , pprima=%s\n",p.to_string(),pprima.to_string());
					pprima = p;
					p = calculaLote(t,s);
					
					stdout.printf("Un Lote lleno\n");
				}
				t = this.psi*t;
				stdout.printf("temperatura=%s\n",t.to_string());
			}
			
		} 
		
		
	}

}