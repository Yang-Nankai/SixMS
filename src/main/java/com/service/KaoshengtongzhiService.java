package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.KaoshengtongzhiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.KaoshengtongzhiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.KaoshengtongzhiView;


/**
 * 考生通知
 *
 * @author 
 * @email 
 * @date 2023-06-1 14:39:54
 */
public interface KaoshengtongzhiService extends IService<KaoshengtongzhiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<KaoshengtongzhiVO> selectListVO(Wrapper<KaoshengtongzhiEntity> wrapper);
   	
   	KaoshengtongzhiVO selectVO(@Param("ew") Wrapper<KaoshengtongzhiEntity> wrapper);
   	
   	List<KaoshengtongzhiView> selectListView(Wrapper<KaoshengtongzhiEntity> wrapper);
   	
   	KaoshengtongzhiView selectView(@Param("ew") Wrapper<KaoshengtongzhiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<KaoshengtongzhiEntity> wrapper);
   	
}

