package org.directwebremoting.emerchant;

import org.directwebremoting.ConversionException;

import com.icbc.mo.emerchant.store.StoreToken;

public class TokenTimeOutException extends ConversionException {

	public TokenTimeOutException() {
		super(StoreToken.class,"Login timeout!");
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 6400846364256438261L;

}
