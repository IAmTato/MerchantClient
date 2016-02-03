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
 * The persistent class for the HS_TR_GOODS_ATTACH_REL database table.
 * 
 */
@Entity
@Table(name="HS_TR_GOODS_ATTACH_REL")
public class HsTrGoodsAttachRel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Column(name="CLEARING_CURRENCY")
	private String clearingCurrency;

    @Temporal( TemporalType.DATE)
	@Column(name="CREATE_DATE")
	private Date createDate;

	@Column(name="CREATE_ID")
	private String createId;

	@Column(name="GOODS_ID")
	private String goodsId;

	@Column(name="GOODS_ORDER")
	private String goodsOrder;

	private BigDecimal price;

    @Temporal( TemporalType.DATE)
	@Column(name="RACK_DATE")
	private Date rackDate;

	@Column(name="RACK_STATUS")
	private String rackStatus;

	private BigDecimal salenum;

	private String status;

	private BigDecimal stock;

	@Column(name="STORE_ID")
	private String storeId;

    @Temporal( TemporalType.DATE)
	@Column(name="UPDATE_DATE")
	private Date updateDate;

	@Column(name="UPDATE_ID")
	private String updateId;

    public HsTrGoodsAttachRel() {
    }

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsOrder() {
		return this.goodsOrder;
	}

	public void setGoodsOrder(String goodsOrder) {
		this.goodsOrder = goodsOrder;
	}

	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Date getRackDate() {
		return this.rackDate;
	}

	public void setRackDate(Date rackDate) {
		this.rackDate = rackDate;
	}

	public String getRackStatus() {
		return this.rackStatus;
	}

	public void setRackStatus(String rackStatus) {
		this.rackStatus = rackStatus;
	}

	public BigDecimal getSalenum() {
		return this.salenum;
	}

	public void setSalenum(BigDecimal salenum) {
		this.salenum = salenum;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public BigDecimal getStock() {
		return this.stock;
	}

	public void setStock(BigDecimal stock) {
		this.stock = stock;
	}

	public String getStoreId() {
		return this.storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
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