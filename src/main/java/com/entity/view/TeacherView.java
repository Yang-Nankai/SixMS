package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.TeacherEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

/**
 * 教师
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author
 * @email
 * @date 2023-06-1 14:39:54
 */
@TableName("teacher")
public class TeacherView extends TeacherEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public TeacherView(){
    }

    public TeacherView(TeacherEntity TeacherEntity){
        try {
            BeanUtils.copyProperties(this, TeacherEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

    }
}

