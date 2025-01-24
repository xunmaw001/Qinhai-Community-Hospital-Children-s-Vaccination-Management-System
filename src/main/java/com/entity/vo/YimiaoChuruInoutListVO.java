package com.entity.vo;

import com.entity.YimiaoChuruInoutListEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 出入库详情
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("yimiao_churu_inout_list")
public class YimiaoChuruInoutListVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 出入库
     */

    @TableField(value = "yimiao_churu_inout_id")
    private Integer yimiaoChuruInoutId;


    /**
     * 商品
     */

    @TableField(value = "yimiao_id")
    private Integer yimiaoId;


    /**
     * 操作数量
     */

    @TableField(value = "yimiao_churu_inout_list_number")
    private Integer yimiaoChuruInoutListNumber;


    /**
     * 操作时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "insert_time")
    private Date insertTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：出入库
	 */
    public Integer getYimiaoChuruInoutId() {
        return yimiaoChuruInoutId;
    }


    /**
	 * 获取：出入库
	 */

    public void setYimiaoChuruInoutId(Integer yimiaoChuruInoutId) {
        this.yimiaoChuruInoutId = yimiaoChuruInoutId;
    }
    /**
	 * 设置：商品
	 */
    public Integer getYimiaoId() {
        return yimiaoId;
    }


    /**
	 * 获取：商品
	 */

    public void setYimiaoId(Integer yimiaoId) {
        this.yimiaoId = yimiaoId;
    }
    /**
	 * 设置：操作数量
	 */
    public Integer getYimiaoChuruInoutListNumber() {
        return yimiaoChuruInoutListNumber;
    }


    /**
	 * 获取：操作数量
	 */

    public void setYimiaoChuruInoutListNumber(Integer yimiaoChuruInoutListNumber) {
        this.yimiaoChuruInoutListNumber = yimiaoChuruInoutListNumber;
    }
    /**
	 * 设置：操作时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：操作时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
