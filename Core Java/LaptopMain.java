
public class Test {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
		Laptop laptop = new Laptop("8/512/SSD", 58000);
		Afford af = new Afford();
		
		System.out.println(af.checkConfiguration(laptop));
		System.out.println(af.purchaseLaptop(laptop));

	}

}
