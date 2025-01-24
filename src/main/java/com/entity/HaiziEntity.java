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
 * 孩子信息
 *
 * @author 
 * @email
 */
@TableName("haizi")
public class HaiziEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public HaiziEntity() {

	}

	public HaiziEntity(T t) {
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
     * 用户
     */
    @ColumnInfo(comment="用户",type="int(11)")
    @TableField(value = "yonghu_id")

    private Integer yonghuId;


    /**
     * 孩子姓名
     */
    @ColumnInfo(comment="孩子姓名",type="varchar(200)")
    @TableField(value = "haizi_name")

    private String haiziName;


    /**
     * 孩子身份证号
     */
    @ColumnInfo(comment="孩子身份证号",type="varchar(200)")
    @TableField(value = "haizi_id_number")

    private String haiziIdNumber;


    /**
     * 孩子头像
     */
    @ColumnInfo(comment="孩子头像",type="varchar(200)")
    @TableField(value = "haizi_photo")

    private String haiziPhoto;


    /**
     * 性别
     */
    @ColumnInfo(comment="性别",type="int(11)")
    @TableField(value = "sex_types")

    private Integer sexTypes;


    /**
     * 年龄
     */
    @ColumnInfo(comment="年龄",type="int(11)")
    @TableField(value = "haizi_nianling")

    private Integer haiziNianling;


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
	 * 获取：孩子姓名
	 */
    public String getHaiziName() {
        return haiziName;
    }
    /**
	 * 设置：孩子姓名
	 */

    public void setHaiziName(String haiziName) {
        this.haiziName = haiziName;
    }
    /**
	 * 获取：孩子身份证号
	 */
    public String getHaiziIdNumber() {
        return haiziIdNumber;
    }
    /**
	 * 设置：孩子身份证号
	 */

    public void setHaiziIdNumber(String haiziIdNumber) {
        this.haiziIdNumber = haiziIdNumber;
    }
    /**
	 * 获取：孩子头像
	 */
    public String getHaiziPhoto() {
        return haiziPhoto;
    }
    /**
	 * 设置：孩子头像
	 */

    public void setHaiziPhoto(String haiziPhoto) {
        this.haiziPhoto = haiziPhoto;
    }
    /**
	 * 获取：性别
	 */
    public Integer getSexTypes() {
        return sexTypes;
    }
    /**
	 * 设置：性别
	 */

    public void setSexTypes(Integer sexTypes) {
        this.sexTypes = sexTypes;
    }
    /**
	 * 获取：年龄
	 */
    public Integer getHaiziNianling() {
        return haiziNianling;
    }
    /**
	 * 设置：年龄
	 */

    public void setHaiziNianling(Integer haiziNianling) {
        this.haiziNianling = haiziNianling;
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
        return "Haizi{" +
            ", id=" + id +
            ", yonghuId=" + yonghuId +
            ", haiziName=" + haiziName +
            ", haiziIdNumber=" + haiziIdNumber +
            ", haiziPhoto=" + haiziPhoto +
            ", sexTypes=" + sexTypes +
            ", haiziNianling=" + haiziNianling +
            ", createTime=" + DateUtil.convertString(createTime,"yyyy-MM-dd") +
        "}";
    }
}
