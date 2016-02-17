package com.icbc.mo.emerchant.qr;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.math.BigDecimal;


/**
 * The persistent class for the HS_TR_QRCODE database table.
 * 
 */
@Entity
@Table(name="HS_TR_QRCODE")
public class HsTrQrcode implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="QR_CODE_ID")
	private String qrCodeId;

	@Column(name="CREATE_TIME")
	private Timestamp createTime;

	@Column(name="CREATER_DATA")
	private String createrData;

	@Column(name="CUST_ID")
	private String custId;

	@Column(name="QR_FUNC")
	private BigDecimal qrFunc;

	@Column(name="READ_TIME")
	private Timestamp readTime;

	@Column(name="READER_DATA")
	private String readerData;

	private BigDecimal status;

	@Column(name="STORE_ID")
	private String storeId;

    public HsTrQrcode() {
    }

	public String getQrCodeId() {
		return this.qrCodeId;
	}

	public void setQrCodeId(String qrCodeId) {
		this.qrCodeId = qrCodeId;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
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

	public BigDecimal getQrFunc() {
		return this.qrFunc;
	}

	public void setQrFunc(BigDecimal qrFunc) {
		this.qrFunc = qrFunc;
	}

	public Timestamp getReadTime() {
		return this.readTime;
	}

	public void setReadTime(Timestamp readTime) {
		this.readTime = readTime;
	}

	public String getReaderData() {
		return this.readerData;
	}

	public void setReaderData(String readerData) {
		this.readerData = readerData;
	}

	public BigDecimal getStatus() {
		return this.status;
	}

	public void setStatus(BigDecimal status) {
		this.status = status;
	}

	public String getStoreId() {
		return this.storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

}