package com.icbc.mo.emerchant.order;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import javax.persistence.SequenceGenerator;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;

/**
 * The persistent class for the HS_TR_MASTER_ORDER database table.
 * 
 */
@Entity
@Table(name="HS_TR_MASTER_ORDER")
public class HsTrMasterOrder implements Serializable {
	private static final long serialVersionUID = 1L;

	//	@SequenceGenerator(name = "HS_ORDER_NO_SEQ", allocationSize = 1, sequenceName = "HS_ORDER_NO_SEQ")
	//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "HS_ORDER_NO_SEQ")
	
	@Id
	@Column(name="ORDER_ID")

	private String orderId;

	@Column(name="ADD_FEE_AMOUNT")
	private Long addFeeAmount;

	@Column(name="ADD_FEE_RATE")
	private Double addFeeRate;

	private String addr;

	@Column(name="CARD_ID")
	private String cardId;

	@Column(name="COST_AMOUNT")
	private Double costAmount;

	@Column(name="COURIER_AMOUNT")
	private Double courierAmount;

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
	private Double discountAmount;

	@Column(name="EXT_AMOUNT")
	private Double extAmount;

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
	private Double realAmount;

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
 
	@OneToMany(targetEntity=ViewSubOrder.class,cascade=CascadeType.ALL,fetch=FetchType.LAZY)
    @JoinColumn(name="ORDER_ID",referencedColumnName="ORDER_ID",table="VIEW_SUB_ORDER",unique=false,columnDefinition="orderId",insertable=false,updatable=false)
	private List<ViewSubOrder> viewsuborderList;
  
    public HsTrMasterOrder() {
    }

	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Long getAddFeeAmount() {
		return this.addFeeAmount;
	}

	public void setAddFeeAmount(Long addFeeAmount) {
		this.addFeeAmount = addFeeAmount;
	}

	public Double getAddFeeRate() {
		return this.addFeeRate;
	}

	public void setAddFeeRate(Double addFeeRate) {
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

	public Double getCostAmount() {
		return this.costAmount;
	}

	public void setCostAmount(Double costAmount) {
		this.costAmount = costAmount;
	}

	public Double getCourierAmount() {
		return this.courierAmount;
	}

	public void setCourierAmount(Double courierAmount) {
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

	public Double getDiscountAmount() {
		return this.discountAmount;
	}

	public void setDiscountAmount(Double discountAmount) {
		this.discountAmount = discountAmount;
	}

	public Double getExtAmount() {
		return this.extAmount;
	}

	public void setExtAmount(Double extAmount) {
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
	
	public String getOrderStatusDisplay() {
		if(orderStatus == null) {
			return null;
		}
		if("01".equals(orderStatus)) {
			return "待付款";
		}else if("11".equals(orderStatus)) {
			return "待发货";
		}else if("21".equals(orderStatus)) {
			return "已发货";
		}else if("31".equals(orderStatus)) {
			return "完成";
		}else if("09".equals(orderStatus)) {
			return "客户取消";
		}else if("19".equals(orderStatus)) {
			return "商户关闭";
		}else if("29".equals(orderStatus)) {
			return "超时关闭";
		}  
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

	public Double getRealAmount() {
		return this.realAmount;
	}

	public void setRealAmount(Double realAmount) {
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

	public List<ViewSubOrder> getViewsuborderList() {
		return this.viewsuborderList;
	}

	public void setViewsuborderList(List<ViewSubOrder> viewsuborderList) {
		this.viewsuborderList = viewsuborderList;
	} 

}