package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

/**
 * 支付记录
 * 数据库通用操作实体类（普通增删改查）
 * @author
 * @email
 * @date 2023-06-30 14:39:54
 */

@TableName("userexam")
public class UserexamEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    public UserexamEntity() {

    }

    public UserexamEntity(T t) {
        try {
            BeanUtils.copyProperties(this, t);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    /**
     * 主键id
     */
    @TableId
    private Long id;

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

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getPaperid() {
        return paperid;
    }

    public void setPaperid(Long paperid) {
        this.paperid = paperid;
    }

    public String getPapername() {
        return papername;
    }

    public void setPapername(String papername) {
        this.papername = papername;
    }

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public Integer getSignup() {
        return signup;
    }

    public void setSignup(Integer signup) {
        this.signup = signup;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
