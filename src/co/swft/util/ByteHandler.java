package co.swft.util;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.Arrays;

public class ByteHandler {
	protected byte[] array;
	protected int    pointer = 0;
	
	protected ByteOrder byteOrder;
	
	public class NotEnoughDataException extends Exception {
        private static final long serialVersionUID = -5531317783488069470L;
        
		public NotEnoughDataException(String message) {
			super(message);
		}
		public NotEnoughDataException(String format, Object... args) {
			super(String.format(format, args));
		}
	}
	
	public ByteHandler(byte[] array, ByteOrder byteOrder) {
		this.array     = array;
		this.byteOrder = byteOrder;
	}
	
	public ByteHandler(byte[] array) {
		this(array, ByteOrder.BIG_ENDIAN);
	}
	
	public byte[] pollN(int number) throws NotEnoughDataException {
		if(number >= 0 && number <= size()) {
			byte[] temp = Arrays.copyOfRange(array, pointer, pointer + number);
			// Lazy, crap, slow way of doing it.
			pointer += number;
			return temp;
		} else {
			throw new NotEnoughDataException("%d > %d", number, size());
		}
	}
	
	public byte[] pollToEnd() {
		try {
	        return pollN(array.length - pointer);
        } catch (NotEnoughDataException e) {
	        return null;
        }
	}
	
	public byte[] pollToNull() throws NotEnoughDataException {
		int number = 0;
		for(int i = pointer; i < array.length; i++) {
			if(array[i] == 0) {
				number = i - pointer + 1; // Include the null
				break;
			}
		}
		return pollN(number);
	}
	
	public int size() {
		return array.length - pointer;
	}
	
	public byte    pollByte()    throws NotEnoughDataException {return pollN(1)[0];}
	public char    pollChar()    throws NotEnoughDataException {return (char) pollByte();}
	public String  pollString()  throws NotEnoughDataException {return new String(pollToNull(), Charset.forName("UTF-8")).trim();}
	public int     pollInt()     throws NotEnoughDataException {return ByteBuffer.wrap(pollN(4)).order(byteOrder).getInt();}
	public long    pollLong()    throws NotEnoughDataException {return ByteBuffer.wrap(pollN(8)).order(byteOrder).getLong();}
	public short   pollShort()   throws NotEnoughDataException {return ByteBuffer.wrap(pollN(2)).order(byteOrder).getShort();}
	public float   pollFloat()   throws NotEnoughDataException {return ByteBuffer.wrap(pollN(4)).order(byteOrder).getFloat();}
	public boolean pollBoolean() throws NotEnoughDataException {return pollByte() != 0;}
}
