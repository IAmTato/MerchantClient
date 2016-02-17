package org.directwebremoting.emerchant;

import org.directwebremoting.ConversionException;

import com.icbc.mo.emerchant.store.StoreToken;

public class TokenIdNullException extends ConversionException {

	public TokenIdNullException() {
		super(StoreToken.class, "token id is null please make sure login first");
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 2586020882376707846L;

}
