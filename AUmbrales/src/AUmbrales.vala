namespace Aumbrales{
	class Aumbrales : GLib.Object {
		/*Solucion*/
		private Aceptacion.Solucion s;
		/*Tamanio del lote*/
		private int lote;
		
		/*Mejor solucion*/
		public int[] mejor{get;set;}

		/*Altima solucion*/
		private int[] ultima;
		/*psi factor de enfriamiento*/
		private double psi;
		/*epsilon equlibrio termico*/
		private double epsilon;
		/*epsilonp cero virtual*/
		private double epsilonp;

		/*Factibles*/
		private int fac;

		/*name*/
		private string name;
		/*
		 *Constructor
		 */

		public Aumbrales(Aceptacion.Solucion solucion,
						 int lote,
						 double psi,
						 double epsilon,
						 double epsilonp,
						 string name
						 ){
			this.s = solucion;
			this.lote =lote;
			this.psi =psi;
			this.epsilon = epsilon;
			this.epsilonp = epsilonp;
			this.name = name;
		}

		/*
		 * Calcuala la temepratura inicial 
		 * apartir de una solucion una temperatura t talque 0<= t <=2^k 
		 * con k muy grande
		 */
		/*
		public double temperaturaInicial(int[] s,double t , double pacept){
			this.ultima =s;
			double p = porcentajesAceptados(t);
			stdout.printf("porcentage = %2.9f\n",p);
			if((pacept-p).abs()<=this.epsilonp){
				return t;
			}
			double t1=0;
			double t2=0;
			if(p<pacept){
				while(p<pacept){
					t =t*2;
					p = porcentajesAceptados(t);
					stdout.printf("p<pacept, %s , %2.9f\n",p.to_string(),t);
				}
				t1 = t/2;
				t2 = t;
			}else{
				while(p>pacept){
					t = t/2;
					p = porcentajesAceptados(t);
					stdout.printf("p>pacept , %s\n",p.to_string());
				}
				t1 = t;
				t2 = t*2;
				
			}
			stdout.printf(" antes de bin t1 = %s,t2=%s\n",t1.to_string(),t2.to_string());
			return busquedaBinaria(t1,t2,pacept);
		}

		Porcentaje de soluciones aceptadas
		private double porcentajesAceptados(double t){
			double c = 0;
			for(int i =1;i<this.ultima.length;i++){
				var fs = (this.s.fcosto(this.ultima)+t);
				var sprima = this.s.vecino(this.ultima);
				var fp = this.s.fcosto(sprima);
				if(fp <=fs ){
					c++;
				}
			}
			stdout.printf("c = %2.9f\n",c);
			return c / this.ultima.length;
		}
		**
		 * Busqueda binaria
		 *
		private double busquedaBinaria(double t1, double t2,double pacept){
			var tmedia = (t1+t2)/2;
			if(t2-t1<this.epsilonp){
				return tmedia;
			}
			double p = porcentajesAceptados(tmedia);
			if((pacept - p).abs() < this.epsilonp){
				return tmedia;
			}
			if(p> pacept){
				//que p va?
				return busquedaBinaria(t1,tmedia,p);
			}else{
				//que p do?
				return busquedaBinaria(tmedia,t2,pacept);
			}
		}
		*/
		/**
		 *Calcula un lote
		 */
		private double calculaLote(double t){
			//stdout.printf("EMPIEZA LOTE\n");
			int c = 0;
			double r =0;
			while(c<this.lote){
				var fsl = (this.s.fcosto(this.ultima)+t);
				var sprima = this.s.vecino(this.ultima);
				var fsp = this.s.fcosto(sprima);
				//stdout.printf("fsp=%2.9f , fsl = %2.9f\n ",fsp,fsl);
				if(fsp<= fsl){
					var fm = this.s.fcosto(this.mejor);
					if(fsp<=fm){
						
						this.mejor = sprima;
					}
					//imprime(fsp);
					r+=fsp;
					this.ultima = sprima;
					c++;
					this.fac++;
				}
			    
			}
			//stdout.printf("r=%2.9f\n",r);
			//stdout.printf("TERMINA LOTE\n");
			return r/this.lote;
		}

		/**
		 *Aceptacion por umbrales
		 */
		public void aceptacionPorUmbrales(double t,int[]sol){
		
			this.mejor = sol;
			this.ultima =sol;
			double p = double.MAX;
			while(t>this.epsilon){
				double pprima = 0;
				this.fac=0;
				while((p-pprima).abs()>this.epsilonp){
					//stdout.printf("p=%2.9f , pprima=%2.9f\n",p,pprima);
					pprima = p;
					p = calculaLote(t);
					//	stdout.printf("Un Lote lleno\n");
				}
				//stdout.printf("fcosto=%2.9f\n",this.s.fcosto(this.mejor));
				//stdout.printf("aceptadas = %d\n ",this.fac);
				t = this.psi*t;
				//stdout.printf("temperatura=%2.9f\n",t);
			    
			}
			
			
		}
		/*
		public void imprime(double f){
			
			File file = File.new_for_path ("experimentos/"+this.name+".txt");
			try {
				// Append a new line on each run:
				FileOutputStream os = file.append_to (FileCreateFlags.NONE);
				var s ="E:"+f.to_string()+"\n";
				os.write (s.data);
			} catch (Error e) {
				stdout.printf ("Error: %s\n", e.message);
			}


		}
		*/
		
		
	}
	
}