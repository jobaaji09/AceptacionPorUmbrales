namespace Aumbrales{
    class Main : GLib.Object {

        
        public static int main(string[] args){
			var db = new ModeloDB();
			var h = db.getConexiones();
			//Solucion
			var s = new Aceptacion.Solucion(h,5);
			//var sini = s.generaCaminoAleatorio(20);
			//foreach (int a in sinicial) { stdout.printf("%d,", a); }
			//stdout.printf("\n");
			int[]  sinicial = {1, 5, 9, 12, 16, 22, 23, 29, 30, 31, 39, 48, 52, 56, 58, 62, 65, 66, 70, 75, 80, 84, 86, 90, 92, 94, 95, 101, 107, 117, 119, 122, 133, 135, 143, 144, 146, 147, 150, 158, 159, 160, 166, 167, 176, 178, 179, 185, 186, 188, 190, 191, 194, 198, 200, 203, 207, 209, 213, 215, 216, 220, 221, 224, 227, 232, 233, 235, 238, 241, 244, 248, 250, 254, 264, 266, 274, 276};
			int[] si = s.caminoNoAleatorio(sinicial);
			//foreach (int a in sinicial) { stdout.printf("%d,", a); }
			//stdout.printf("\n");
			//solucion, lote, psi , epsilon , epsilonp , C
			
			var a =new  Aumbrales(s,500, 0.95, 0.0003 ,10,2);
			a.mejorS = si;
		   
			var t = a.temperaturaInicial(si,8,0.85);
			stdout.printf("t = %s\n",t.to_string());

			a.aceptacionPorUmbrales(t,si);
			stdout.printf("Elmejor es :\n ");
			
			foreach (int i in a.mejorS) { stdout.printf("%d,", i); }
			stdout.printf("\n");
			int d  = s.desconexiones(a.mejorS);
			foreach (int i in a.mejorS) { stdout.printf("%d,", i); }
			stdout.printf("\n");
			stdout.printf("desconexion = %d\n",d);
			
			return 0;
		}
		
    }
}