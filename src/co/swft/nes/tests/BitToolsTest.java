package co.swft.nes.tests;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import org.junit.Test;

import co.swft.util.BitTools;

public class BitToolsTest {
	@Test
	public void testBitwiseGetMethods() {
		assertEquals(false, BitTools.getBit((byte) 0x00, 0));
		assertEquals(false, BitTools.getBit((byte) 0x00, 5));
		assertEquals(true, BitTools.getBit((byte) 0xFF, 0));
		assertEquals(true, BitTools.getBit((byte) 0xFF, 5));
		
		try {BitTools.getBit((byte) 0xBC, -1); fail();} catch(ArrayIndexOutOfBoundsException e) {} catch (Exception e) {fail();}
		try {BitTools.getBit((byte) 0xBC, 9);  fail();} catch(ArrayIndexOutOfBoundsException e) {} catch (Exception e) {fail();}
	}
	
	@Test
	public void testBitwiseSetMethods() {
		assertEquals((byte) 0xFF, BitTools.setBit((byte) 0xFF, 0, true));
		assertEquals((byte) 0xFE, BitTools.setBit((byte) 0xFF, 0, false));
		assertEquals((byte) 0x00, BitTools.setBit((byte) 0x00, 0, false));
		assertEquals((byte) 0x00, BitTools.setBit((byte) 0x10, 4, false));
		
		try {BitTools.setBit((byte) 0xBC, -1, true); fail();} catch(ArrayIndexOutOfBoundsException e) {} catch (Exception e) {fail();}
		try {BitTools.setBit((byte) 0xBC, 9,  true); fail();} catch(ArrayIndexOutOfBoundsException e) {} catch (Exception e) {fail();}
	}
}
