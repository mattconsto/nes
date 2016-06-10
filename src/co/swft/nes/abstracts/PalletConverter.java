package co.swft.nes.abstracts;

import javafx.scene.paint.Color;

public abstract class PalletConverter {
	public abstract int toARGB(byte input);
	
	public int toARGB(int input) {
		return toARGB(input & 0xff);
	}
	
	public Color toColor(byte input) {
		int argb = toARGB(input);
		return new Color((argb >> 16) & 0xff, (argb >> 8) & 0xff, (argb >> 0) & 0xff, (argb >> 24) & 0xff);
	}
}
