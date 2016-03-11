package com.icbc.mo.emerchant.qr;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the HS_TH_QRCODE database table.
 * 
 */
@Entity
@Table(name="HS_TH_QRCODE")
public class HsThQrcode implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="QR_CODE_ID")
	private String qrCodeId;

	@Temporal( TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	@Column(name="CREATER_DATA")
	private String createrData;

	@Column(name="CUST_ID")
	private String custId;

	@Column(name="ORDER_ID")
	private String orderId;

	@Column(name="QR_FUNC")
	private BigDecimal qrFunc;

	@Temporal( TemporalType.TIMESTAMP)
	@Column(name="READ_TIME")
	private Date readTime;

	@Column(name="READER_DATA")
	private String readerData;

	@Column(name="STORE_ID")
	private String storeId;

    public HsThQrcode() {
    }

	public String getQrCodeId() {
		return this.qrCodeId;
	}

	public void setQrCodeId(String qrCodeId) {
		this.qrCodeId = qrCodeId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreaterData() {
		return this.createrData;
	}

	public void setCreaterData(String createrData) {
		this.createrData = createrData;
	}

	public String getCustId() {
		return this.custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public BigDecimal getQrFunc() {
		return this.qrFunc;
	}

	public void setQrFunc(BigDecimal qrFunc) {
		this.qrFunc = qrFunc;
	}

	public Date getReadTime() {
		return this.readTime;
	}

	public void setReadTime(Date readTime) {
		this.readTime = readTime;
	}

	public String getReaderData() {
		return this.readerData;
	}

	public void setReaderData(String readerData) {
		this.readerData = readerData;
	}

	public String getStoreId() {
		return this.storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

}