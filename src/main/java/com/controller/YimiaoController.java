
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
 * 疫苗
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/yimiao")
public class YimiaoController {
    private static final Logger logger = LoggerFactory.getLogger(YimiaoController.class);

    private static final String TABLE_NAME = "yimiao";

    @Autowired
    private YimiaoService yimiaoService;


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
    private YimiaoChuruInoutService yimiaoChuruInoutService;//出入库
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
        params.put("yimiaoDeleteStart",1);params.put("yimiaoDeleteEnd",1);
        CommonUtil.checkMap(params);
        PageUtils page = yimiaoService.queryPage(params);

        //字典表数据转换
        List<YimiaoView> list =(List<YimiaoView>)page.getList();
        for(YimiaoView c:list){
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
        YimiaoEntity yimiao = yimiaoService.selectById(id);
        if(yimiao !=null){
            //entity转view
            YimiaoView view = new YimiaoView();
            BeanUtils.copyProperties( yimiao , view );//把实体数据重构到view中
            //级联表 供应商信息
            //级联表
            GongyingshangEntity gongyingshang = gongyingshangService.selectById(yimiao.getGongyingshangId());
            if(gongyingshang != null){
            BeanUtils.copyProperties( gongyingshang , view ,new String[]{ "id", "createTime", "insertTime", "updateTime"});//把级联的数据添加到view中,并排除id和创建时间字段,当前表的级联注册表
            view.setGongyingshangId(gongyingshang.getId());
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
    public R save(@RequestBody YimiaoEntity yimiao, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,yimiao:{}",this.getClass().getName(),yimiao.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");

        Wrapper<YimiaoEntity> queryWrapper = new EntityWrapper<YimiaoEntity>()
            .eq("gongyingshang_id", yimiao.getGongyingshangId())
            .eq("yimiao_name", yimiao.getYimiaoName())
            .eq("yimiao_address", yimiao.getYimiaoAddress())
            .eq("yimiao_kucun_number", yimiao.getYimiaoKucunNumber())
            .eq("yimiao_types", yimiao.getYimiaoTypes())
            .eq("yimiao_delete", 1)
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        YimiaoEntity yimiaoEntity = yimiaoService.selectOne(queryWrapper);
        if(yimiaoEntity==null){
            yimiao.setYimiaoDelete(1);
            yimiao.setInsertTime(new Date());
            yimiao.setCreateTime(new Date());
            yimiaoService.insert(yimiao);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody YimiaoEntity yimiao, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,yimiao:{}",this.getClass().getName(),yimiao.toString());
        YimiaoEntity oldYimiaoEntity = yimiaoService.selectById(yimiao.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
        if("".equals(yimiao.getYimiaoPhoto()) || "null".equals(yimiao.getYimiaoPhoto())){
                yimiao.setYimiaoPhoto(null);
        }

            yimiaoService.updateById(yimiao);//根据id更新
            return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<YimiaoEntity> oldYimiaoList =yimiaoService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        ArrayList<YimiaoEntity> list = new ArrayList<>();
        for(Integer id:ids){
            YimiaoEntity yimiaoEntity = new YimiaoEntity();
            yimiaoEntity.setId(id);
            yimiaoEntity.setYimiaoDelete(2);
            list.add(yimiaoEntity);
        }
        if(list != null && list.size() >0){
            yimiaoService.updateBatchById(list);
        }

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
            List<YimiaoEntity> yimiaoList = new ArrayList<>();//上传的东西
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
                            YimiaoEntity yimiaoEntity = new YimiaoEntity();
//                            yimiaoEntity.setGongyingshangId(Integer.valueOf(data.get(0)));   //供应商 要改的
//                            yimiaoEntity.setYimiaoName(data.get(0));                    //疫苗名称 要改的
//                            yimiaoEntity.setYimiaoUuidNumber(data.get(0));                    //疫苗编号 要改的
//                            yimiaoEntity.setYimiaoPhoto("");//详情和图片
//                            yimiaoEntity.setYimiaoAddress(data.get(0));                    //疫苗接种地点 要改的
//                            yimiaoEntity.setYimiaoKucunNumber(Integer.valueOf(data.get(0)));   //接种人数 要改的
//                            yimiaoEntity.setYimiaoNewMoney(data.get(0));                    //金额 要改的
//                            yimiaoEntity.setYimiaoTypes(Integer.valueOf(data.get(0)));   //疫苗类型 要改的
//                            yimiaoEntity.setYimiaoContent("");//详情和图片
//                            yimiaoEntity.setYimiaoDelete(1);//逻辑删除字段
//                            yimiaoEntity.setInsertTime(date);//时间
//                            yimiaoEntity.setCreateTime(date);//时间
                            yimiaoList.add(yimiaoEntity);


                            //把要查询是否重复的字段放入map中
                                //疫苗编号
                                if(seachFields.containsKey("yimiaoUuidNumber")){
                                    List<String> yimiaoUuidNumber = seachFields.get("yimiaoUuidNumber");
                                    yimiaoUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> yimiaoUuidNumber = new ArrayList<>();
                                    yimiaoUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("yimiaoUuidNumber",yimiaoUuidNumber);
                                }
                        }

                        //查询是否重复
                         //疫苗编号
                        List<YimiaoEntity> yimiaoEntities_yimiaoUuidNumber = yimiaoService.selectList(new EntityWrapper<YimiaoEntity>().in("yimiao_uuid_number", seachFields.get("yimiaoUuidNumber")).eq("yimiao_delete", 1));
                        if(yimiaoEntities_yimiaoUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(YimiaoEntity s:yimiaoEntities_yimiaoUuidNumber){
                                repeatFields.add(s.getYimiaoUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [疫苗编号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        yimiaoService.insertBatch(yimiaoList);
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
    * 个性推荐
    */
    @IgnoreAuth
    @RequestMapping("/gexingtuijian")
    public R gexingtuijian(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("gexingtuijian方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        CommonUtil.checkMap(params);
        List<YimiaoView> returnYimiaoViewList = new ArrayList<>();

        //查询订单
        Map<String, Object> params1 = new HashMap<>(params);params1.put("sort","id");params1.put("yonghuId",request.getSession().getAttribute("userId"));
        PageUtils pageUtils = yimiaoOrderService.queryPage(params1);
        List<YimiaoOrderView> orderViewsList =(List<YimiaoOrderView>)pageUtils.getList();
        Map<Integer,Integer> typeMap=new HashMap<>();//购买的类型list
        for(YimiaoOrderView orderView:orderViewsList){
            Integer yimiaoTypes = orderView.getYimiaoTypes();
            if(typeMap.containsKey(yimiaoTypes)){
                typeMap.put(yimiaoTypes,typeMap.get(yimiaoTypes)+1);
            }else{
                typeMap.put(yimiaoTypes,1);
            }
        }
        List<Integer> typeList = new ArrayList<>();//排序后的有序的类型 按最多到最少
        typeMap.entrySet().stream().sorted((o1, o2) -> o2.getValue() - o1.getValue()).forEach(e -> typeList.add(e.getKey()));//排序
        Integer limit = Integer.valueOf(String.valueOf(params.get("limit")));
        for(Integer type:typeList){
            Map<String, Object> params2 = new HashMap<>(params);params2.put("yimiaoTypes",type);
            PageUtils pageUtils1 = yimiaoService.queryPage(params2);
            List<YimiaoView> yimiaoViewList =(List<YimiaoView>)pageUtils1.getList();
            returnYimiaoViewList.addAll(yimiaoViewList);
            if(returnYimiaoViewList.size()>= limit) break;//返回的推荐数量大于要的数量 跳出循环
        }
        //正常查询出来商品,用于补全推荐缺少的数据
        PageUtils page = yimiaoService.queryPage(params);
        if(returnYimiaoViewList.size()<limit){//返回数量还是小于要求数量
            int toAddNum = limit - returnYimiaoViewList.size();//要添加的数量
            List<YimiaoView> yimiaoViewList =(List<YimiaoView>)page.getList();
            for(YimiaoView yimiaoView:yimiaoViewList){
                Boolean addFlag = true;
                for(YimiaoView returnYimiaoView:returnYimiaoViewList){
                    if(returnYimiaoView.getId().intValue() ==yimiaoView.getId().intValue()) addFlag=false;//返回的数据中已存在此商品
                }
                if(addFlag){
                    toAddNum=toAddNum-1;
                    returnYimiaoViewList.add(yimiaoView);
                    if(toAddNum==0) break;//够数量了
                }
            }
        }else {
            returnYimiaoViewList = returnYimiaoViewList.subList(0, limit);
        }

        for(YimiaoView c:returnYimiaoViewList)
            dictionaryService.dictionaryConvert(c, request);
        page.setList(returnYimiaoViewList);
        return R.ok().put("data", page);
    }

    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        CommonUtil.checkMap(params);
        PageUtils page = yimiaoService.queryPage(params);

        //字典表数据转换
        List<YimiaoView> list =(List<YimiaoView>)page.getList();
        for(YimiaoView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        YimiaoEntity yimiao = yimiaoService.selectById(id);
            if(yimiao !=null){


                //entity转view
                YimiaoView view = new YimiaoView();
                BeanUtils.copyProperties( yimiao , view );//把实体数据重构到view中

                //级联表
                    GongyingshangEntity gongyingshang = gongyingshangService.selectById(yimiao.getGongyingshangId());
                if(gongyingshang != null){
                    BeanUtils.copyProperties( gongyingshang , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setGongyingshangId(gongyingshang.getId());
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
    public R add(@RequestBody YimiaoEntity yimiao, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,yimiao:{}",this.getClass().getName(),yimiao.toString());
        Wrapper<YimiaoEntity> queryWrapper = new EntityWrapper<YimiaoEntity>()
            .eq("gongyingshang_id", yimiao.getGongyingshangId())
            .eq("yimiao_name", yimiao.getYimiaoName())
            .eq("yimiao_uuid_number", yimiao.getYimiaoUuidNumber())
            .eq("yimiao_address", yimiao.getYimiaoAddress())
            .eq("yimiao_kucun_number", yimiao.getYimiaoKucunNumber())
            .eq("yimiao_types", yimiao.getYimiaoTypes())
            .eq("yimiao_delete", yimiao.getYimiaoDelete())
//            .notIn("yimiao_types", new Integer[]{102})
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        YimiaoEntity yimiaoEntity = yimiaoService.selectOne(queryWrapper);
        if(yimiaoEntity==null){
            yimiao.setYimiaoDelete(1);
            yimiao.setInsertTime(new Date());
            yimiao.setCreateTime(new Date());
        yimiaoService.insert(yimiao);

            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

}

