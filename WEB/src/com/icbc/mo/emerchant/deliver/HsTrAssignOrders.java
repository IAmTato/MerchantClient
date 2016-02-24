package com.icbc.mo.emerchant.deliver;

import javax.persistence.Basic;
import javax.persistence.Entity;

/**
 * Created by xiongfeizhao on 23/2/2016.
 */
@Entity
public class HsTrAssignOrders {
    @Basic
    private String basic;

    public String getBasic() {
        return basic;
    }

    public void setBasic(String basic) {
        this.basic = basic;
    }
}
