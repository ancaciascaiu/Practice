package test;

public class Derived {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Base b1 = new Base(1,1);
		Base b2 = new Base(2,2);
		Base b3 = new Base(3,3);
		System.out.println("Instance b1 x = " + b1.getX());
		System.out.println("Instance b2 x = " + b2.getX());
		System.out.println("Instance b3 x = " + b3.getX());
		System.out.println("Num instances = " + Base.num_instances);
	}

}
