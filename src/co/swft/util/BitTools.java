package co.swft.util;

/**
 * 
 * @author Matthew Consterdine
 */
public class BitTools {
	/**
	 * Sets the bit at input[position] to value.
	 * @param input The byte we want to set a bit in.
	 * @param position The position of the bit in the input byte.
	 * @param value The value we want to set the bit too.
	 * @return The result of input after it has had the bit changed.
	 */
	public static byte setBit(byte input, int position, boolean value) {
		if(position < 0 || position > 7) throw new ArrayIndexOutOfBoundsException();
		return (byte) (value ? input | (1 << position) : input & ~(1 << position));
	}
	
	/**
	 * Gets the bit at input[position].
	 * @param input The byte we want to get the value of a bit from.
	 * @param position The position of the bit in the input byte.
	 * @return The value of the bit.
	 */
	public static boolean getBit(byte input, int position) {
		if(position < 0 || position > 7) throw new ArrayIndexOutOfBoundsException();
		return (input & (1 << position)) != 0;
	}
	
	/**
	 * Toggles the bit at input[position].
	 * @param input The byte we want to toggle.
	 * @param position The position of the bit in the input byte.
	 * @return The result of the toggle.
	 */
	public static byte toggleBit(byte input, int position) {
		if(position < 0 || position > 7) throw new ArrayIndexOutOfBoundsException();
		return (byte) (input ^ 1 << position);
	}
}
