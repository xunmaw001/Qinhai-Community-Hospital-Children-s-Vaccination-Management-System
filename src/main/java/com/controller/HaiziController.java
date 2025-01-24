
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
 * 孩子信息
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/haizi")
public class HaiziController {
    private static final Logger logger = LoggerFactory.getLogger(HaiziController.class);

    private static final String TABLE_NAME = "haizi";

    @Autowired
    private HaiziService haiziService;


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
    private YimiaoService yimiaoService;//疫苗
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
        CommonUtil.checkMap(params);
        PageUtils page = haiziService.queryPage(params);

        //字典表数据转换
        List<HaiziView> list =(List<HaiziView>)page.getList();
        for(HaiziView c:list){
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
        HaiziEntity haizi = haiziService.selectById(id);
        if(haizi !=null){
            //entity转view
            HaiziView view = new HaiziView();
            BeanUtils.copyProperties( haizi , view );//把实体数据重构到view中
            //级联表 用户
            //级联表
            YonghuEntity yonghu = yonghuService.selectById(haizi.getYonghuId());
            if(yonghu != null){
            BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createTime", "insertTime", "updateTime", "yonghuId"});//把级联的数据添加到view中,并排除id和创建时间字段,当前表的级联注册表
            view.setYonghuId(yonghu.getId());
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
    public R save(@RequestBody HaiziEntity haizi, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,haizi:{}",this.getClass().getName(),haizi.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");
        else if("用户".equals(role))
            haizi.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

        Wrapper<HaiziEntity> queryWrapper = new EntityWrapper<HaiziEntity>()
            .eq("yonghu_id", haizi.getYonghuId())
            .eq("haizi_name", haizi.getHaiziName())
            .eq("haizi_id_number", haizi.getHaiziIdNumber())
            .eq("sex_types", haizi.getSexTypes())
            .eq("haizi_nianling", haizi.getHaiziNianling())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        HaiziEntity haiziEntity = haiziService.selectOne(queryWrapper);
        if(haiziEntity==null){
            haizi.setCreateTime(new Date());
            haiziService.insert(haizi);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody HaiziEntity haizi, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,haizi:{}",this.getClass().getName(),haizi.toString());
        HaiziEntity oldHaiziEntity = haiziService.selectById(haizi.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
//        else if("用户".equals(role))
//            haizi.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));
        if("".equals(haizi.getHaiziPhoto()) || "null".equals(haizi.getHaiziPhoto())){
                haizi.setHaiziPhoto(null);
        }

            haiziService.updateById(haizi);//根据id更新
            return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<HaiziEntity> oldHaiziList =haiziService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        haiziService.deleteBatchIds(Arrays.asList(ids));

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
            List<HaiziEntity> haiziList = new ArrayList<>();//上传的东西
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
                            HaiziEntity haiziEntity = new HaiziEntity();
//                            haiziEntity.setYonghuId(Integer.valueOf(data.get(0)));   //用户 要改的
//                            haiziEntity.setHaiziName(data.get(0));                    //孩子姓名 要改的
//                            haiziEntity.setHaiziIdNumber(data.get(0));                    //孩子身份证号 要改的
//                            haiziEntity.setHaiziPhoto("");//详情和图片
//                            haiziEntity.setSexTypes(Integer.valueOf(data.get(0)));   //性别 要改的
//                            haiziEntity.setHaiziNianling(Integer.valueOf(data.get(0)));   //年龄 要改的
//                            haiziEntity.setCreateTime(date);//时间
                            haiziList.add(haiziEntity);


                            //把要查询是否重复的字段放入map中
                                //孩子身份证号
                                if(seachFields.containsKey("haiziIdNumber")){
                                    List<String> haiziIdNumber = seachFields.get("haiziIdNumber");
                                    haiziIdNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> haiziIdNumber = new ArrayList<>();
                                    haiziIdNumber.add(data.get(0));//要改的
                                    seachFields.put("haiziIdNumber",haiziIdNumber);
                                }
                        }

                        //查询是否重复
                         //孩子身份证号
                        List<HaiziEntity> haiziEntities_haiziIdNumber = haiziService.selectList(new EntityWrapper<HaiziEntity>().in("haizi_id_number", seachFields.get("haiziIdNumber")));
                        if(haiziEntities_haiziIdNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(HaiziEntity s:haiziEntities_haiziIdNumber){
                                repeatFields.add(s.getHaiziIdNumber());
                            }
                            return R.error(511,"数据库的该表中的 [孩子身份证号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        haiziService.insertBatch(haiziList);
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
        PageUtils page = haiziService.queryPage(params);

        //字典表数据转换
        List<HaiziView> list =(List<HaiziView>)page.getList();
        for(HaiziView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        HaiziEntity haizi = haiziService.selectById(id);
            if(haizi !=null){


                //entity转view
                HaiziView view = new HaiziView();
                BeanUtils.copyProperties( haizi , view );//把实体数据重构到view中

                //级联表
                    YonghuEntity yonghu = yonghuService.selectById(haizi.getYonghuId());
                if(yonghu != null){
                    BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYonghuId(yonghu.getId());
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
    public R add(@RequestBody HaiziEntity haizi, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,haizi:{}",this.getClass().getName(),haizi.toString());
        Wrapper<HaiziEntity> queryWrapper = new EntityWrapper<HaiziEntity>()
            .eq("yonghu_id", haizi.getYonghuId())
            .eq("haizi_name", haizi.getHaiziName())
            .eq("haizi_id_number", haizi.getHaiziIdNumber())
            .eq("sex_types", haizi.getSexTypes())
            .eq("haizi_nianling", haizi.getHaiziNianling())
//            .notIn("haizi_types", new Integer[]{102})
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        HaiziEntity haiziEntity = haiziService.selectOne(queryWrapper);
        if(haiziEntity==null){
            haizi.setCreateTime(new Date());
        haiziService.insert(haizi);

            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

}

