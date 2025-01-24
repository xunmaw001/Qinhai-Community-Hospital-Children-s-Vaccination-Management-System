package com.dao;

import com.entity.HaiziEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.HaiziView;

/**
 * 孩子信息 Dao 接口
 *
 * @author 
 */
public interface HaiziDao extends BaseMapper<HaiziEntity> {

   List<HaiziView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
