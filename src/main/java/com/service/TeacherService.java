package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.TeacherEntity;
import com.entity.view.TeacherView;
import com.entity.vo.TeacherVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 教师
 *
 * @author
 * @email
 * @date 2023-06-1 14:39:54
 */

public interface TeacherService extends IService<TeacherEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<TeacherVO> selectListVO(Wrapper<TeacherEntity> wrapper);

    TeacherVO selectVO(@Param("ew") Wrapper<TeacherEntity> wrapper);

    List<TeacherView> selectListView(Wrapper<TeacherEntity> wrapper);

    TeacherView selectView(@Param("ew") Wrapper<TeacherEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params,Wrapper<TeacherEntity> wrapper);

}
