package com.entity.vo;

import java.io.Serializable;

/**
 * 支付记录
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 * @author
 * @email
 * @date 2023-06-1 14:39:54
 */
public class UserexamVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * userid
     */

    private Long userid;

    /**
     * user姓名
     */

    private String username;

    /**
     * paperid
     */

    private Long paperid;

    /**
     * 试卷名称
     */

    private String papername;

    /**
     * paper cost
     */

    private Integer cost;

    /**
     * Is signup?
     */

    private Integer signup;

    public Long getUserid() {
        return userid;
    }

    public String getUsername() {
        return username;
    }

    public Long getPaperid() {
        return paperid;
    }

    public String getPapername() {
        return papername;
    }

    public Integer getCost() {
        return cost;
    }

    public Integer getSignup() {
        return signup;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPaperid(Long paperid) {
        this.paperid = paperid;
    }

    public void setPapername(String papername) {
        this.papername = papername;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public void setSignup(Integer signup) {
        this.signup = signup;
    }


}
