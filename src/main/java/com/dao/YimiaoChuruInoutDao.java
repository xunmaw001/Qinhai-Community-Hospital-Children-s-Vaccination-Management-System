package com.dao;

import com.entity.YimiaoChuruInoutEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.YimiaoChuruInoutView;

/**
 * 出入库 Dao 接口
 *
 * @author 
 */
public interface YimiaoChuruInoutDao extends BaseMapper<YimiaoChuruInoutEntity> {

   List<YimiaoChuruInoutView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
