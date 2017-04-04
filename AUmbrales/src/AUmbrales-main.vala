namespace Aumbrales{
    class Main : GLib.Object {

        
        public static int main(string[] args){
			var db = new ModeloDB();
			var h = db.getConexiones();

			var s = new Aceptacion.Solucion(h,1);
			var sinicial = s.generaCaminoAleatorio(20);
			foreach (int a in sinicial) { stdout.printf("%d,", a); }
			stdout.printf("\n");
			//solucion, lote, psi , epsilon , epsilonp , C
			var a =new  Aumbrales(s,100000,	 0.7, 0.3,10,2);
			a.mejorS = sinicial;
			var t = a.temperaturaInicial(sinicial,8,0.95);
			stdout.printf("t = %s\n",t.to_string());
			a.aceptacionPorUmbrales(t,sinicial);
			stdout.printf("Elmejor es :\n ");
			foreach (int i in a.mejorS) { stdout.printf("%d,", i); }
			stdout.printf("\n");
			foreach (int i in sinicial) { stdout.printf("%d,", i); }
			stdout.printf("\n");
			return 0;
		}
		
    }
}