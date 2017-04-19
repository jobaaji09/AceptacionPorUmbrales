namespace Aumbrales{
    class Main : GLib.Object {
        

		public static int main(string[] args){
			var db = new ModeloDB();
			var h = db.getConexiones();
			stdout.printf("%2.9f\n",h[274,276]);
			stdout.printf("%2.9f\n",h[276,274]);
		    var s =new Aceptacion.Solucion(h ,4,5);
			//var sol = s.generaCaminoAleatorio(5);
			int[] sol = {1, 5, 9, 12, 16, 22, 23, 29, 30, 31, 39, 48, 52, 56, 58, 62, 65, 66, 70, 75, 80, 84, 86, 90, 92, 94, 95, 101, 107, 117, 119, 122, 133, 135, 143, 144, 146, 147, 150, 158, 159, 160, 166, 167, 176, 178, 179, 185, 186, 188, 190, 191, 194, 198, 200, 203, 207, 209, 213, 215, 216, 220, 221, 224, 227, 232, 233, 235, 238, 241, 244, 248, 250, 254, 264, 266, 274, 276};
			s.caminoNoAleatorio(sol);
			var a = new Aumbrales( s,500,0.9,0.0003,0.0003);
			//var t = a.temperaturaInicial(sol,8 ,0.85);
			a.aceptacionPorUmbrales(4,sol);
			foreach(int i in a.mejor){
				stdout.printf("%d,",i);
			}
			stdout.printf("\n");
			stdout.printf("fcostomejor=%2.9f\n",s.fcosto(a.mejor));
			stdout.printf("factiblemejor=%s\n",s.factible(a.mejor).to_string());
			return 0;

		}
		
    }
}