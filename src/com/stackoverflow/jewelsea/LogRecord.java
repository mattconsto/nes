package com.stackoverflow.jewelsea;

import java.util.Date;

public class LogRecord {
	private Date timestamp;
	private Level level;
	private String context;
	private String message;

	public LogRecord(Level level, String context, String message) {
		this.timestamp = new Date();
		this.level = level;
		this.context = context;
		this.message = message;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public Level getLevel() {
		return level;
	}

	public String getContext() {
		return context;
	}

	public String getMessage() {
		return message;
	}
	
	@Override
	public String toString() {
		return String.format("%tF %<tT\t%s\t%s\t%s", timestamp, level.toString(), context, message);
	}
}