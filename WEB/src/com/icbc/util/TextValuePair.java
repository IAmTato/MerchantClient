package com.icbc.util;

import java.io.Serializable;
/**
 * 为ctp的combobox  autocomplete等准备
 * @author Administrator
 *
 */
public class TextValuePair implements Serializable {
	private static final long serialVersionUID = -7642758775595527593L;
	private String text;
	private String value;
	
	public TextValuePair(String text,String value) {
		this.text = text;
		this.value = value;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}
