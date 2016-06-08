package co.swft.nes.abstracts;

public abstract class Controlable extends Thread {
	protected boolean pauseFlag = false;
	protected boolean stopFlag = false;

	protected synchronized void checkMonitor() {
		while (pauseFlag) {
			try {
				wait();
			} catch (InterruptedException ignored) {}
		}
	}

	public synchronized void pauseMonitor() {
		pauseFlag = true;
	}

	public synchronized void resumeMonitor() {
		pauseFlag = false;
		notify();
	}

	public synchronized void toggleMonitor() {
		pauseFlag = !pauseFlag;
		notify();
	}
	
	public synchronized void stopMonitor() {
		stopFlag = true;
		notify();
	}
}
