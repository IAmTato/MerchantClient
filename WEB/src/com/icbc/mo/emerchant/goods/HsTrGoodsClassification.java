package com.icbc.mo.emerchant.goods;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the HS_TR_GOODS_CLASSIFICATION database table.
 * 
 */
@Entity
@Table(name="HS_TR_GOODS_CLASSIFICATION")
public class HsTrGoodsClassification implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Column(name="CLASS_CODE")
	private String classCode;

	@Column(name="CLASS_NAME_CN")
	private String classNameCn;

	@Column(name="CLASS_NAME_EN")
	private String classNameEn;

	@Column(name="CLASS_SORT")
	private String classSort;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="CREATE_DATE")
	private Date createDate;

	@Column(name="CREATE_ID")
	private String createId;

	@Column(name="SOURCE_CODE")
	private String sourceCode;

	private String status;

    public HsTrGoodsClassification() {
    }

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getClassCode() {
		return this.classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getClassNameCn() {
		return this.classNameCn;
	}

	public void setClassNameCn(String classNameCn) {
		this.classNameCn = classNameCn;
	}

	public String getClassNameEn() {
		return this.classNameEn;
	}

	public void setClassNameEn(String classNameEn) {
		this.classNameEn = classNameEn;
	}

	public String getClassSort() {
		return this.classSort;
	}

	public void setClassSort(String classSort) {
		this.classSort = classSort;
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

	public String getSourceCode() {
		return this.sourceCode;
	}

	public void setSourceCode(String sourceCode) {
		this.sourceCode = sourceCode;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}