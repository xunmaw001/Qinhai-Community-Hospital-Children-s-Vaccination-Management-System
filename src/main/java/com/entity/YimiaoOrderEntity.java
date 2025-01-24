package com.entity;

import com.annotation.ColumnInfo;
import javax.validation.constraints.*;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;
import java.io.Serializable;
import java.util.*;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.utils.DateUtil;


/**
 * 疫苗预约
 *
 * @author 
 * @email
 */
@TableName("yimiao_order")
public class YimiaoOrderEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public YimiaoOrderEntity() {

	}

	public YimiaoOrderEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @ColumnInfo(comment="主键",type="int(11)")
    @TableField(value = "id")

    private Integer id;


    /**
     * 订单编号
     */
    @ColumnInfo(comment="订单编号",type="varchar(200)")
    @TableField(value = "yimiao_order_uuid_number")

    private String yimiaoOrderUuidNumber;


    /**
     * 疫苗
     */
    @ColumnInfo(comment="疫苗",type="int(11)")
    @TableField(value = "yimiao_id")

    private Integer yimiaoId;


    /**
     * 用户
     */
    @ColumnInfo(comment="用户",type="int(11)")
    @TableField(value = "yonghu_id")

    private Integer yonghuId;


    /**
     * 人数
     */
    @ColumnInfo(comment="人数",type="int(11)")
    @TableField(value = "buy_number")

    private Integer buyNumber;


    /**
     * 实付价格
     */
    @ColumnInfo(comment="实付价格",type="decimal(10,2)")
    @TableField(value = "yimiao_order_true_price")

    private Double yimiaoOrderTruePrice;


    /**
     * 预约时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @ColumnInfo(comment="预约时间",type="timestamp")
    @TableField(value = "yimiao_order_time")

    private Date yimiaoOrderTime;


    /**
     * 订单类型
     */
    @ColumnInfo(comment="订单类型",type="int(11)")
    @TableField(value = "yimiao_order_types")

    private Integer yimiaoOrderTypes;


    /**
     * 订单创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @ColumnInfo(comment="订单创建时间",type="timestamp")
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


    /**
     * 创建时间  listShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @ColumnInfo(comment="创建时间",type="timestamp")
    @TableField(value = "create_time",fill = FieldFill.INSERT)

    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }
    /**
	 * 设置：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：订单编号
	 */
    public String getYimiaoOrderUuidNumber() {
        return yimiaoOrderUuidNumber;
    }
    /**
	 * 设置：订单编号
	 */

    public void setYimiaoOrderUuidNumber(String yimiaoOrderUuidNumber) {
        this.yimiaoOrderUuidNumber = yimiaoOrderUuidNumber;
    }
    /**
	 * 获取：疫苗
	 */
    public Integer getYimiaoId() {
        return yimiaoId;
    }
    /**
	 * 设置：疫苗
	 */

    public void setYimiaoId(Integer yimiaoId) {
        this.yimiaoId = yimiaoId;
    }
    /**
	 * 获取：用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }
    /**
	 * 设置：用户
	 */

    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 获取：人数
	 */
    public Integer getBuyNumber() {
        return buyNumber;
    }
    /**
	 * 设置：人数
	 */

    public void setBuyNumber(Integer buyNumber) {
        this.buyNumber = buyNumber;
    }
    /**
	 * 获取：实付价格
	 */
    public Double getYimiaoOrderTruePrice() {
        return yimiaoOrderTruePrice;
    }
    /**
	 * 设置：实付价格
	 */

    public void setYimiaoOrderTruePrice(Double yimiaoOrderTruePrice) {
        this.yimiaoOrderTruePrice = yimiaoOrderTruePrice;
    }
    /**
	 * 获取：预约时间
	 */
    public Date getYimiaoOrderTime() {
        return yimiaoOrderTime;
    }
    /**
	 * 设置：预约时间
	 */

    public void setYimiaoOrderTime(Date yimiaoOrderTime) {
        this.yimiaoOrderTime = yimiaoOrderTime;
    }
    /**
	 * 获取：订单类型
	 */
    public Integer getYimiaoOrderTypes() {
        return yimiaoOrderTypes;
    }
    /**
	 * 设置：订单类型
	 */

    public void setYimiaoOrderTypes(Integer yimiaoOrderTypes) {
        this.yimiaoOrderTypes = yimiaoOrderTypes;
    }
    /**
	 * 获取：订单创建时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }
    /**
	 * 设置：订单创建时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：创建时间  listShow
	 */
    public Date getCreateTime() {
        return createTime;
    }
    /**
	 * 设置：创建时间  listShow
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "YimiaoOrder{" +
            ", id=" + id +
            ", yimiaoOrderUuidNumber=" + yimiaoOrderUuidNumber +
            ", yimiaoId=" + yimiaoId +
            ", yonghuId=" + yonghuId +
            ", buyNumber=" + buyNumber +
            ", yimiaoOrderTruePrice=" + yimiaoOrderTruePrice +
            ", yimiaoOrderTime=" + DateUtil.convertString(yimiaoOrderTime,"yyyy-MM-dd") +
            ", yimiaoOrderTypes=" + yimiaoOrderTypes +
            ", insertTime=" + DateUtil.convertString(insertTime,"yyyy-MM-dd") +
            ", createTime=" + DateUtil.convertString(createTime,"yyyy-MM-dd") +
        "}";
    }
}
