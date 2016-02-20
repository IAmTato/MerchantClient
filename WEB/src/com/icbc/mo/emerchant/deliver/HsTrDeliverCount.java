package com.icbc.mo.emerchant.deliver;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the HS_TR_DELIVER_RECORD database table.
 * 
 */
@Entity
@Table(name="HS_TR_DELIVER_COUNT")
public class HsTrDeliverCount implements Serializable {
	private static final long serialVersionUID = 1L;


    @Temporal( TemporalType.DATE)
	@Column(name="HANDOVER_TIME")
	private Date handoverTime;

	private BigDecimal totalAmount;

	@Column(name="total_COUNT")
	private BigDecimal totalCount;

	@Column(name="USER_ID")
	private String userId;

    public HsTrDeliverCount() {
    }

	public Date getHandoverTime() {
		return this.handoverTime;
	}

	public void setHandoverTime(Date handoverTime) {
		this.handoverTime = handoverTime;
	}



	public BigDecimal gettotalAmount() {
		return this.totalAmount;
	}

	public void settotal(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public BigDecimal gettotalCount() {
		return this.totalCount;
	}

	public void settotalCount(BigDecimal totalCount) {
		this.totalCount = totalCount;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}