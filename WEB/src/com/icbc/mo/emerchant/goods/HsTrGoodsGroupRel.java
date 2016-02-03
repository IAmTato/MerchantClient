package com.icbc.mo.emerchant.goods;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * The persistent class for the HS_TR_GOODS_GROUP_REL database table.
 * 
 */
@Entity
@Table(name="HS_TR_GOODS_GROUP_REL")
public class HsTrGoodsGroupRel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Column(name="GOODS_ID")
	private String goodsId;

	@Column(name="GOODS_TYPE")
	private String goodsType;

	@Column(name="SUB_GOODS_ID")
	private String subGoodsId;

    public HsTrGoodsGroupRel() {
    }

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsType() {
		return this.goodsType;
	}

	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}

	public String getSubGoodsId() {
		return this.subGoodsId;
	}

	public void setSubGoodsId(String subGoodsId) {
		this.subGoodsId = subGoodsId;
	}

}