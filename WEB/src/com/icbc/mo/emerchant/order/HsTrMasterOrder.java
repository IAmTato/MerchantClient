package com.icbc.mo.emerchant.order;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the HS_TR_MASTER_ORDER database table.
 * 
 */
@Entity
@Table(name="HS_TR_MASTER_ORDER")
public class HsTrMasterOrder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ORDER_ID")
	private String orderId;

	@Column(name="ADD_FEE_AMOUNT")
	private BigDecimal addFeeAmount;

	@Column(name="ADD_FEE_RATE")
	private BigDecimal addFeeRate;

	private String addr;

	@Column(name="CARD_ID")
	private String cardId;

	@Column(name="COST_AMOUNT")
	private BigDecimal costAmount;

	@Column(name="COURIER_AMOUNT")
	private BigDecimal courierAmount;

	@Column(name="COURIER_ID")
	private String courierId;

	@Column(name="COURIER_TYPE")
	private String courierType;

    @Temporal( TemporalType.DATE)
	@Column(name="CREATE_DATE")
	private Date createDate;

	private String currency;

	@Column(name="CUST_ID")
	private String custId;

	@Column(name="DISCOUNT_AMOUNT")
	private BigDecimal discountAmount;

	@Column(name="EXT_AMOUNT")
	private BigDecimal extAmount;

	@Column(name="INVOICE_TITLE")
	private String invoiceTitle;

	@Column(name="ORDER_STATUS")
	private String orderStatus;

	@Column(name="ORDER_TYPE")
	private String orderType;

	@Column(name="PAY_ID")
	private String payId;

	@Column(name="PAY_TYPE")
	private String payType;

	@Column(name="REAL_AMOUNT")
	private BigDecimal realAmount;

	private String remark;

	@Column(name="SEND_TIME")
	private String sendTime;

	@Column(name="STORE_ID")
	private String storeId;

    @Temporal( TemporalType.DATE)
	@Column(name="UPDATE_DATE")
	private Date updateDate;

	@Column(name="UPDATE_ID")
	private String updateId;

    public HsTrMasterOrder() {
    }

	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public BigDecimal getAddFeeAmount() {
		return this.addFeeAmount;
	}

	public void setAddFeeAmount(BigDecimal addFeeAmount) {
		this.addFeeAmount = addFeeAmount;
	}

	public BigDecimal getAddFeeRate() {
		return this.addFeeRate;
	}

	public void setAddFeeRate(BigDecimal addFeeRate) {
		this.addFeeRate = addFeeRate;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCardId() {
		return this.cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public BigDecimal getCostAmount() {
		return this.costAmount;
	}

	public void setCostAmount(BigDecimal costAmount) {
		this.costAmount = costAmount;
	}

	public BigDecimal getCourierAmount() {
		return this.courierAmount;
	}

	public void setCourierAmount(BigDecimal courierAmount) {
		this.courierAmount = courierAmount;
	}

	public String getCourierId() {
		return this.courierId;
	}

	public void setCourierId(String courierId) {
		this.courierId = courierId;
	}

	public String getCourierType() {
		return this.courierType;
	}

	public void setCourierType(String courierType) {
		this.courierType = courierType;
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

	public String getCustId() {
		return this.custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public BigDecimal getDiscountAmount() {
		return this.discountAmount;
	}

	public void setDiscountAmount(BigDecimal discountAmount) {
		this.discountAmount = discountAmount;
	}

	public BigDecimal getExtAmount() {
		return this.extAmount;
	}

	public void setExtAmount(BigDecimal extAmount) {
		this.extAmount = extAmount;
	}

	public String getInvoiceTitle() {
		return this.invoiceTitle;
	}

	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}

	public String getOrderStatus() {
		return this.orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderType() {
		return this.orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getPayId() {
		return this.payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getPayType() {
		return this.payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public BigDecimal getRealAmount() {
		return this.realAmount;
	}

	public void setRealAmount(BigDecimal realAmount) {
		this.realAmount = realAmount;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
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