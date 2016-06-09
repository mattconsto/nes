package com.stackoverflow.jewelsea;

import java.io.PrintWriter;

public class Logger {
	public final Log log;
	public final String context;
	public final boolean console;
	
	private PrintWriter out = new PrintWriter(System.out, true);
	private PrintWriter err = new PrintWriter(System.err, true);

	public Logger(Log log, String context, boolean console) {
		this.log     = log;
		this.context = context;
		this.console = console;
	}

	public void log(LogRecord record) {
		log.offer(record);
		if(console) {
			if(record.getLevel().ordinal() >= Level.WARN.ordinal()) {
				err.println(record);
			} else {
				out.println(record);
			}
		}
	}

	public void debug(String format, Object ... arguments) {
		debug(String.format(format, arguments));
	}

	public void debug(String msg) {
		log(new LogRecord(Level.DEBUG, context, msg));
	}

	public void info(String format, Object ... arguments) {
		info(String.format(format, arguments));
	}

	public void info(String msg) {
		log(new LogRecord(Level.INFO, context, msg));
	}

	public void warn(String format, Object ... arguments) {
		warn(String.format(format, arguments));
	}

	public void warn(String msg) {
		log(new LogRecord(Level.WARN, context, msg));
	}

	public void error(String format, Object ... arguments) {
		error(String.format(format, arguments));
	}

	public void error(String msg) {
		log(new LogRecord(Level.ERROR, context, msg));
	}
}