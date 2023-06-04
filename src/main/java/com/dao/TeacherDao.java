package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.TeacherEntity;
import com.entity.view.TeacherView;
import com.entity.vo.TeacherVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 教师
 *
 * @author
 * @email
 * @date 2023-06-4 09:39:54
 */
public interface TeacherDao extends BaseMapper<TeacherEntity> {
    List<TeacherVO> selectListVO(@Param("ew") Wrapper<TeacherEntity> wrapper);

    TeacherVO selectVO(@Param("ew") Wrapper<TeacherEntity> wrapper);

    List<TeacherView> selectListView(@Param("ew") Wrapper<TeacherEntity> wrapper);

    List<TeacherView> selectListView(Pagination page, @Param("ew") Wrapper<TeacherEntity> wrapper);

    TeacherView selectView(@Param("ew") Wrapper<TeacherEntity> wrapper);

}
