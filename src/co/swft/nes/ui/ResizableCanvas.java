package co.swft.nes.ui;

import javafx.beans.NamedArg;
import javafx.scene.canvas.Canvas;

public class ResizableCanvas extends Canvas {
	private double ratio; // Width / Height
	
	public ResizableCanvas(@NamedArg("ratio") double ratio) {
		super();
		this.ratio = ratio;
	}
	
	public ResizableCanvas() {
		this(1.0);
	}
	
	public void setRatio(double ratio) {
		this.ratio = ratio;
		this.autosize();
	}
	
	public double getRatio() {
		return ratio;
	}

	@Override
	public double minHeight(double width) {
		return 0;
	}
	
	@Override
	public double minWidth(double height) {
		return 0;
	}
	
	@Override
	public double maxHeight(double width) {
		return Double.MAX_VALUE;
	}
	
	@Override
	public double maxWidth(double height) {
		return Double.MAX_VALUE;
	}
	
	@Override
	public double prefHeight(double width) {
		return width / ratio;
	}
	
	@Override
	public double prefWidth(double height) {
		return height * ratio;
	}

	@Override
	public boolean isResizable() {
		return true;
	}
	
	@Override
	public void resize(double width, double height) {
		double min = Math.min(width / ratio, height);
		
		super.setWidth(min * ratio);
		super.setHeight(min);
	}
}
