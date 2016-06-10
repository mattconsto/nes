package co.swft.nes.interfaces;

import java.util.EventListener;

import co.swft.nes.java.CycleEvent;

public interface CycleListener extends EventListener {
	public void cycleStarted(CycleEvent e);
}
