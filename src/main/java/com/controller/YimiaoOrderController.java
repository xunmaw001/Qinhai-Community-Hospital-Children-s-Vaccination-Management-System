
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
 * 疫苗预约
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/yimiaoOrder")
public class YimiaoOrderController {
    private static final Logger logger = LoggerFactory.getLogger(YimiaoOrderController.class);

    private static final String TABLE_NAME = "yimiaoOrder";

    @Autowired
    private YimiaoOrderService yimiaoOrderService;


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
    private YimiaoChuruInoutListService yimiaoChuruInoutListService;//出入库详情
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
        PageUtils page = yimiaoOrderService.queryPage(params);

        //字典表数据转换
        List<YimiaoOrderView> list =(List<YimiaoOrderView>)page.getList();
        for(YimiaoOrderView c:list){
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
        YimiaoOrderEntity yimiaoOrder = yimiaoOrderService.selectById(id);
        if(yimiaoOrder !=null){
            //entity转view
            YimiaoOrderView view = new YimiaoOrderView();
            BeanUtils.copyProperties( yimiaoOrder , view );//把实体数据重构到view中
            //级联表 疫苗
            //级联表
            YimiaoEntity yimiao = yimiaoService.selectById(yimiaoOrder.getYimiaoId());
            if(yimiao != null){
            BeanUtils.copyProperties( yimiao , view ,new String[]{ "id", "createTime", "insertTime", "updateTime", "yonghuId"});//把级联的数据添加到view中,并排除id和创建时间字段,当前表的级联注册表
            view.setYimiaoId(yimiao.getId());
            }
            //级联表 用户
            //级联表
            YonghuEntity yonghu = yonghuService.selectById(yimiaoOrder.getYonghuId());
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
    public R save(@RequestBody YimiaoOrderEntity yimiaoOrder, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,yimiaoOrder:{}",this.getClass().getName(),yimiaoOrder.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");
        else if("用户".equals(role))
            yimiaoOrder.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

        yimiaoOrder.setCreateTime(new Date());
        yimiaoOrder.setInsertTime(new Date());
        yimiaoOrderService.insert(yimiaoOrder);

        return R.ok();
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody YimiaoOrderEntity yimiaoOrder, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,yimiaoOrder:{}",this.getClass().getName(),yimiaoOrder.toString());
        YimiaoOrderEntity oldYimiaoOrderEntity = yimiaoOrderService.selectById(yimiaoOrder.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
//        else if("用户".equals(role))
//            yimiaoOrder.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

            yimiaoOrderService.updateById(yimiaoOrder);//根据id更新
            return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<YimiaoOrderEntity> oldYimiaoOrderList =yimiaoOrderService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        yimiaoOrderService.deleteBatchIds(Arrays.asList(ids));

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
            List<YimiaoOrderEntity> yimiaoOrderList = new ArrayList<>();//上传的东西
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
                            YimiaoOrderEntity yimiaoOrderEntity = new YimiaoOrderEntity();
//                            yimiaoOrderEntity.setYimiaoOrderUuidNumber(data.get(0));                    //订单编号 要改的
//                            yimiaoOrderEntity.setYimiaoId(Integer.valueOf(data.get(0)));   //疫苗 要改的
//                            yimiaoOrderEntity.setYonghuId(Integer.valueOf(data.get(0)));   //用户 要改的
//                            yimiaoOrderEntity.setBuyNumber(Integer.valueOf(data.get(0)));   //人数 要改的
//                            yimiaoOrderEntity.setYimiaoOrderTruePrice(data.get(0));                    //实付价格 要改的
//                            yimiaoOrderEntity.setYimiaoOrderTime(sdf.parse(data.get(0)));          //预约时间 要改的
//                            yimiaoOrderEntity.setYimiaoOrderTypes(Integer.valueOf(data.get(0)));   //订单类型 要改的
//                            yimiaoOrderEntity.setInsertTime(date);//时间
//                            yimiaoOrderEntity.setCreateTime(date);//时间
                            yimiaoOrderList.add(yimiaoOrderEntity);


                            //把要查询是否重复的字段放入map中
                                //订单编号
                                if(seachFields.containsKey("yimiaoOrderUuidNumber")){
                                    List<String> yimiaoOrderUuidNumber = seachFields.get("yimiaoOrderUuidNumber");
                                    yimiaoOrderUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> yimiaoOrderUuidNumber = new ArrayList<>();
                                    yimiaoOrderUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("yimiaoOrderUuidNumber",yimiaoOrderUuidNumber);
                                }
                        }

                        //查询是否重复
                         //订单编号
                        List<YimiaoOrderEntity> yimiaoOrderEntities_yimiaoOrderUuidNumber = yimiaoOrderService.selectList(new EntityWrapper<YimiaoOrderEntity>().in("yimiao_order_uuid_number", seachFields.get("yimiaoOrderUuidNumber")));
                        if(yimiaoOrderEntities_yimiaoOrderUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(YimiaoOrderEntity s:yimiaoOrderEntities_yimiaoOrderUuidNumber){
                                repeatFields.add(s.getYimiaoOrderUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [订单编号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        yimiaoOrderService.insertBatch(yimiaoOrderList);
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
        PageUtils page = yimiaoOrderService.queryPage(params);

        //字典表数据转换
        List<YimiaoOrderView> list =(List<YimiaoOrderView>)page.getList();
        for(YimiaoOrderView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        YimiaoOrderEntity yimiaoOrder = yimiaoOrderService.selectById(id);
            if(yimiaoOrder !=null){


                //entity转view
                YimiaoOrderView view = new YimiaoOrderView();
                BeanUtils.copyProperties( yimiaoOrder , view );//把实体数据重构到view中

                //级联表
                    YimiaoEntity yimiao = yimiaoService.selectById(yimiaoOrder.getYimiaoId());
                if(yimiao != null){
                    BeanUtils.copyProperties( yimiao , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYimiaoId(yimiao.getId());
                }
                //级联表
                    YonghuEntity yonghu = yonghuService.selectById(yimiaoOrder.getYonghuId());
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
    public R add(@RequestBody YimiaoOrderEntity yimiaoOrder, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,yimiaoOrder:{}",this.getClass().getName(),yimiaoOrder.toString());
            YimiaoEntity yimiaoEntity = yimiaoService.selectById(yimiaoOrder.getYimiaoId());
            if(yimiaoEntity == null){
                return R.error(511,"查不到该疫苗");
            }
            // Double yimiaoNewMoney = yimiaoEntity.getYimiaoNewMoney();

            if(false){
            }
            else if(yimiaoEntity.getYimiaoNewMoney() == null){
                return R.error(511,"金额不能为空");
            }
            else if((yimiaoEntity.getYimiaoKucunNumber() -yimiaoOrder.getBuyNumber())<0){
                return R.error(511,"购买数量不能大于库存数量");
            }

            //计算所获得积分
            Double buyJifen =0.0;
            Integer userId = (Integer) request.getSession().getAttribute("userId");
            YonghuEntity yonghuEntity = yonghuService.selectById(userId);
            if(yonghuEntity == null)
                return R.error(511,"用户不能为空");
            if(yonghuEntity.getNewMoney() == null)
                return R.error(511,"用户金额不能为空");
            double balance = yonghuEntity.getNewMoney() - yimiaoEntity.getYimiaoNewMoney()*yimiaoOrder.getBuyNumber();//余额
            if(balance<0)
                return R.error(511,"余额不够支付");
            yimiaoOrder.setYimiaoOrderTypes(101); //设置订单状态为已预约
            yimiaoOrder.setYimiaoOrderTruePrice(yimiaoEntity.getYimiaoNewMoney()*yimiaoOrder.getBuyNumber()); //设置实付价格
            yimiaoOrder.setYonghuId(userId); //设置订单支付人id
            yimiaoOrder.setYimiaoOrderUuidNumber(String.valueOf(new Date().getTime()));
            yimiaoOrder.setInsertTime(new Date());
            yimiaoOrder.setCreateTime(new Date());
                yimiaoEntity.setYimiaoKucunNumber( yimiaoEntity.getYimiaoKucunNumber() -yimiaoOrder.getBuyNumber());
                yimiaoService.updateById(yimiaoEntity);
                yimiaoOrderService.insert(yimiaoOrder);//新增订单
            //更新第一注册表
            yonghuEntity.setNewMoney(balance);//设置金额
            yonghuService.updateById(yonghuEntity);


            return R.ok();
    }


    /**
    * 取消
    */
    @RequestMapping("/refund")
    public R refund(Integer id, HttpServletRequest request){
        logger.debug("refund方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        String role = String.valueOf(request.getSession().getAttribute("role"));

            YimiaoOrderEntity yimiaoOrder = yimiaoOrderService.selectById(id);//当前表service
            Integer buyNumber = yimiaoOrder.getBuyNumber();
            Integer yimiaoId = yimiaoOrder.getYimiaoId();
            if(yimiaoId == null)
                return R.error(511,"查不到该疫苗");
            YimiaoEntity yimiaoEntity = yimiaoService.selectById(yimiaoId);
            if(yimiaoEntity == null)
                return R.error(511,"查不到该疫苗");
            Double yimiaoNewMoney = yimiaoEntity.getYimiaoNewMoney();
            if(yimiaoNewMoney == null)
                return R.error(511,"疫苗价格不能为空");

            Integer userId = (Integer) request.getSession().getAttribute("userId");
            YonghuEntity yonghuEntity = yonghuService.selectById(userId);
            if(yonghuEntity == null)
                return R.error(511,"用户不能为空");
            if(yonghuEntity.getNewMoney() == null)
            return R.error(511,"用户金额不能为空");
            Double zhekou = 1.0;

                //计算金额
                Double money = yimiaoEntity.getYimiaoNewMoney() * buyNumber  * zhekou;
                //计算所获得积分
                Double buyJifen = 0.0;
                yonghuEntity.setNewMoney(yonghuEntity.getNewMoney() + money); //设置金额



            yimiaoEntity.setYimiaoKucunNumber(yimiaoEntity.getYimiaoKucunNumber() + buyNumber);

            yimiaoOrder.setYimiaoOrderTypes(102);//设置订单状态为已取消
            yimiaoOrderService.updateAllColumnById(yimiaoOrder);//根据id更新
            yonghuService.updateById(yonghuEntity);//更新用户信息
            yimiaoService.updateById(yimiaoEntity);//更新订单中疫苗的信息

            return R.ok();
    }

    /**
     * 同意
     */
    @RequestMapping("/deliver")
    public R deliver(Integer id  , HttpServletRequest request){
        logger.debug("refund:,,Controller:{},,ids:{}",this.getClass().getName(),id.toString());
        YimiaoOrderEntity  yimiaoOrderEntity = yimiaoOrderService.selectById(id);
        yimiaoOrderEntity.setYimiaoOrderTypes(103);//设置订单状态为已同意
        yimiaoOrderService.updateById( yimiaoOrderEntity);

        return R.ok();
    }


    /**
     * 接种
     */
    @RequestMapping("/receiving")
    public R receiving(Integer id , HttpServletRequest request){
        logger.debug("refund:,,Controller:{},,ids:{}",this.getClass().getName(),id.toString());
        YimiaoOrderEntity  yimiaoOrderEntity = yimiaoOrderService.selectById(id);
        yimiaoOrderEntity.setYimiaoOrderTypes(104);//设置订单状态为接种
        yimiaoOrderService.updateById( yimiaoOrderEntity);
        return R.ok();
    }

}

