package com.icbc.mo.emerchant.sys;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the HS_TP_BASE_PARAM database table.
 * 
 */
@Entity
@Table(name="HS_TP_BASE_PARAM")
public class HsTpBaseParam implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="PARAM_ID")
	private String paramId;

    @Temporal( TemporalType.DATE)
	@Column(name="CREATE_DATE")
	private Date createDate;

	@Column(name="CREATE_ID")
	private String createId;

	@Column(name="PARAM_NAME_CN")
	private String paramNameCn;

	@Column(name="PARAM_NAME_EN")
	private String paramNameEn;

	@Column(name="PARAM_STATUS")
	private String paramStatus;

	@Column(name="PARAM_VALUE")
	private String paramValue;

	private String remark;

    public HsTpBaseParam() {
    }

	public String getParamId() {
		return this.paramId;
	}

	public void setParamId(String paramId) {
		this.paramId = paramId;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateId() {
		return this.createId;
	}

	public void setCreateId(String createId) {
		this.createId = createId;
	}

	public String getParamNameCn() {
		return this.paramNameCn;
	}

	public void setParamNameCn(String paramNameCn) {
		this.paramNameCn = paramNameCn;
	}

	public String getParamNameEn() {
		return this.paramNameEn;
	}

	public void setParamNameEn(String paramNameEn) {
		this.paramNameEn = paramNameEn;
	}

	public String getParamStatus() {
		return this.paramStatus;
	}

	public void setParamStatus(String paramStatus) {
		this.paramStatus = paramStatus;
	}

	public String getParamValue() {
		return this.paramValue;
	}

	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}