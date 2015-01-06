package co.swft.nes.tests;

import static org.junit.Assert.*;

import org.junit.Test;

import co.swft.nes.java.RicohCPU;

public class RicohCPUTest {
	@Test
	public void testAllCPUFlags() {
		RicohCPU cpu = new RicohCPU(null, null, null);
		
		assertEquals(false, cpu.getCarryFlag());
		cpu.setCarryFlag(true);
		assertEquals(true, cpu.getCarryFlag());
		cpu.setCarryFlag(false);
		assertEquals(false, cpu.getCarryFlag());

		assertEquals(true, cpu.getZeroFlag()); // Different as accumulator starts on 0.
		cpu.setZeroFlag(true);
		assertEquals(true, cpu.getZeroFlag());
		cpu.setZeroFlag(false);
		assertEquals(false, cpu.getZeroFlag());
		
		
		cpu.setZeroFlag((byte) 0x00);
		assertEquals(true, cpu.getZeroFlag());
		cpu.setZeroFlag((byte) 0x10);
		assertEquals(false, cpu.getZeroFlag());
		cpu.setZeroFlag((byte) 0xFF);
		assertEquals(false, cpu.getZeroFlag());

		assertEquals(false, cpu.getInterruptFlag());
		cpu.setInterruptFlag(true);
		assertEquals(true, cpu.getInterruptFlag());
		cpu.setInterruptFlag(false);
		assertEquals(false, cpu.getInterruptFlag());

		assertEquals(false, cpu.getDecimalFlag());
		cpu.setDecimalFlag(true);
		assertEquals(true, cpu.getDecimalFlag());
		cpu.setDecimalFlag(false);
		assertEquals(false, cpu.getDecimalFlag());
		
		assertEquals(false, cpu.getBreakFlag());
		cpu.setBreakFlag(true);
		assertEquals(true, cpu.getBreakFlag());
		cpu.setBreakFlag(false);
		assertEquals(false, cpu.getBreakFlag());

		assertEquals(false, cpu.getOverflowFlag());
		cpu.setOverflowFlag(true);
		assertEquals(true, cpu.getOverflowFlag());
		cpu.setOverflowFlag(false);
		assertEquals(false, cpu.getOverflowFlag());

		assertEquals(false, cpu.getNegativeFlag());
		cpu.setNegativeFlag(true);
		assertEquals(true, cpu.getNegativeFlag());
		cpu.setNegativeFlag(false);
		assertEquals(false, cpu.getNegativeFlag());
		
		cpu.setNegativeFlag((byte) 0xFF);
		assertEquals(true, cpu.getNegativeFlag());
		cpu.setNegativeFlag((byte) 0x00);
		assertEquals(false, cpu.getNegativeFlag());
	}

	@Test
	public void testCPUStack() {
		RicohCPU cpu = new RicohCPU(null, null, null);
		
		cpu.pushStack((byte) 0x01);
		cpu.pushStack((byte) 0xFF);
		cpu.pushStack((byte) 0xAB);
		
		assertEquals((byte) 0xAB, cpu.pullStack());
		
		cpu.pushStack((byte) 0x11);
		
		assertEquals((byte) 0x11, cpu.pullStack());
		assertEquals((byte) 0xFF, cpu.pullStack());
		assertEquals((byte) 0x01, cpu.pullStack());
	}
}
