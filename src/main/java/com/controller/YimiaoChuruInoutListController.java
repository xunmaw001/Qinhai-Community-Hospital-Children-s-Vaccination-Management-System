
package com.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.*;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.*;
import com.entity.view.*;
import com.service.*;
import com.utils.PageUtils;
import com.utils.R;
import com.alibaba.fastjson.*;

/**
 * 出入库详情
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/yimiaoChuruInoutList")
public class YimiaoChuruInoutListController {
    private static final Logger logger = LoggerFactory.getLogger(YimiaoChuruInoutListController.class);

    private static final String TABLE_NAME = "yimiaoChuruInoutList";

    @Autowired
    private YimiaoChuruInoutListService yimiaoChuruInoutListService;


    @Autowired
    private TokenService tokenService;

    @Autowired
    private DictionaryService dictionaryService;//字典
    @Autowired
    private ForumService forumService;//论坛
    @Autowired
    private GonggaoService gonggaoService;//异常信息
    @Autowired
    private GongyingshangService gongyingshangService;//供应商信息
    @Autowired
    private HaiziService haiziService;//孩子信息
    @Autowired
    private YimiaoService yimiaoService;//疫苗
    @Autowired
    private YimiaoChuruInoutService yimiaoChuruInoutService;//出入库
    @Autowired
    private YimiaoOrderService yimiaoOrderService;//疫苗预约
    @Autowired
    private YishengService yishengService;//医生
    @Autowired
    private YishengLiuyanService yishengLiuyanService;//提醒接种提
    @Autowired
    private YonghuService yonghuService;//用户
    @Autowired
    private UsersService usersService;//管理员


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永不会进入");
        else if("用户".equals(role))
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        else if("医生".equals(role))
            params.put("yishengId",request.getSession().getAttribute("userId"));
        CommonUtil.checkMap(params);
        PageUtils page = yimiaoChuruInoutListService.queryPage(params);

        //字典表数据转换
        List<YimiaoChuruInoutListView> list =(List<YimiaoChuruInoutListView>)page.getList();
        for(YimiaoChuruInoutListView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c, request);
        }
        return R.ok().put("data", page);
    }

    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        YimiaoChuruInoutListEntity yimiaoChuruInoutList = yimiaoChuruInoutListService.selectById(id);
        if(yimiaoChuruInoutList !=null){
            //entity转view
            YimiaoChuruInoutListView view = new YimiaoChuruInoutListView();
            BeanUtils.copyProperties( yimiaoChuruInoutList , view );//把实体数据重构到view中
            //级联表 出入库
            //级联表
            YimiaoChuruInoutEntity yimiaoChuruInout = yimiaoChuruInoutService.selectById(yimiaoChuruInoutList.getYimiaoChuruInoutId());
            if(yimiaoChuruInout != null){
            BeanUtils.copyProperties( yimiaoChuruInout , view ,new String[]{ "id", "createTime", "insertTime", "updateTime"});//把级联的数据添加到view中,并排除id和创建时间字段,当前表的级联注册表
            view.setYimiaoChuruInoutId(yimiaoChuruInout.getId());
            }
            //级联表 疫苗
            //级联表
            YimiaoEntity yimiao = yimiaoService.selectById(yimiaoChuruInoutList.getYimiaoId());
            if(yimiao != null){
            BeanUtils.copyProperties( yimiao , view ,new String[]{ "id", "createTime", "insertTime", "updateTime"});//把级联的数据添加到view中,并排除id和创建时间字段,当前表的级联注册表
            view.setYimiaoId(yimiao.getId());
            }
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody YimiaoChuruInoutListEntity yimiaoChuruInoutList, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,yimiaoChuruInoutList:{}",this.getClass().getName(),yimiaoChuruInoutList.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");

        Wrapper<YimiaoChuruInoutListEntity> queryWrapper = new EntityWrapper<YimiaoChuruInoutListEntity>()
            .eq("yimiao_churu_inout_id", yimiaoChuruInoutList.getYimiaoChuruInoutId())
            .eq("yimiao_id", yimiaoChuruInoutList.getYimiaoId())
            .eq("yimiao_churu_inout_list_number", yimiaoChuruInoutList.getYimiaoChuruInoutListNumber())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        YimiaoChuruInoutListEntity yimiaoChuruInoutListEntity = yimiaoChuruInoutListService.selectOne(queryWrapper);
        if(yimiaoChuruInoutListEntity==null){
            yimiaoChuruInoutList.setInsertTime(new Date());
            yimiaoChuruInoutList.setCreateTime(new Date());
            yimiaoChuruInoutListService.insert(yimiaoChuruInoutList);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody YimiaoChuruInoutListEntity yimiaoChuruInoutList, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,yimiaoChuruInoutList:{}",this.getClass().getName(),yimiaoChuruInoutList.toString());
        YimiaoChuruInoutListEntity oldYimiaoChuruInoutListEntity = yimiaoChuruInoutListService.selectById(yimiaoChuruInoutList.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");

            yimiaoChuruInoutListService.updateById(yimiaoChuruInoutList);//根据id更新
            return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<YimiaoChuruInoutListEntity> oldYimiaoChuruInoutListList =yimiaoChuruInoutListService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        yimiaoChuruInoutListService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }


    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save( String fileName, HttpServletRequest request){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        Integer yonghuId = Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId")));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //.eq("time", new SimpleDateFormat("yyyy-MM-dd").format(new Date()))
        try {
            List<YimiaoChuruInoutListEntity> yimiaoChuruInoutListList = new ArrayList<>();//上传的东西
            Map<String, List<String>> seachFields= new HashMap<>();//要查询的字段
            Date date = new Date();
            int lastIndexOf = fileName.lastIndexOf(".");
            if(lastIndexOf == -1){
                return R.error(511,"该文件没有后缀");
            }else{
                String suffix = fileName.substring(lastIndexOf);
                if(!".xls".equals(suffix)){
                    return R.error(511,"只支持后缀为xls的excel文件");
                }else{
                    URL resource = this.getClass().getClassLoader().getResource("../../upload/" + fileName);//获取文件路径
                    File file = new File(resource.getFile());
                    if(!file.exists()){
                        return R.error(511,"找不到上传文件，请联系管理员");
                    }else{
                        List<List<String>> dataList = PoiUtil.poiImport(file.getPath());//读取xls文件
                        dataList.remove(0);//删除第一行，因为第一行是提示
                        for(List<String> data:dataList){
                            //循环
                            YimiaoChuruInoutListEntity yimiaoChuruInoutListEntity = new YimiaoChuruInoutListEntity();
//                            yimiaoChuruInoutListEntity.setYimiaoChuruInoutId(Integer.valueOf(data.get(0)));   //出入库 要改的
//                            yimiaoChuruInoutListEntity.setYimiaoId(Integer.valueOf(data.get(0)));   //商品 要改的
//                            yimiaoChuruInoutListEntity.setYimiaoChuruInoutListNumber(Integer.valueOf(data.get(0)));   //操作数量 要改的
//                            yimiaoChuruInoutListEntity.setInsertTime(date);//时间
//                            yimiaoChuruInoutListEntity.setCreateTime(date);//时间
                            yimiaoChuruInoutListList.add(yimiaoChuruInoutListEntity);


                            //把要查询是否重复的字段放入map中
                        }

                        //查询是否重复
                        yimiaoChuruInoutListService.insertBatch(yimiaoChuruInoutListList);
                        return R.ok();
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error(511,"批量插入数据异常，请联系管理员");
        }
    }




    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        CommonUtil.checkMap(params);
        PageUtils page = yimiaoChuruInoutListService.queryPage(params);

        //字典表数据转换
        List<YimiaoChuruInoutListView> list =(List<YimiaoChuruInoutListView>)page.getList();
        for(YimiaoChuruInoutListView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        YimiaoChuruInoutListEntity yimiaoChuruInoutList = yimiaoChuruInoutListService.selectById(id);
            if(yimiaoChuruInoutList !=null){


                //entity转view
                YimiaoChuruInoutListView view = new YimiaoChuruInoutListView();
                BeanUtils.copyProperties( yimiaoChuruInoutList , view );//把实体数据重构到view中

                //级联表
                    YimiaoChuruInoutEntity yimiaoChuruInout = yimiaoChuruInoutService.selectById(yimiaoChuruInoutList.getYimiaoChuruInoutId());
                if(yimiaoChuruInout != null){
                    BeanUtils.copyProperties( yimiaoChuruInout , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYimiaoChuruInoutId(yimiaoChuruInout.getId());
                }
                //级联表
                    YimiaoEntity yimiao = yimiaoService.selectById(yimiaoChuruInoutList.getYimiaoId());
                if(yimiao != null){
                    BeanUtils.copyProperties( yimiao , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYimiaoId(yimiao.getId());
                }
                //修改对应字典表字段
                dictionaryService.dictionaryConvert(view, request);
                return R.ok().put("data", view);
            }else {
                return R.error(511,"查不到数据");
            }
    }


    /**
    * 前端保存
    */
    @RequestMapping("/add")
    public R add(@RequestBody YimiaoChuruInoutListEntity yimiaoChuruInoutList, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,yimiaoChuruInoutList:{}",this.getClass().getName(),yimiaoChuruInoutList.toString());
        Wrapper<YimiaoChuruInoutListEntity> queryWrapper = new EntityWrapper<YimiaoChuruInoutListEntity>()
            .eq("yimiao_churu_inout_id", yimiaoChuruInoutList.getYimiaoChuruInoutId())
            .eq("yimiao_id", yimiaoChuruInoutList.getYimiaoId())
            .eq("yimiao_churu_inout_list_number", yimiaoChuruInoutList.getYimiaoChuruInoutListNumber())
//            .notIn("yimiao_churu_inout_list_types", new Integer[]{102})
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        YimiaoChuruInoutListEntity yimiaoChuruInoutListEntity = yimiaoChuruInoutListService.selectOne(queryWrapper);
        if(yimiaoChuruInoutListEntity==null){
            yimiaoChuruInoutList.setInsertTime(new Date());
            yimiaoChuruInoutList.setCreateTime(new Date());
        yimiaoChuruInoutListService.insert(yimiaoChuruInoutList);

            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

}

