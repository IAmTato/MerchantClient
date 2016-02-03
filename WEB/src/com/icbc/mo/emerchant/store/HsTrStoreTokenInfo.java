package com.icbc.mo.emerchant.store;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * The persistent class for the HS_TR_STORE_TOKEN_INFO database table.
 * 
 */
@Entity
@Table(name="HS_TR_STORE_TOKEN_INFO")
public class HsTrStoreTokenInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String token;

	@Column(name="CREATE_TIME")
	private Timestamp createTime;

	private String phone;

	@Column(name="STORE_USER")
	private String storeUser;

    public HsTrStoreTokenInfo() {
    }

	public String getToken() {
		return this.token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStoreUser() {
		return this.storeUser;
	}

	public void setStoreUser(String storeUser) {
		this.storeUser = storeUser;
	}

}