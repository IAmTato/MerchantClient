package org.directwebremoting.emerchant;

import org.directwebremoting.ConversionException;
import org.directwebremoting.convert.BeanConverter;
import org.directwebremoting.extend.InboundVariable; 

import com.icbc.mo.emerchant.store.controller.HsTrStoreTokenInfoManager;

public class StoreTokenConverter extends BeanConverter {

	@Override
	public Object convertInbound(Class<?> arg0, InboundVariable arg1) throws ConversionException {
		return HsTrStoreTokenInfoManager.getTokenInRequest();
	}
}
