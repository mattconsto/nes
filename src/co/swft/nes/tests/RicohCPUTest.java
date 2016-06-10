package co.swft.nes.tests;

import static org.junit.Assert.*;

import org.junit.Test;

import co.swft.nes.java.RicohCPU;

public class RicohCPUTest {
	@Test
	public void testAllCPUFlags() {
		RicohCPU cpu = new RicohCPU(null, null, null, null);
		
		assertFalse(cpu.state.getCarryFlag());
		cpu.state.setCarryFlag(true);
		assertTrue(cpu.state.getCarryFlag());
		cpu.state.setCarryFlag(false);
		assertFalse(cpu.state.getCarryFlag());

		assertTrue(cpu.state.getZeroFlag()); // Different as accumulator starts on 0.
		cpu.state.setZeroFlag(true);
		assertTrue(cpu.state.getZeroFlag());
		cpu.state.setZeroFlag(false);
		assertFalse(cpu.state.getZeroFlag());
		
		cpu.state.setZeroFlag((byte) 0x00);
		assertTrue(cpu.state.getZeroFlag());
		cpu.state.setZeroFlag((byte) 0x10);
		assertFalse(cpu.state.getZeroFlag());
		cpu.state.setZeroFlag((byte) 0xFF);
		assertFalse(cpu.state.getZeroFlag());

		assertFalse(cpu.state.getInterruptFlag());
		cpu.state.setInterruptFlag(true);
		assertTrue(cpu.state.getInterruptFlag());
		cpu.state.setInterruptFlag(false);
		assertFalse(cpu.state.getInterruptFlag());

		assertFalse(cpu.state.getDecimalFlag());
		cpu.state.setDecimalFlag(true);
		assertTrue(cpu.state.getDecimalFlag());
		cpu.state.setDecimalFlag(false);
		assertFalse(cpu.state.getDecimalFlag());
		
		assertFalse(cpu.state.getBreakFlag());
		cpu.state.setBreakFlag(true);
		assertTrue(cpu.state.getBreakFlag());
		cpu.state.setBreakFlag(false);
		assertFalse(cpu.state.getBreakFlag());

		assertFalse(cpu.state.getOverflowFlag());
		cpu.state.setOverflowFlag(true);
		assertTrue(cpu.state.getOverflowFlag());
		cpu.state.setOverflowFlag(false);
		assertFalse(cpu.state.getOverflowFlag());

		assertFalse(cpu.state.getNegativeFlag());
		cpu.state.setNegativeFlag(true);
		assertTrue(cpu.state.getNegativeFlag());
		cpu.state.setNegativeFlag(false);
		assertFalse(cpu.state.getNegativeFlag());
		
		cpu.state.setNegativeFlag((byte) 0xFF);
		assertTrue(cpu.state.getNegativeFlag());
		cpu.state.setNegativeFlag((byte) 0x00);
		assertFalse(cpu.state.getNegativeFlag());
	}

	@Test
	public void testCPUStack() {
		RicohCPU cpu = new RicohCPU(null, null, null, null);
		
		cpu.state.pushStack((byte) 0x01);
		cpu.state.pushStack((byte) 0xFF);
		cpu.state.pushStack((byte) 0xAB);
		
		assertEquals((byte) 0xAB, cpu.state.pullStack());
		
		cpu.state.pushStack((byte) 0x11);
		
		assertEquals((byte) 0x11, cpu.state.pullStack());
		assertEquals((byte) 0xFF, cpu.state.pullStack());
		assertEquals((byte) 0x01, cpu.state.pullStack());
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
		RicohCPU cpu = new RicohCPU(null, null, null, null);
		
		// TODO: Write test
	}
}
