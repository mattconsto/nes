package co.swft.util;
import java.util.ArrayList;
import java.util.HashMap;

public class TableBuilder {
	ArrayList<Object[]> rows     = new ArrayList<Object[]>();
	String[]            headings = null;
	
	/**
	 * Add a row to the table.
	 * @param row The row we want to add.
	 */
	public void addRow(Object... row) {
		rows.add(row);
	}
	
	/**
	 * Set the headings of the table.
	 * @param headings Sets the tables headings.
	 */
	public void setHeadings(String... headings) {
		this.headings = headings;
	}
	
	/**
	 * Remove the tables headings (if it has any).
	 */
	public void clearHeadings() {
		this.headings = null;
	}
	
	/**
	 * Clear the tables rows (if it has any).
	 */
	public void clearRows() {
		rows.clear();
	}
	
	/**
	 * Produce the table.
	 * @return The table.
	 */
	public String toString() {
		// Calculate the number of rows and their width.
		if(headings != null)
			rows.add(0, headings);
		
		HashMap<Integer, Integer> widths = new HashMap<Integer, Integer>();

		for(Object[] row : rows) {
			for(int i = 0; i < row.length; i++) {
				int cellLength = row[i].toString().length();
				if(i >= widths.size() || cellLength > widths.get(i)) 
					widths.put(i, cellLength);
			}
		}
		
		StringBuilder lineBuilder = new StringBuilder();
		for(int i = 0; i < widths.size(); i++) {
			for(int j = 0; j <= widths.get(i); j++) {
				lineBuilder.append('-');
			}
		}
		// Sneak the line in there
		if(headings != null)
			rows.add(1, new Object[] {lineBuilder});
		
		// Build up the table.
		StringBuilder stringBuilder = new StringBuilder(rows.size() * (widths.size() + 1));
		
		for(Object[] row : rows) {
			for(int i = 0; i < row.length; i++) {
				if(i == row.length - 1) {
					stringBuilder.append(String.format("%s", row[i]));
				} else {
					stringBuilder.append(String.format("%-" + (widths.get(i) + 1) + "s", row[i]));
				}
			}
			stringBuilder.append("\n");
		}
		
		return stringBuilder.toString();
	}
}