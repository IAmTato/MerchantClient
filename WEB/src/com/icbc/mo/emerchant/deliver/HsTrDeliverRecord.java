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
@Table(name="HS_TR_DELIVER_RECORD")
public class HsTrDeliverRecord implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="END_TIME")
	private Date endTime;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="START_TIME")
	private Date startTime;

	private BigDecimal totle;

	@Column(name="TOTLE_COUNT")
	private BigDecimal totleCount;

	@Column(name="USER_ID")
	private String userId;

    public HsTrDeliverRecord() {
    }

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public BigDecimal getTotle() {
		return this.totle;
	}

	public void setTotle(BigDecimal totle) {
		this.totle = totle;
	}

	public BigDecimal getTotleCount() {
		return this.totleCount;
	}

	public void setTotleCount(BigDecimal totleCount) {
		this.totleCount = totleCount;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}