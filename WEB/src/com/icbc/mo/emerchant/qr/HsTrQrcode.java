package com.icbc.mo.emerchant.qr;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

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

	@Temporal( TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	@Column(name="CREATER_DATA")
	private String createrData;

	@Column(name="CUST_ID")
	private String custId;

	@Column(name="QR_FUNC")
	private int qrFunc;

	@Temporal( TemporalType.TIMESTAMP)
	@Column(name="READ_TIME")
	private Date readTime;

	@Column(name="READER_DATA")
	private String readerData;

	private int status;

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

	public int getQrFunc() {
		return this.qrFunc;
	}

	public void setQrFunc(int qrFunc) {
		this.qrFunc = qrFunc;
	}

	public Date getReadTime() {
		return this.readTime;
	}

	public void setReadTime(Date date) {
		this.readTime = date;
	}

	public String getReaderData() {
		return this.readerData;
	}

	public void setReaderData(String readerData) {
		this.readerData = readerData;
	}

	public int getStatus() {
		//1:二维码生成、2.二维码已读取、3.订单已生成
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getStoreId() {
		return this.storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

}