package com.entity.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 支付记录
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 * @author
 * @email
 * @date 2023-06-30 09:39:54
 */
public class UserexamModel implements Serializable {
    private static final long serialVersionID= 1L;

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
