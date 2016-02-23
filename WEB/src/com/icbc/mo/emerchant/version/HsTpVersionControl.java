package com.icbc.mo.emerchant.version;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the HS_TP_VERSION_CONTROL database table.
 * 
 */
@Entity
@Table(name="HS_TP_VERSION_CONTROL")
public class HsTpVersionControl implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="HS_TP_VERSION_CONTROL_ID_GENERATOR" )
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="HS_TP_VERSION_CONTROL_ID_GENERATOR")
	private String id;

	@Column(name="UPDATE_INFO")
	private String updateInfo;

	@Column(name="UPDATE_PATH")
	private String updatePath;

    @Temporal( TemporalType.DATE)
	@Column(name="UPDATE_TIME")
	private Date updateTime;

	private String version;

    public HsTpVersionControl() {
    }

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUpdateInfo() {
		return this.updateInfo;
	}

	public void setUpdateInfo(String updateInfo) {
		this.updateInfo = updateInfo;
	}

	public String getUpdatePath() {
		return this.updatePath;
	}

	public void setUpdatePath(String updatePath) {
		this.updatePath = updatePath;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getVersion() {
		return this.version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

}