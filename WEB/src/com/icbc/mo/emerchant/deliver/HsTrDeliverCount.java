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

	@Id
	@SequenceGenerator(name="HS_TL_DELIVER_COUNT_ID_GENERATOR", sequenceName="seq_deliver_count")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="HS_TL_DELIVER_COUNT_ID_GENERATOR")
	private String id;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="HANDOVER_TIME")
	private Date handoverTime;

    @Column(name="TOTAL_AMOUNT")
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

	public void settotalAmount(BigDecimal totalAmount) {
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

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}