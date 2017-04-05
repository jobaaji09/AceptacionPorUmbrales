using Gee;
namespace Aumbrales.Test{
	/**
	 * Test para {@link Solucion}
	 */
	public class TestSolucion : Aumbrales.Test.TestCase{
		private Aceptacion.Solucion s;
		public TestSolucion(){
			base("TestCiudad");
			add_test("test_generaCaminoAleatorio",test_generaCaminoAleatorio);
			add_test("test_caminoNoAleatorio",test_caminoNoAleatorio);
			var rand =new GLib.Rand();
			var map = new HashMap<string,double?>();
			for(int i = 1;i<277;i++){
				map[((int)rand.int_range(1,278)).to_string()
					+","+
					((int)rand.int_range(1,278)).to_string()] = (double)rand.double_range(1,278);
			}
			s = new Aceptacion.Solucion(map , 2);
		}

		public void test_generaCaminoAleatorio(){
			int[] a = s.generaCaminoAleatorio(5);
			assert (a.length == 5);
			int[] sa = s.vecino(a);
			int d =0;
			for(int i=0;i<a.length;i++){
				if(a[i] != sa[i]){
					d++;
					
				}
			}
			assert (d ==2);
			
		}
		
		public void test_caminoNoAleatorio(){
			
			int[] a = {1,2,5,4,277};
			s.caminoNoAleatorio(a);
			int d =0;
	    
			assert (d == 0);
			//assert (d == 2);
			
		}
		
	}
	
}