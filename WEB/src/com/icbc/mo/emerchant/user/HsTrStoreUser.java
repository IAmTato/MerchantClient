package com.icbc.mo.emerchant.user;

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
 * The persistent class for the HS_TR_STORE_USER database table.
 * 
 */
@Entity
@Table(name="HS_TR_STORE_USER")
public class HsTrStoreUser implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="CREATE_DATE")
	private Date createDate;

	@Column(name="CREATE_ID")
	private String createId;

	@Column(name="DAY_ERR_SUM")
	private BigDecimal dayErrSum;

	private String email;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="ERR_DATE")
	private Date errDate;

	@Column(name="FIRST_STATUE")
	private String firstStatue;

	@Column(name="ORG_ID")
	private String orgId;
 
	@Column(name="PASS_WORD")
	private String passWord;

	private String phone;

	@Column(name="SESSION_ID")
	private String sessionId;

	@Column(name="TOTAL_ERR_SUM")
	private BigDecimal totalErrSum;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="UPDATE_DATE")
	private Date updateDate;

	@Column(name="UPDATE_ID")
	private String updateId;

	@Column(name="USER_ALIAS")
	private String userAlias;

	@Column(name="USER_ALIAS_ENCRYPT")
	private String userAliasEncrypt;

	@Column(name="USER_NAME")
	private String userName;

	@Column(name="USER_NAME_ENCRYPT")
	private String userNameEncrypt;

	@Column(name="USER_STATUS")
	private String userStatus;

	@Column(name="USER_TYPE")
	private String userType;

    public HsTrStoreUser() {
    }

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateId() {
		return this.createId;
	}

	public void setCreateId(String createId) {
		this.createId = createId;
	}

	public BigDecimal getDayErrSum() {
		return this.dayErrSum;
	}

	public void setDayErrSum(BigDecimal dayErrSum) {
		this.dayErrSum = dayErrSum;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getErrDate() {
		return this.errDate;
	}

	public void setErrDate(Date errDate) {
		this.errDate = errDate;
	}

	public String getFirstStatue() {
		return this.firstStatue;
	}

	public void setFirstStatue(String firstStatue) {
		this.firstStatue = firstStatue;
	}

	public String getOrgId() {
		return this.orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getPassWord() {
		return this.passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSessionId() {
		return this.sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public BigDecimal getTotalErrSum() {
		return this.totalErrSum;
	}

	public void setTotalErrSum(BigDecimal totalErrSum) {
		this.totalErrSum = totalErrSum;
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

	public String getUserAlias() {
		return this.userAlias;
	}

	public void setUserAlias(String userAlias) {
		this.userAlias = userAlias;
	}

	public String getUserAliasEncrypt() {
		return this.userAliasEncrypt;
	}

	public void setUserAliasEncrypt(String userAliasEncrypt) {
		this.userAliasEncrypt = userAliasEncrypt;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNameEncrypt() {
		return this.userNameEncrypt;
	}

	public void setUserNameEncrypt(String userNameEncrypt) {
		this.userNameEncrypt = userNameEncrypt;
	}

	public String getUserStatus() {
		return this.userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}