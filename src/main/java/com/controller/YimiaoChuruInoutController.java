
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
 * 出入库
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/yimiaoChuruInout")
public class YimiaoChuruInoutController {
    private static final Logger logger = LoggerFactory.getLogger(YimiaoChuruInoutController.class);

    private static final String TABLE_NAME = "yimiaoChuruInout";

    @Autowired
    private YimiaoChuruInoutService yimiaoChuruInoutService;


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
    private YimiaoChuruInoutListService yimiaoChuruInoutListService;//出入库详情
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
        PageUtils page = yimiaoChuruInoutService.queryPage(params);

        //字典表数据转换
        List<YimiaoChuruInoutView> list =(List<YimiaoChuruInoutView>)page.getList();
        for(YimiaoChuruInoutView c:list){
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
        YimiaoChuruInoutEntity yimiaoChuruInout = yimiaoChuruInoutService.selectById(id);
        if(yimiaoChuruInout !=null){
            //entity转view
            YimiaoChuruInoutView view = new YimiaoChuruInoutView();
            BeanUtils.copyProperties( yimiaoChuruInout , view );//把实体数据重构到view中
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
    public R save(@RequestBody YimiaoChuruInoutEntity yimiaoChuruInout, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,yimiaoChuruInout:{}",this.getClass().getName(),yimiaoChuruInout.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");

        Wrapper<YimiaoChuruInoutEntity> queryWrapper = new EntityWrapper<YimiaoChuruInoutEntity>()
            .eq("yimiao_churu_inout_name", yimiaoChuruInout.getYimiaoChuruInoutName())
            .eq("yimiao_churu_inout_types", yimiaoChuruInout.getYimiaoChuruInoutTypes())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        YimiaoChuruInoutEntity yimiaoChuruInoutEntity = yimiaoChuruInoutService.selectOne(queryWrapper);
        if(yimiaoChuruInoutEntity==null){
            yimiaoChuruInout.setInsertTime(new Date());
            yimiaoChuruInout.setCreateTime(new Date());
            yimiaoChuruInoutService.insert(yimiaoChuruInout);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody YimiaoChuruInoutEntity yimiaoChuruInout, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,yimiaoChuruInout:{}",this.getClass().getName(),yimiaoChuruInout.toString());
        YimiaoChuruInoutEntity oldYimiaoChuruInoutEntity = yimiaoChuruInoutService.selectById(yimiaoChuruInout.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");

            yimiaoChuruInoutService.updateById(yimiaoChuruInout);//根据id更新
            return R.ok();
    }


    /**
    * 出库
    */
    @RequestMapping("/outYimiaoChuruInoutList")
    public R outYimiaoChuruInoutList(@RequestBody  Map<String, Object> params,HttpServletRequest request){
        logger.debug("outYimiaoChuruInoutList方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        String role = String.valueOf(request.getSession().getAttribute("role"));

        //取出入库名称并判断是否存在
        String yimiaoChuruInoutName = String.valueOf(params.get("yimiaoChuruInoutName"));
        Wrapper<YimiaoChuruInoutEntity> queryWrapper = new EntityWrapper<YimiaoChuruInoutEntity>()
            .eq("yimiao_churu_inout_name", yimiaoChuruInoutName)
            ;
        YimiaoChuruInoutEntity yimiaoChuruInoutSelectOne = yimiaoChuruInoutService.selectOne(queryWrapper);
        if(yimiaoChuruInoutSelectOne != null)
            return R.error(511,"出入库名称已被使用");



        Map<String, Integer> map = (Map<String, Integer>) params.get("map");
        if(map == null || map.size() == 0)
            return R.error(511,"列表内容不能为空");


        Set<String> ids = map.keySet();

        List<YimiaoEntity> yimiaoList = yimiaoService.selectBatchIds(ids);
        if(yimiaoList == null || yimiaoList.size() == 0){
            return R.error(511,"查数据库查不到数据");
        }else{
            for(YimiaoEntity w:yimiaoList){
                Integer value = w.getYimiaoKucunNumber()-map.get(String.valueOf(w.getId()));
                if(value <0){
                    return R.error(511,"出库数量大于库存数量");
                }
                w.setYimiaoKucunNumber(value);
            }
        }

        //当前表
        YimiaoChuruInoutEntity yimiaoChuruInoutEntity = new YimiaoChuruInoutEntity<>();
            yimiaoChuruInoutEntity.setYimiaoChuruInoutUuidNumber(String.valueOf(new Date().getTime()));
            yimiaoChuruInoutEntity.setYimiaoChuruInoutName(yimiaoChuruInoutName);
            yimiaoChuruInoutEntity.setYimiaoChuruInoutTypes(1);
            yimiaoChuruInoutEntity.setYimiaoChuruInoutContent("");
            yimiaoChuruInoutEntity.setInsertTime(new Date());
            yimiaoChuruInoutEntity.setCreateTime(new Date());

        boolean insertYimiaoChuruInout = yimiaoChuruInoutService.insert(yimiaoChuruInoutEntity);
        //list表
        ArrayList<YimiaoChuruInoutListEntity> yimiaoChuruInoutLists = new ArrayList<>();
        if(insertYimiaoChuruInout){
            for(String id:ids){
                YimiaoChuruInoutListEntity yimiaoChuruInoutListEntity = new YimiaoChuruInoutListEntity();
                    yimiaoChuruInoutListEntity.setYimiaoChuruInoutId(yimiaoChuruInoutEntity.getId());
                    yimiaoChuruInoutListEntity.setYimiaoId(Integer.valueOf(id));
                    yimiaoChuruInoutListEntity.setYimiaoChuruInoutListNumber(map.get(id));
                    yimiaoChuruInoutListEntity.setInsertTime(new Date());
                    yimiaoChuruInoutListEntity.setCreateTime(new Date());
                yimiaoChuruInoutLists.add(yimiaoChuruInoutListEntity);
                yimiaoService.updateBatchById(yimiaoList);
            }
            yimiaoChuruInoutListService.insertBatch(yimiaoChuruInoutLists);
        }

        return R.ok();
    }

    /**
    *入库
    */
    @RequestMapping("/inYimiaoChuruInoutList")
    public R inYimiaoChuruInoutList(@RequestBody  Map<String, Object> params,HttpServletRequest request){
        logger.debug("inYimiaoChuruInoutList方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        //params:{"map":{"1":2,"2":3},"wuziOutinName":"订单1"}

        String role = String.valueOf(request.getSession().getAttribute("role"));

        //取当前表名称并判断
        String yimiaoChuruInoutName = String.valueOf(params.get("yimiaoChuruInoutName"));
        Wrapper<YimiaoChuruInoutEntity> queryWrapper = new EntityWrapper<YimiaoChuruInoutEntity>()
            .eq("yimiao_churu_inout_name", yimiaoChuruInoutName)
            ;
        YimiaoChuruInoutEntity yimiaoChuruInoutSelectOne = yimiaoChuruInoutService.selectOne(queryWrapper);
        if(yimiaoChuruInoutSelectOne != null)
            return R.error(511,"出入库名称已被使用");


        Map<String, Integer> map = (Map<String, Integer>) params.get("map");
        if(map == null || map.size() == 0)
            return R.error(511,"列表内容不能为空");

        Set<String> ids = map.keySet();

        List<YimiaoEntity> yimiaoList = yimiaoService.selectBatchIds(ids);
        if(yimiaoList == null || yimiaoList.size() == 0){
            return R.error(511,"查数据库查不到数据");
        }else{
            for(YimiaoEntity w:yimiaoList){
                w.setYimiaoKucunNumber(w.getYimiaoKucunNumber()+map.get(String.valueOf(w.getId())));
            }
        }

        //当前表
        YimiaoChuruInoutEntity yimiaoChuruInoutEntity = new YimiaoChuruInoutEntity<>();
            yimiaoChuruInoutEntity.setYimiaoChuruInoutUuidNumber(String.valueOf(new Date().getTime()));
            yimiaoChuruInoutEntity.setYimiaoChuruInoutName(yimiaoChuruInoutName);
            yimiaoChuruInoutEntity.setYimiaoChuruInoutTypes(2);
            yimiaoChuruInoutEntity.setYimiaoChuruInoutContent("");
            yimiaoChuruInoutEntity.setInsertTime(new Date());
            yimiaoChuruInoutEntity.setCreateTime(new Date());


        boolean insertYimiaoChuruInout = yimiaoChuruInoutService.insert(yimiaoChuruInoutEntity);
        //list表
        ArrayList<YimiaoChuruInoutListEntity> yimiaoChuruInoutLists = new ArrayList<>();
        if(insertYimiaoChuruInout){
            for(String id:ids){
                YimiaoChuruInoutListEntity yimiaoChuruInoutListEntity = new YimiaoChuruInoutListEntity();
                yimiaoChuruInoutListEntity.setYimiaoChuruInoutId(yimiaoChuruInoutEntity.getId());
                yimiaoChuruInoutListEntity.setYimiaoId(Integer.valueOf(id));
                yimiaoChuruInoutListEntity.setYimiaoChuruInoutListNumber(map.get(id));
                yimiaoChuruInoutListEntity.setInsertTime(new Date());
                yimiaoChuruInoutListEntity.setCreateTime(new Date());
                yimiaoChuruInoutLists.add(yimiaoChuruInoutListEntity);
                yimiaoService.updateBatchById(yimiaoList);
            }
            yimiaoChuruInoutListService.insertBatch(yimiaoChuruInoutLists);
        }

        return R.ok();
    }
    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<YimiaoChuruInoutEntity> oldYimiaoChuruInoutList =yimiaoChuruInoutService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        yimiaoChuruInoutService.deleteBatchIds(Arrays.asList(ids));
        yimiaoChuruInoutListService.delete(new EntityWrapper<YimiaoChuruInoutListEntity>().in("yimiao_churu_inout_id",ids));

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
            List<YimiaoChuruInoutEntity> yimiaoChuruInoutList = new ArrayList<>();//上传的东西
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
                            YimiaoChuruInoutEntity yimiaoChuruInoutEntity = new YimiaoChuruInoutEntity();
//                            yimiaoChuruInoutEntity.setYimiaoChuruInoutUuidNumber(data.get(0));                    //出入库流水号 要改的
//                            yimiaoChuruInoutEntity.setYimiaoChuruInoutName(data.get(0));                    //出入库名称 要改的
//                            yimiaoChuruInoutEntity.setYimiaoChuruInoutTypes(Integer.valueOf(data.get(0)));   //出入库类型 要改的
//                            yimiaoChuruInoutEntity.setYimiaoChuruInoutContent("");//详情和图片
//                            yimiaoChuruInoutEntity.setInsertTime(date);//时间
//                            yimiaoChuruInoutEntity.setCreateTime(date);//时间
                            yimiaoChuruInoutList.add(yimiaoChuruInoutEntity);


                            //把要查询是否重复的字段放入map中
                                //出入库流水号
                                if(seachFields.containsKey("yimiaoChuruInoutUuidNumber")){
                                    List<String> yimiaoChuruInoutUuidNumber = seachFields.get("yimiaoChuruInoutUuidNumber");
                                    yimiaoChuruInoutUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> yimiaoChuruInoutUuidNumber = new ArrayList<>();
                                    yimiaoChuruInoutUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("yimiaoChuruInoutUuidNumber",yimiaoChuruInoutUuidNumber);
                                }
                        }

                        //查询是否重复
                         //出入库流水号
                        List<YimiaoChuruInoutEntity> yimiaoChuruInoutEntities_yimiaoChuruInoutUuidNumber = yimiaoChuruInoutService.selectList(new EntityWrapper<YimiaoChuruInoutEntity>().in("yimiao_churu_inout_uuid_number", seachFields.get("yimiaoChuruInoutUuidNumber")));
                        if(yimiaoChuruInoutEntities_yimiaoChuruInoutUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(YimiaoChuruInoutEntity s:yimiaoChuruInoutEntities_yimiaoChuruInoutUuidNumber){
                                repeatFields.add(s.getYimiaoChuruInoutUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [出入库流水号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        yimiaoChuruInoutService.insertBatch(yimiaoChuruInoutList);
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
        PageUtils page = yimiaoChuruInoutService.queryPage(params);

        //字典表数据转换
        List<YimiaoChuruInoutView> list =(List<YimiaoChuruInoutView>)page.getList();
        for(YimiaoChuruInoutView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        YimiaoChuruInoutEntity yimiaoChuruInout = yimiaoChuruInoutService.selectById(id);
            if(yimiaoChuruInout !=null){


                //entity转view
                YimiaoChuruInoutView view = new YimiaoChuruInoutView();
                BeanUtils.copyProperties( yimiaoChuruInout , view );//把实体数据重构到view中

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
    public R add(@RequestBody YimiaoChuruInoutEntity yimiaoChuruInout, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,yimiaoChuruInout:{}",this.getClass().getName(),yimiaoChuruInout.toString());
        Wrapper<YimiaoChuruInoutEntity> queryWrapper = new EntityWrapper<YimiaoChuruInoutEntity>()
            .eq("yimiao_churu_inout_uuid_number", yimiaoChuruInout.getYimiaoChuruInoutUuidNumber())
            .eq("yimiao_churu_inout_name", yimiaoChuruInout.getYimiaoChuruInoutName())
            .eq("yimiao_churu_inout_types", yimiaoChuruInout.getYimiaoChuruInoutTypes())
//            .notIn("yimiao_churu_inout_types", new Integer[]{102})
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        YimiaoChuruInoutEntity yimiaoChuruInoutEntity = yimiaoChuruInoutService.selectOne(queryWrapper);
        if(yimiaoChuruInoutEntity==null){
            yimiaoChuruInout.setInsertTime(new Date());
            yimiaoChuruInout.setCreateTime(new Date());
        yimiaoChuruInoutService.insert(yimiaoChuruInout);

            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

}

