package com.icbc.mo.emerchant.order;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * The persistent class for the HS_TR_ORDER_DIS_REL database table.
 * 
 */
@Entity
@Table(name="HS_TR_ORDER_DIS_REL")
public class HsTrOrderDisRel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="REL_ID")
	private String relId;

	private String currency;

	@Column(name="DIS_AMOUNT")
	private BigDecimal disAmount;

	@Column(name="DIS_ID")
	private String disId;

	@Column(name="DIS_NAME")
	private String disName;

	@Column(name="ORDER_ID")
	private String orderId;

    public HsTrOrderDisRel() {
    }

	public String getRelId() {
		return this.relId;
	}

	public void setRelId(String relId) {
		this.relId = relId;
	}

	public String getCurrency() {
		return this.currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public BigDecimal getDisAmount() {
		return this.disAmount;
	}

	public void setDisAmount(BigDecimal disAmount) {
		this.disAmount = disAmount;
	}

	public String getDisId() {
		return this.disId;
	}

	public void setDisId(String disId) {
		this.disId = disId;
	}

	public String getDisName() {
		return this.disName;
	}

	public void setDisName(String disName) {
		this.disName = disName;
	}

	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

}