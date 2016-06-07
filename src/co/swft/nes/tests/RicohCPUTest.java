package co.swft.nes.tests;

import static org.junit.Assert.*;

import org.junit.Test;

import co.swft.nes.java.RicohCPU;

public class RicohCPUTest {
	@Test
	public void testAllCPUFlags() {
		RicohCPU cpu = new RicohCPU(null, null, null);
		
		assertFalse(cpu.getCarryFlag());
		cpu.setCarryFlag(true);
		assertTrue(cpu.getCarryFlag());
		cpu.setCarryFlag(false);
		assertFalse(cpu.getCarryFlag());

		assertTrue(cpu.getZeroFlag()); // Different as accumulator starts on 0.
		cpu.setZeroFlag(true);
		assertTrue(cpu.getZeroFlag());
		cpu.setZeroFlag(false);
		assertFalse(cpu.getZeroFlag());
		
		cpu.setZeroFlag((byte) 0x00);
		assertTrue(cpu.getZeroFlag());
		cpu.setZeroFlag((byte) 0x10);
		assertFalse(cpu.getZeroFlag());
		cpu.setZeroFlag((byte) 0xFF);
		assertFalse(cpu.getZeroFlag());

		assertFalse(cpu.getInterruptFlag());
		cpu.setInterruptFlag(true);
		assertTrue(cpu.getInterruptFlag());
		cpu.setInterruptFlag(false);
		assertFalse(cpu.getInterruptFlag());

		assertFalse(cpu.getDecimalFlag());
		cpu.setDecimalFlag(true);
		assertTrue(cpu.getDecimalFlag());
		cpu.setDecimalFlag(false);
		assertFalse(cpu.getDecimalFlag());
		
		assertFalse(cpu.getBreakFlag());
		cpu.setBreakFlag(true);
		assertTrue(cpu.getBreakFlag());
		cpu.setBreakFlag(false);
		assertFalse(cpu.getBreakFlag());

		assertFalse(cpu.getOverflowFlag());
		cpu.setOverflowFlag(true);
		assertTrue(cpu.getOverflowFlag());
		cpu.setOverflowFlag(false);
		assertFalse(cpu.getOverflowFlag());

		assertFalse(cpu.getNegativeFlag());
		cpu.setNegativeFlag(true);
		assertTrue(cpu.getNegativeFlag());
		cpu.setNegativeFlag(false);
		assertFalse(cpu.getNegativeFlag());
		
		cpu.setNegativeFlag((byte) 0xFF);
		assertTrue(cpu.getNegativeFlag());
		cpu.setNegativeFlag((byte) 0x00);
		assertFalse(cpu.getNegativeFlag());
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
	
	@Test
	public void testAddressingImmediate() {
		
	}
	
	@Test
	public void testAddressingZeroPage() {
		
	}
	
	@Test
	public void testAddressingZeroPageX() {
		
	}
	
	@Test
	public void testAddressingZeroPageY() {
		
	}
	
	@Test
	public void testAddressingAbsolute() {
		
	}
	
	@Test
	public void testAddressingAbsoluteX() {
		
	}
	
	@Test
	public void testAddressingAbsoluteY() {
		
	}
	
	@Test
	public void testAddressingIndexedIndirect() {
		
	}
	
	@Test
	public void testAddressingIndirectIndexed() {
		
	}
	
	@SuppressWarnings("unused")
    @Test
	public void testInstructionSet() {
		RicohCPU cpu = new RicohCPU(null, null, null);
		
		// TODO: Write test
	}
}
