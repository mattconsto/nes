package com.stackoverflow.jewelsea;

public class Logger {
	public final Log    log;
	public final String context;

	public Logger(Log log, String context) {
		this.log     = log;
		this.context = context;
	}

	public void log(LogRecord record) {
		log.offer(record);
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