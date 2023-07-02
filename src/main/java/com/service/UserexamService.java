package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.UserexamEntity;
import com.entity.YonghuEntity;
import com.entity.view.UserexamView;
import com.entity.view.YonghuView;
import com.entity.vo.UserexamVO;
import com.entity.vo.YonghuVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserexamService extends IService<UserexamEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<UserexamVO> selectListVO(Wrapper<UserexamEntity> wrapper);

    UserexamVO selectVO(@Param("ew") Wrapper<UserexamEntity> wrapper);

    List<UserexamView> selectListView(Wrapper<UserexamEntity> wrapper);

    UserexamView selectView(@Param("ew") Wrapper<UserexamEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params,Wrapper<UserexamEntity> wrapper);

}
