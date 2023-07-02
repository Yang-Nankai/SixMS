package com.entity.view;
import com.entity.UserexamEntity;
import com.entity.YonghuEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;


/**
 * 支付记录
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author
 * @email
 * @date 2023-06-1 14:39:54
 */
@TableName("userexam")
public class UserexamView  extends UserexamEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public UserexamView(){
    }

    public UserexamView(UserexamEntity UserexamEntity){
        try {
            BeanUtils.copyProperties(this, UserexamEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

