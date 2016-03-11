package com.icbc.mo.emerchant.store;

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
 * The persistent class for the HS_TR_STORE_DETAIL database table.
 * 
 */
@Entity
@Table(name="HS_TR_STORE_DETAIL")
public class HsTrStoreDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="STORE_ID")
	private String storeId;

	@Column(name="ADD_FEE_FLAG")
	private String addFeeFlag;

	@Column(name="ADD_FEE_RATE")
	private BigDecimal addFeeRate;

	private String admindivision;

	@Column(name="APPRO_STATUS")
	private String approStatus;

	@Column(name="AVG_PRICE")
	private BigDecimal avgPrice;

	@Column(name="BROADTRADE_TYPE")
	private String broadtradeType;

	private String busidivision;

	private String busihours;

	private String busitel1;

	private String busitel2;

	private String citycode;

	@Column(name="CLEARING_ACCOUNT1")
	private String clearingAccount1;

	@Column(name="CLEARING_ACCOUNT2")
	private String clearingAccount2;

	@Column(name="CLEARING_ACCOUNT3")
	private String clearingAccount3;

	@Column(name="CLEARING_CURRENCY1")
	private String clearingCurrency1;

	@Column(name="CLEARING_CURRENCY2")
	private String clearingCurrency2;

	@Column(name="CLEARING_CURRENCY3")
	private String clearingCurrency3;

	@Column(name="CLOSED_STATUS")
	private String closedStatus;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="CREATE_DATE")
	private Date createDate;

	@Column(name="CREATE_ID")
	private String createId;

	@Column(name="DISTRIBUTION_FEE")
	private BigDecimal distributionFee;

	private String ext1;

	private String ext10;

	private String ext2;

	private String ext3;

	private String ext4;

	private String ext5;

	private String ext6;

	private String ext7;

	private String ext8;

	private String ext9;

	@Column(name="GOOD_TIMES")
	private BigDecimal goodTimes;

	private String latitude;

	private String longitude;

	@Column(name="MER_ID")
	private String merId;

	private String msgsended;

	private String nationcode;

	@Column(name="OPER_FLAG")
	private String operFlag;

	private BigDecimal popular;

	@Column(name="QUERY_KEY")
	private String queryKey;

	@Column(name="RECOMMEND_INFO_ID")
	private String recommendInfoId;

	@Column(name="STAR_LEVEL")
	private BigDecimal starLevel;

	@Column(name="STARTING_PRICE")
	private BigDecimal startingPrice;

	@Column(name="STORE_ADDR_CN")
	private String storeAddrCn;

	@Column(name="STORE_ADDR_CODE")
	private String storeAddrCode;

	@Column(name="STORE_ADDR_EN")
	private String storeAddrEn;

	@Column(name="STORE_BRIEFINTRO_CN")
	private String storeBriefintroCn;

	@Column(name="STORE_BRIEFINTRO_EN")
	private String storeBriefintroEn;

	@Column(name="STORE_LINKMAN")
	private String storeLinkman;

	@Column(name="STORE_LOGO_NAME")
	private String storeLogoName;

	@Column(name="STORE_LOGO_URL")
	private String storeLogoUrl;

	@Column(name="STORE_MOBILE")
	private String storeMobile;

	@Column(name="STORE_NAME_CN")
	private String storeNameCn;

	@Column(name="STORE_NAME_EN")
	private String storeNameEn;

	@Column(name="STORE_STATUS")
	private String storeStatus;

	@Column(name="SUPPORT_FLAG")
	private String supportFlag;

	@Column(name="TRADE_TYPE")
	private String tradeType;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="UPDATE_DATE")
	private Date updateDate;

	@Column(name="UPDATE_ID")
	private String updateId;

	@Column(name="VIEW_TIMES")
	private BigDecimal viewTimes;

    public HsTrStoreDetail() {
    }

	public String getStoreId() {
		return this.storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getAddFeeFlag() {
		return this.addFeeFlag;
	}

	public void setAddFeeFlag(String addFeeFlag) {
		this.addFeeFlag = addFeeFlag;
	}

	public BigDecimal getAddFeeRate() {
		return this.addFeeRate;
	}

	public void setAddFeeRate(BigDecimal addFeeRate) {
		this.addFeeRate = addFeeRate;
	}

	public String getAdmindivision() {
		return this.admindivision;
	}

	public void setAdmindivision(String admindivision) {
		this.admindivision = admindivision;
	}

	public String getApproStatus() {
		return this.approStatus;
	}

	public void setApproStatus(String approStatus) {
		this.approStatus = approStatus;
	}

	public BigDecimal getAvgPrice() {
		return this.avgPrice;
	}

	public void setAvgPrice(BigDecimal avgPrice) {
		this.avgPrice = avgPrice;
	}

	public String getBroadtradeType() {
		return this.broadtradeType;
	}

	public void setBroadtradeType(String broadtradeType) {
		this.broadtradeType = broadtradeType;
	}

	public String getBusidivision() {
		return this.busidivision;
	}

	public void setBusidivision(String busidivision) {
		this.busidivision = busidivision;
	}

	public String getBusihours() {
		return this.busihours;
	}

	public void setBusihours(String busihours) {
		this.busihours = busihours;
	}

	public String getBusitel1() {
		return this.busitel1;
	}

	public void setBusitel1(String busitel1) {
		this.busitel1 = busitel1;
	}

	public String getBusitel2() {
		return this.busitel2;
	}

	public void setBusitel2(String busitel2) {
		this.busitel2 = busitel2;
	}

	public String getCitycode() {
		return this.citycode;
	}

	public void setCitycode(String citycode) {
		this.citycode = citycode;
	}

	public String getClearingAccount1() {
		return this.clearingAccount1;
	}

	public void setClearingAccount1(String clearingAccount1) {
		this.clearingAccount1 = clearingAccount1;
	}

	public String getClearingAccount2() {
		return this.clearingAccount2;
	}

	public void setClearingAccount2(String clearingAccount2) {
		this.clearingAccount2 = clearingAccount2;
	}

	public String getClearingAccount3() {
		return this.clearingAccount3;
	}

	public void setClearingAccount3(String clearingAccount3) {
		this.clearingAccount3 = clearingAccount3;
	}

	public String getClearingCurrency1() {
		return this.clearingCurrency1;
	}

	public void setClearingCurrency1(String clearingCurrency1) {
		this.clearingCurrency1 = clearingCurrency1;
	}

	public String getClearingCurrency2() {
		return this.clearingCurrency2;
	}

	public void setClearingCurrency2(String clearingCurrency2) {
		this.clearingCurrency2 = clearingCurrency2;
	}

	public String getClearingCurrency3() {
		return this.clearingCurrency3;
	}

	public void setClearingCurrency3(String clearingCurrency3) {
		this.clearingCurrency3 = clearingCurrency3;
	}

	public String getClosedStatus() {
		return this.closedStatus;
	}

	public void setClosedStatus(String closedStatus) {
		this.closedStatus = closedStatus;
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

	public BigDecimal getDistributionFee() {
		return this.distributionFee;
	}

	public void setDistributionFee(BigDecimal distributionFee) {
		this.distributionFee = distributionFee;
	}

	public String getExt1() {
		return this.ext1;
	}

	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}

	public String getExt10() {
		return this.ext10;
	}

	public void setExt10(String ext10) {
		this.ext10 = ext10;
	}

	public String getExt2() {
		return this.ext2;
	}

	public void setExt2(String ext2) {
		this.ext2 = ext2;
	}

	public String getExt3() {
		return this.ext3;
	}

	public void setExt3(String ext3) {
		this.ext3 = ext3;
	}

	public String getExt4() {
		return this.ext4;
	}

	public void setExt4(String ext4) {
		this.ext4 = ext4;
	}

	public String getExt5() {
		return this.ext5;
	}

	public void setExt5(String ext5) {
		this.ext5 = ext5;
	}

	public String getExt6() {
		return this.ext6;
	}

	public void setExt6(String ext6) {
		this.ext6 = ext6;
	}

	public String getExt7() {
		return this.ext7;
	}

	public void setExt7(String ext7) {
		this.ext7 = ext7;
	}

	public String getExt8() {
		return this.ext8;
	}

	public void setExt8(String ext8) {
		this.ext8 = ext8;
	}

	public String getExt9() {
		return this.ext9;
	}

	public void setExt9(String ext9) {
		this.ext9 = ext9;
	}

	public BigDecimal getGoodTimes() {
		return this.goodTimes;
	}

	public void setGoodTimes(BigDecimal goodTimes) {
		this.goodTimes = goodTimes;
	}

	public String getLatitude() {
		return this.latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return this.longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getMerId() {
		return this.merId;
	}

	public void setMerId(String merId) {
		this.merId = merId;
	}

	public String getMsgsended() {
		return this.msgsended;
	}

	public void setMsgsended(String msgsended) {
		this.msgsended = msgsended;
	}

	public String getNationcode() {
		return this.nationcode;
	}

	public void setNationcode(String nationcode) {
		this.nationcode = nationcode;
	}

	public String getOperFlag() {
		return this.operFlag;
	}

	public void setOperFlag(String operFlag) {
		this.operFlag = operFlag;
	}

	public BigDecimal getPopular() {
		return this.popular;
	}

	public void setPopular(BigDecimal popular) {
		this.popular = popular;
	}

	public String getQueryKey() {
		return this.queryKey;
	}

	public void setQueryKey(String queryKey) {
		this.queryKey = queryKey;
	}

	public String getRecommendInfoId() {
		return this.recommendInfoId;
	}

	public void setRecommendInfoId(String recommendInfoId) {
		this.recommendInfoId = recommendInfoId;
	}

	public BigDecimal getStarLevel() {
		return this.starLevel;
	}

	public void setStarLevel(BigDecimal starLevel) {
		this.starLevel = starLevel;
	}

	public BigDecimal getStartingPrice() {
		return this.startingPrice;
	}

	public void setStartingPrice(BigDecimal startingPrice) {
		this.startingPrice = startingPrice;
	}

	public String getStoreAddrCn() {
		return this.storeAddrCn;
	}

	public void setStoreAddrCn(String storeAddrCn) {
		this.storeAddrCn = storeAddrCn;
	}

	public String getStoreAddrCode() {
		return this.storeAddrCode;
	}

	public void setStoreAddrCode(String storeAddrCode) {
		this.storeAddrCode = storeAddrCode;
	}

	public String getStoreAddrEn() {
		return this.storeAddrEn;
	}

	public void setStoreAddrEn(String storeAddrEn) {
		this.storeAddrEn = storeAddrEn;
	}

	public String getStoreBriefintroCn() {
		return this.storeBriefintroCn;
	}

	public void setStoreBriefintroCn(String storeBriefintroCn) {
		this.storeBriefintroCn = storeBriefintroCn;
	}

	public String getStoreBriefintroEn() {
		return this.storeBriefintroEn;
	}

	public void setStoreBriefintroEn(String storeBriefintroEn) {
		this.storeBriefintroEn = storeBriefintroEn;
	}

	public String getStoreLinkman() {
		return this.storeLinkman;
	}

	public void setStoreLinkman(String storeLinkman) {
		this.storeLinkman = storeLinkman;
	}

	public String getStoreLogoName() {
		return this.storeLogoName;
	}

	public void setStoreLogoName(String storeLogoName) {
		this.storeLogoName = storeLogoName;
	}

	public String getStoreLogoUrl() {
		return this.storeLogoUrl;
	}

	public void setStoreLogoUrl(String storeLogoUrl) {
		this.storeLogoUrl = storeLogoUrl;
	}

	public String getStoreMobile() {
		return this.storeMobile;
	}

	public void setStoreMobile(String storeMobile) {
		this.storeMobile = storeMobile;
	}

	public String getStoreNameCn() {
		return this.storeNameCn;
	}

	public void setStoreNameCn(String storeNameCn) {
		this.storeNameCn = storeNameCn;
	}

	public String getStoreNameEn() {
		return this.storeNameEn;
	}

	public void setStoreNameEn(String storeNameEn) {
		this.storeNameEn = storeNameEn;
	}

	public String getStoreStatus() {
		return this.storeStatus;
	}

	public void setStoreStatus(String storeStatus) {
		this.storeStatus = storeStatus;
	}

	public String getSupportFlag() {
		return this.supportFlag;
	}

	public void setSupportFlag(String supportFlag) {
		this.supportFlag = supportFlag;
	}

	public String getTradeType() {
		return this.tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
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

	public BigDecimal getViewTimes() {
		return this.viewTimes;
	}

	public void setViewTimes(BigDecimal viewTimes) {
		this.viewTimes = viewTimes;
	}

}