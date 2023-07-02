package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.UserexamEntity;
import com.entity.YonghuEntity;
import com.entity.view.UserexamView;
import com.entity.view.YonghuView;
import com.entity.vo.UserexamVO;
import com.entity.vo.YonghuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 支付记录
 *
 * @author
 * @email
 * @date 2023-06-30 14:39:54
 */
public interface UserexamDao extends BaseMapper<UserexamEntity> {
    List<UserexamVO> selectListVO(@Param("ew") Wrapper<UserexamEntity> wrapper);

    UserexamVO selectVO(@Param("ew") Wrapper<UserexamEntity> wrapper);

    List<UserexamView> selectListView(@Param("ew") Wrapper<UserexamEntity> wrapper);

    List<UserexamView> selectListView(Pagination page, @Param("ew") Wrapper<UserexamEntity> wrapper);

    UserexamView selectView(@Param("ew") Wrapper<UserexamEntity> wrapper);

}
