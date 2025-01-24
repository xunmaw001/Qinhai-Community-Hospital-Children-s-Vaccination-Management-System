package com.entity.vo;

import com.entity.HaiziEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 孩子信息
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("haizi")
public class HaiziVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 用户
     */

    @TableField(value = "yonghu_id")
    private Integer yonghuId;


    /**
     * 孩子姓名
     */

    @TableField(value = "haizi_name")
    private String haiziName;


    /**
     * 孩子身份证号
     */

    @TableField(value = "haizi_id_number")
    private String haiziIdNumber;


    /**
     * 孩子头像
     */

    @TableField(value = "haizi_photo")
    private String haiziPhoto;


    /**
     * 性别
     */

    @TableField(value = "sex_types")
    private Integer sexTypes;


    /**
     * 年龄
     */

    @TableField(value = "haizi_nianling")
    private Integer haiziNianling;


    /**
     * 创建时间 show3 listShow
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
	 * 设置：用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 获取：用户
	 */

    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 设置：孩子姓名
	 */
    public String getHaiziName() {
        return haiziName;
    }


    /**
	 * 获取：孩子姓名
	 */

    public void setHaiziName(String haiziName) {
        this.haiziName = haiziName;
    }
    /**
	 * 设置：孩子身份证号
	 */
    public String getHaiziIdNumber() {
        return haiziIdNumber;
    }


    /**
	 * 获取：孩子身份证号
	 */

    public void setHaiziIdNumber(String haiziIdNumber) {
        this.haiziIdNumber = haiziIdNumber;
    }
    /**
	 * 设置：孩子头像
	 */
    public String getHaiziPhoto() {
        return haiziPhoto;
    }


    /**
	 * 获取：孩子头像
	 */

    public void setHaiziPhoto(String haiziPhoto) {
        this.haiziPhoto = haiziPhoto;
    }
    /**
	 * 设置：性别
	 */
    public Integer getSexTypes() {
        return sexTypes;
    }


    /**
	 * 获取：性别
	 */

    public void setSexTypes(Integer sexTypes) {
        this.sexTypes = sexTypes;
    }
    /**
	 * 设置：年龄
	 */
    public Integer getHaiziNianling() {
        return haiziNianling;
    }


    /**
	 * 获取：年龄
	 */

    public void setHaiziNianling(Integer haiziNianling) {
        this.haiziNianling = haiziNianling;
    }
    /**
	 * 设置：创建时间 show3 listShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间 show3 listShow
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
