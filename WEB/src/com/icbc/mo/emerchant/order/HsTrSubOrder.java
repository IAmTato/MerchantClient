package com.icbc.mo.emerchant.order;

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
 * The persistent class for the HS_TR_SUB_ORDER database table.
 * 
 */
@Entity
@Table(name="HS_TR_SUB_ORDER")
public class HsTrSubOrder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="SUB_ORDER_ID")
	private String subOrderId;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="CREATE_DATE")
	private Date createDate;

	private String currency;

	@Column(name="DISCOUNT_ID")
	private String discountId;

	@Column(name="GOODS_ID")
	private String goodsId;

	@Column(name="GOODS_NAME_CH")
	private String goodsNameCh;

	@Column(name="GOODS_NAME_EN")
	private String goodsNameEn;

	@Column(name="ORDER_ID")
	private String orderId;

	private BigDecimal quantity;

	@Column(name="STORE_ID")
	private String storeId;

	@Column(name="SUB_PRO_ID")
	private String subProId;

	@Column(name="UNIT_PRICE")
	private BigDecimal unitPrice;

    public HsTrSubOrder() {
    }

	public String getSubOrderId() {
		return this.subOrderId;
	}

	public void setSubOrderId(String subOrderId) {
		this.subOrderId = subOrderId;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCurrency() {
		return this.currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getDiscountId() {
		return this.discountId;
	}

	public void setDiscountId(String discountId) {
		this.discountId = discountId;
	}

	public String getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsNameCh() {
		return this.goodsNameCh;
	}

	public void setGoodsNameCh(String goodsNameCh) {
		this.goodsNameCh = goodsNameCh;
	}

	public String getGoodsNameEn() {
		return this.goodsNameEn;
	}

	public void setGoodsNameEn(String goodsNameEn) {
		this.goodsNameEn = goodsNameEn;
	}

	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public BigDecimal getQuantity() {
		return this.quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public String getStoreId() {
		return this.storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getSubProId() {
		return this.subProId;
	}

	public void setSubProId(String subProId) {
		this.subProId = subProId;
	}

	public BigDecimal getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

}