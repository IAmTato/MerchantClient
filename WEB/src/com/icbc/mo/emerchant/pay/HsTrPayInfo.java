package com.icbc.mo.emerchant.pay;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * The persistent class for the HS_TR_PAY_INFO database table.
 * 
 */
@Entity
@Table(name="HS_TR_PAY_INFO")
public class HsTrPayInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="PAY_ID")
	private String payId;

	@Column(name="CARD_NO")
	private String cardNo;

	@Column(name="CLEARING_ACCOUNT")
	private String clearingAccount;

	private String currency;

	@Column(name="CUST_ID")
	private String custId;

	@Column(name="ORDER_ID")
	private String orderId;

	@Column(name="PAY_AMOUNT")
	private BigDecimal payAmount;

	@Column(name="REQ_PARAM")
	private String reqParam;

	@Column(name="RESULT_ID")
	private String resultId;

	@Column(name="RET_URL")
	private String retUrl;

    public HsTrPayInfo() {
    }

	public String getPayId() {
		return this.payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getCardNo() {
		return this.cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getClearingAccount() {
		return this.clearingAccount;
	}

	public void setClearingAccount(String clearingAccount) {
		this.clearingAccount = clearingAccount;
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

	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public BigDecimal getPayAmount() {
		return this.payAmount;
	}

	public void setPayAmount(BigDecimal payAmount) {
		this.payAmount = payAmount;
	}

	public String getReqParam() {
		return this.reqParam;
	}

	public void setReqParam(String reqParam) {
		this.reqParam = reqParam;
	}

	public String getResultId() {
		return this.resultId;
	}

	public void setResultId(String resultId) {
		this.resultId = resultId;
	}

	public String getRetUrl() {
		return this.retUrl;
	}

	public void setRetUrl(String retUrl) {
		this.retUrl = retUrl;
	}

}