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
 * The persistent class for the HS_TP_DICT database table.
 * 
 */
@Entity
@Table(name="HS_TP_DICT")
public class HsTpDict implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

    @Temporal( TemporalType.DATE)
	@Column(name="CREATE_DATE")
	private Date createDate;

	@Column(name="CREATE_ID")
	private String createId;

	@Column(name="DICT_CODE")
	private String dictCode;

	@Column(name="DICT_COLUMN")
	private String dictColumn;

	@Column(name="DICT_ORDER")
	private String dictOrder;

	@Column(name="DICT_STATUS")
	private String dictStatus;

	@Column(name="DICT_TABLE")
	private String dictTable;

	@Column(name="DICT_TYPE")
	private String dictType;

	@Column(name="DICT_VALUE")
	private String dictValue;

	@Column(name="P_ID")
	private String pId;

	private String remarks;

    @Temporal( TemporalType.DATE)
	@Column(name="UPDATE_DATE")
	private Date updateDate;

	@Column(name="UPDATE_ID")
	private String updateId;

	@Column(name="VALUE_CN")
	private String valueCn;

	@Column(name="VALUE_EN")
	private String valueEn;

    public HsTpDict() {
    }

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getDictCode() {
		return this.dictCode;
	}

	public void setDictCode(String dictCode) {
		this.dictCode = dictCode;
	}

	public String getDictColumn() {
		return this.dictColumn;
	}

	public void setDictColumn(String dictColumn) {
		this.dictColumn = dictColumn;
	}

	public String getDictOrder() {
		return this.dictOrder;
	}

	public void setDictOrder(String dictOrder) {
		this.dictOrder = dictOrder;
	}

	public String getDictStatus() {
		return this.dictStatus;
	}

	public void setDictStatus(String dictStatus) {
		this.dictStatus = dictStatus;
	}

	public String getDictTable() {
		return this.dictTable;
	}

	public void setDictTable(String dictTable) {
		this.dictTable = dictTable;
	}

	public String getDictType() {
		return this.dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	public String getDictValue() {
		return this.dictValue;
	}

	public void setDictValue(String dictValue) {
		this.dictValue = dictValue;
	}

	public String getPId() {
		return this.pId;
	}

	public void setPId(String pId) {
		this.pId = pId;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateId() {
		return this.updateId;
	}

	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}

	public String getValueCn() {
		return this.valueCn;
	}

	public void setValueCn(String valueCn) {
		this.valueCn = valueCn;
	}

	public String getValueEn() {
		return this.valueEn;
	}

	public void setValueEn(String valueEn) {
		this.valueEn = valueEn;
	}

}