package com.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.UserexamDao;
import com.entity.UserexamEntity;
import com.entity.UserexamEntity;
import com.entity.view.UserexamView;
import com.entity.view.UserexamView;
import com.entity.vo.UserexamVO;
import com.entity.vo.YonghuVO;
import com.service.UserexamService;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("UserexamService")
public class UserexamImpl extends ServiceImpl<UserexamDao, UserexamEntity> implements UserexamService {
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<UserexamEntity> page = this.selectPage(
                new Query<UserexamEntity>(params).getPage(),
                new EntityWrapper<UserexamEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<UserexamEntity> wrapper) {
        Page<UserexamView> page =new Query<UserexamView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page,wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }

    @Override
    public List<UserexamVO> selectListVO(Wrapper<UserexamEntity> wrapper) {
        return baseMapper.selectListVO(wrapper);
    }

    @Override
    public UserexamVO selectVO(Wrapper<UserexamEntity> wrapper) {
        return baseMapper.selectVO(wrapper);
    }

    @Override
    public List<UserexamView> selectListView(Wrapper<UserexamEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public UserexamView selectView(Wrapper<UserexamEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }


}
