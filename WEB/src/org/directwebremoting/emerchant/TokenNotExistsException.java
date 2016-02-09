package org.directwebremoting.emerchant;

import org.directwebremoting.ConversionException;

import com.icbc.mo.emerchant.store.HsTrStoreTokenInfo;

public class TokenNotExistsException extends ConversionException {

	public TokenNotExistsException() {
		super(HsTrStoreTokenInfo.class, "token not exists in db please make sure login first"); 
	} 
	private static final long serialVersionUID = -819942863202862558L;

}
