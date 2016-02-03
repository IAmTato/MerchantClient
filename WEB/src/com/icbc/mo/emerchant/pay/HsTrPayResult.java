package com.icbc.mo.emerchant.pay;

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
 * The persistent class for the HS_TR_PAY_RESULT database table.
 * 
 */
@Entity
@Table(name="HS_TR_PAY_RESULT")
public class HsTrPayResult implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="RESULT_ID")
	private String resultId;

    @Temporal( TemporalType.DATE)
	@Column(name="BACK_TIME")
	private Date backTime;

	@Column(name="ORDER_ID")
	private String orderId;

	@Column(name="RET_CODE")
	private String retCode;

	@Column(name="RET_MSG")
	private String retMsg;

	@Column(name="RET_STR")
	private String retStr;

	private String status;

	@Column(name="TRANS_AMOUNT")
	private BigDecimal transAmount;

	@Column(name="TRANS_SERIALNO")
	private String transSerialno;

    public HsTrPayResult() {
    }

	public String getResultId() {
		return this.resultId;
	}

	public void setResultId(String resultId) {
		this.resultId = resultId;
	}

	public Date getBackTime() {
		return this.backTime;
	}

	public void setBackTime(Date backTime) {
		this.backTime = backTime;
	}

	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getRetCode() {
		return this.retCode;
	}

	public void setRetCode(String retCode) {
		this.retCode = retCode;
	}

	public String getRetMsg() {
		return this.retMsg;
	}

	public void setRetMsg(String retMsg) {
		this.retMsg = retMsg;
	}

	public String getRetStr() {
		return this.retStr;
	}

	public void setRetStr(String retStr) {
		this.retStr = retStr;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public BigDecimal getTransAmount() {
		return this.transAmount;
	}

	public void setTransAmount(BigDecimal transAmount) {
		this.transAmount = transAmount;
	}

	public String getTransSerialno() {
		return this.transSerialno;
	}

	public void setTransSerialno(String transSerialno) {
		this.transSerialno = transSerialno;
	}

}