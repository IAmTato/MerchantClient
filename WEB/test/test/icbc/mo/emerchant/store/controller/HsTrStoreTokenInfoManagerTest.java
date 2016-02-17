package test.icbc.mo.emerchant.store.controller;

import static org.junit.Assert.*;

import org.junit.Test;

import com.icbc.mo.emerchant.store.controller.StoreTokenManager;

public class HsTrStoreTokenInfoManagerTest {

	@Test
	public void testNewTokenId简单测试tokenid生成() {
		String id1 = StoreTokenManager.newTokenId();
		String id2 = StoreTokenManager.newTokenId();
		assertNotNull(id1);
		assertNotNull(id2);
		assertNotSame(id1, id2);
	}

}
