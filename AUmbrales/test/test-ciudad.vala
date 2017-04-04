namespace Aumbrales.Test{
    /**
     * Test cases for {@link Ciudad}.
     */
    public class TestCiudad : Aumbrales.Test.TestCase{
        
        public TestCiudad(){
            base("TestCiudad");
            add_test("test_ciudad",test_ciudad);
        }
        
        public  void test_ciudad () {
            var c = new Base.Ciudad();
			c.id = 1;
			c.nombre ="jonathan";
			c.pais = "Mexico";
			c.poblacion = 1000000;
			c.latitud = 1.2;
			c.longitud= 1.2;
			assert (c.id == 1);
            assert (c.nombre == "jonathan");
            assert (c.pais == "Mexico");
			assert (c.poblacion == 1000000);
			assert (c.longitud == 1.2);
			assert (c.longitud == 1.2);
        }
        
    }
}