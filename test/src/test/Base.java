package test;

public class Base {
	
	private int x,y;//instance variables
	static int num_instances = 0;
	
	Base(int x, int y){
		this.setX(x);
		this.y = y;
		num_instances++;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

}
