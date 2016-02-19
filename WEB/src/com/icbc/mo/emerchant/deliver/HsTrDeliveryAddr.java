package com.icbc.mo.emerchant.deliver;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the HS_TR_DELIVERY_ADDR database table.
 * 
 */
@Entity
@Table(name="HS_TR_DELIVERY_ADDR")
public class HsTrDeliveryAddr implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String address;

    @Temporal( TemporalType.DATE)
	@Column(name="CREATE_DATE")
	private Date createDate;

	@Column(name="CUST_ID")
	private String custId;

	@Column(name="DETAIL_ADDR")
	private String detailAddr;

	@Column(name="IS_DEFAULT")
	private String isDefault;

	private String lati;

	@Column(name="LINK_MAN")
	private String linkMan;

	@Column(name="LINK_PHONE")
	private String linkPhone;

	private String longs;

	@Column(name="QUERY_LEY")
	private String queryLey;

	private String sex;

    public HsTrDeliveryAddr() {
    }

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCustId() {
		return this.custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getDetailAddr() {
		return this.detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getIsDefault() {
		return this.isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	public String getLati() {
		return this.lati;
	}

	public void setLati(String lati) {
		this.lati = lati;
	}

	public String getLinkMan() {
		return this.linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	public String getLinkPhone() {
		return this.linkPhone;
	}

	public void setLinkPhone(String linkPhone) {
		this.linkPhone = linkPhone;
	}

	public String getLongs() {
		return this.longs;
	}

	public void setLongs(String longs) {
		this.longs = longs;
	}

	public String getQueryLey() {
		return this.queryLey;
	}

	public void setQueryLey(String queryLey) {
		this.queryLey = queryLey;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

}