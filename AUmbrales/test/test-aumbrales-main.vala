 
namespace Aumbrales.Test{
    
    public class TestAumbralesMain {
        
        
        public static int main (string[] args) {
            GLib.Test.init(ref args);
            GLib.TestSuite.get_root().add_suite(new TestCiudad().get_suite());
			GLib.TestSuite.get_root().add_suite(new TestSolucion().get_suite());
            return GLib.Test.run();
        }
        
    }
}