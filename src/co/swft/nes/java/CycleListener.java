package co.swft.nes.java;

import java.util.EventListener;

public interface CycleListener extends EventListener {
	public void cycleStarted(CycleEvent e);
}
