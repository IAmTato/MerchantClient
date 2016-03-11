package com.icbc.mo.emerchant.order;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the VIEW_SUB_ORDER database table.
 * 
 */
@Entity
@Table(name="VIEW_SUB_ORDER")
public class ViewSubOrder implements Serializable {
	private static final long serialVersionUID = 1L;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="CREATE_DATE")
	private Date createDate;

	private String currency;

	@Column(name="DISCOUNT_ID")
	private String discountId;

	@Column(name="GOODS_ID")
	private String goodsId;

	@Column(name="GOODS_INTRODUCE_CN")
	private String goodsIntroduceCn;

	@Column(name="GOODS_INTRODUCE_EN")
	private String goodsIntroduceEn;

	@Column(name="GOODS_NAME_CN")
	private String goodsNameCn;

	@Column(name="GOODS_NAME_EN")
	private String goodsNameEn;

	@Column(name="IMG_URL")
	private String imgUrl;

	private BigDecimal quantity;

	@Column(name="STORE_ID")
	private String storeId;
	 
	@Column(name="ORDER_ID")
	private String orderId;

	@Id
	@Column(name="SUB_ORDER_ID")
	private String subOrderId;

	@Column(name="SUB_PRO_ID")
	private String subProId;

	@Column(name="UNIT_PRICE")
	private BigDecimal unitPrice;

    public ViewSubOrder() {
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

	public String getImgUrl() {
		return this.imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
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

	public String getSubOrderId() {
		return this.subOrderId;
	}

	public void setSubOrderId(String subOrderId) {
		this.subOrderId = subOrderId;
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

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

}