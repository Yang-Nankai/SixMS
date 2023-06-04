package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.KaoshengtongzhiDao;
import com.entity.KaoshengtongzhiEntity;
import com.service.KaoshengtongzhiService;
import com.entity.vo.KaoshengtongzhiVO;
import com.entity.view.KaoshengtongzhiView;

@Service("kaoshengtongzhiService")
public class KaoshengtongzhiServiceImpl extends ServiceImpl<KaoshengtongzhiDao, KaoshengtongzhiEntity> implements KaoshengtongzhiService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<KaoshengtongzhiEntity> page = this.selectPage(
                new Query<KaoshengtongzhiEntity>(params).getPage(),
                new EntityWrapper<KaoshengtongzhiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<KaoshengtongzhiEntity> wrapper) {
		  Page<KaoshengtongzhiView> page =new Query<KaoshengtongzhiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<KaoshengtongzhiVO> selectListVO(Wrapper<KaoshengtongzhiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public KaoshengtongzhiVO selectVO(Wrapper<KaoshengtongzhiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<KaoshengtongzhiView> selectListView(Wrapper<KaoshengtongzhiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public KaoshengtongzhiView selectView(Wrapper<KaoshengtongzhiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
