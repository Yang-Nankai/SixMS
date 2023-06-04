package com.dao;

import com.entity.KaoshengtongzhiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.KaoshengtongzhiVO;
import com.entity.view.KaoshengtongzhiView;


/**
 * 考生通知
 * 
 * @author 
 * @email 
 * @date 2023-06-1 14:39:54
 */
public interface KaoshengtongzhiDao extends BaseMapper<KaoshengtongzhiEntity> {
	
	List<KaoshengtongzhiVO> selectListVO(@Param("ew") Wrapper<KaoshengtongzhiEntity> wrapper);
	
	KaoshengtongzhiVO selectVO(@Param("ew") Wrapper<KaoshengtongzhiEntity> wrapper);
	
	List<KaoshengtongzhiView> selectListView(@Param("ew") Wrapper<KaoshengtongzhiEntity> wrapper);

	List<KaoshengtongzhiView> selectListView(Pagination page,@Param("ew") Wrapper<KaoshengtongzhiEntity> wrapper);
	
	KaoshengtongzhiView selectView(@Param("ew") Wrapper<KaoshengtongzhiEntity> wrapper);
	
}
