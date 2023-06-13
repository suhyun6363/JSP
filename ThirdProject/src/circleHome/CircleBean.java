package circleHome;
import java.lang.Math;

public class CircleBean {
	private int x;
	private int y;
	private int radius;

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int getRadius() {
		return radius;
	}

	public void setRadius(int radius) {
		this.radius = radius;
	}
	
	public String printCircle() {
		StringBuffer sb = new StringBuffer();
		sb.append("원점: (" + x + "," + y + ")");
		sb.append(" 면적: " + Math.PI * radius * radius);
		return sb.toString();
	}
}
