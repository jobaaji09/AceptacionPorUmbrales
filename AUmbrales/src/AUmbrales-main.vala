namespace Aumbrales{
    class Main : GLib.Object {

        
        public static int main(string[] args){
			var db = new ModeloDB();
			var h = db.getConexiones();
			//for(int j =1 ; j<200;j++){
				var s = new Aceptacion.Solucion(h,9);
				//var si = s.generaCaminoAleatorio(78);
				int[]  sini = {1, 5, 9, 12, 16, 22, 23, 29, 30, 31, 39, 48, 52, 56, 58, 62, 65, 66, 70, 75, 80, 84, 86, 90, 92, 94, 95, 101, 107, 117, 119, 122, 133, 135, 143, 144, 146, 147, 150, 158, 159, 160, 166, 167, 176, 178, 179, 185, 186, 188, 190, 191, 194, 198, 200, 203, 207, 209, 213, 215, 216, 220, 221, 224, 227, 232, 233, 235, 238, 241, 244, 248, 250, 254, 264, 266, 274, 276};

				s.caminoNoAleatorio(sini);
				//Solucion lote psi epsilon epsilonp c
				//var nueva = s.generaCaminoAleatorio(5);
				var a = new Aumbrales(s, 500, 0.87, 0.009, 0.49, 10);
				//var t = a.temperaturaInicial(sini,8,0.85);
				a.aceptacionPorUmbrales(4,sini);
				
				//foreach(int i in a.mejorS){stdout.printf("%d ,",i);}
				//stdout.printf("desconexiones = %d , f =%s\n",s.desconexiones(a.mejorS),s.factible(a.mejorS).to_string());
				//stdout.printf("fcosto=%2.9f\n",s.fcosto(a.mejorS,2));
				//foreach(int i in sini){stdout.printf("%d ,",i);}
				//stdout.printf("desconexiones = %d f = %s\n",s.desconexiones(sini),s.factible(sini).to_string());
				//stdout.printf("fcosto=%2.9f\n",s.fcosto(sini,2));
				//}
			return 0;
		}
		
    }
}