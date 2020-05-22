package tool.model;

public class size {

	int Keyword,Identifier,Operator,Numerical,StringCount,lineNumber;
	String line;
	/**
	 * @return the keyword
	 */
	public int getKeyword() {
		return Keyword;
	}
	/**
	 * @param keyword the keyword to set
	 */
	public void setKeyword(int keyword) {
		Keyword = keyword;
	}
	/**
	 * @return the identifier
	 */
	public int getIdentifier() {
		return Identifier;
	}
	/**
	 * @param identifier the identifier to set
	 */
	public void setIdentifier(int identifier) {
		Identifier = identifier;
	}
	/**
	 * @return the operator
	 */
	public int getOperator() {
		return Operator;
	}
	/**
	 * @param operator the operator to set
	 */
	public void setOperator(int operator) {
		Operator = operator;
	}
	/**
	 * @return the numerical
	 */
	public int getNumerical() {
		return Numerical;
	}
	/**
	 * @param numerical the numerical to set
	 */
	public void setNumerical(int numerical) {
		Numerical = numerical;
	}
	/**
	 * @return the stringCount
	 */
	public int getStringCount() {
		return StringCount;
	}
	/**
	 * @param stringCount the stringCount to set
	 */
	public void setStringCount(int stringCount) {
		StringCount = stringCount;
	}
	/**
	 * @return the lineNumber
	 */
	public int getLineNumber() {
		return lineNumber;
	}
	/**
	 * @param lineNumber the lineNumber to set
	 */
	public void setLineNumber(int lineNumber) {
		this.lineNumber = lineNumber;
	}
	/**
	 * @return the line
	 */
	public String getLine() {
		return line;
	}
	/**
	 * @param line the line to set
	 */
	public void setLine(String line) {
		this.line = line;
	}
	
}
