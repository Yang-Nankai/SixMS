package com.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.TeacherDao;
import com.entity.TeacherEntity;
import com.entity.view.TeacherView;
import com.entity.vo.TeacherVO;
import com.service.TeacherService;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("TeacherService")
public class TeacherServiceImpl extends ServiceImpl<TeacherDao, TeacherEntity> implements TeacherService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<TeacherEntity> page = this.selectPage(
                new Query<TeacherEntity>(params).getPage(),
                new EntityWrapper<TeacherEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<TeacherEntity> wrapper) {
        Page<TeacherView> page =new Query<TeacherView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page,wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }

    @Override
    public List<TeacherVO> selectListVO(Wrapper<TeacherEntity> wrapper) {
        return baseMapper.selectListVO(wrapper);
    }

    @Override
    public TeacherVO selectVO(Wrapper<TeacherEntity> wrapper) {
        return baseMapper.selectVO(wrapper);
    }

    @Override
    public List<TeacherView> selectListView(Wrapper<TeacherEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public TeacherView selectView(Wrapper<TeacherEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }
}
