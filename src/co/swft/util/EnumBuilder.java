package co.swft.util;
public class EnumBuilder {
	/**
	 * Takes what may be the start of an enum value, searches for it, and it it finds it then it 
	 * returns the value. If not it returns the last value in the enum.
	 * @param e The enum
	 * @param input A string containing what may be the start of an enum value.
	 * @return An enum constant.
	 */
	public static <E extends Enum<E>> E from(Class<E> e, String input) {
		for(E type : e.getEnumConstants()) {
			if(type.toString().substring(0, input.length()).equals(input.toUpperCase()))
				return type;
		}
		
		return e.getEnumConstants()[e.getEnumConstants().length-1];
	}
	
	public static <E extends Enum<E>> E from(Class<E> e, char input) {
		return from(e, Character.toString(input));
	}
}