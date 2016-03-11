package com.icbc.mo.emerchant.goods;

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
 * The persistent class for the HS_TR_GOODS database table.
 * 
 */
@Entity
@Table(name="HS_TR_GOODS")
public class HsTrGood implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="GOODS_ID")
	private String goodsId;

	@Column(name="APPRO_STATUS")
	private String approStatus;

	@Column(name="CLEARING_CURRENCY")
	private String clearingCurrency;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="CREATE_DATE")
	private Date createDate;

	@Column(name="CREATE_ID")
	private String createId;

	@Column(name="GOODS_CLASSIFY")
	private String goodsClassify;

	@Column(name="GOODS_INTRODUCE_CN")
	private String goodsIntroduceCn;

	@Column(name="GOODS_INTRODUCE_EN")
	private String goodsIntroduceEn;

	@Column(name="GOODS_NAME_CN")
	private String goodsNameCn;

	@Column(name="GOODS_NAME_EN")
	private String goodsNameEn;

	@Column(name="GOODS_SHAPE")
	private String goodsShape;

	@Column(name="GOODS_TYPE")
	private String goodsType;

	@Column(name="IMG_ID")
	private String imgId;

	@Column(name="OPER_FLAG")
	private String operFlag;

	private BigDecimal price;

	@Column(name="SOURCE_CODE")
	private String sourceCode;

	@Column(name="SOURCE_TYPE")
	private String sourceType;

	private String status;

	@Column(name="UNIT_ID")
	private String unitId;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="UPDATE_DATE")
	private Date updateDate;

	@Column(name="UPDATE_ID")
	private String updateId;

    public HsTrGood() {
    }

	public String getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getApproStatus() {
		return this.approStatus;
	}

	public void setApproStatus(String approStatus) {
		this.approStatus = approStatus;
	}

	public String getClearingCurrency() {
		return this.clearingCurrency;
	}

	public void setClearingCurrency(String clearingCurrency) {
		this.clearingCurrency = clearingCurrency;
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

	public String getGoodsClassify() {
		return this.goodsClassify;
	}

	public void setGoodsClassify(String goodsClassify) {
		this.goodsClassify = goodsClassify;
	}

	public String getGoodsIntroduceCn() {
		return this.goodsIntroduceCn;
	}

	public void setGoodsIntroduceCn(String goodsIntroduceCn) {
		this.goodsIntroduceCn = goodsIntroduceCn;
	}

	public String getGoodsIntroduceEn() {
		return this.goodsIntroduceEn;
	}

	public void setGoodsIntroduceEn(String goodsIntroduceEn) {
		this.goodsIntroduceEn = goodsIntroduceEn;
	}

	public String getGoodsNameCn() {
		return this.goodsNameCn;
	}

	public void setGoodsNameCn(String goodsNameCn) {
		this.goodsNameCn = goodsNameCn;
	}

	public String getGoodsNameEn() {
		return this.goodsNameEn;
	}

	public void setGoodsNameEn(String goodsNameEn) {
		this.goodsNameEn = goodsNameEn;
	}

	public String getGoodsShape() {
		return this.goodsShape;
	}

	public void setGoodsShape(String goodsShape) {
		this.goodsShape = goodsShape;
	}

	public String getGoodsType() {
		return this.goodsType;
	}

	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}

	public String getImgId() {
		return this.imgId;
	}

	public void setImgId(String imgId) {
		this.imgId = imgId;
	}

	public String getOperFlag() {
		return this.operFlag;
	}

	public void setOperFlag(String operFlag) {
		this.operFlag = operFlag;
	}

	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getSourceCode() {
		return this.sourceCode;
	}

	public void setSourceCode(String sourceCode) {
		this.sourceCode = sourceCode;
	}

	public String getSourceType() {
		return this.sourceType;
	}

	public void setSourceType(String sourceType) {
		this.sourceType = sourceType;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUnitId() {
		return this.unitId;
	}

	public void setUnitId(String unitId) {
		this.unitId = unitId;
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

}