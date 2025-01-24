package com.entity.model;

import com.entity.HaiziEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 孩子信息
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class HaiziModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 用户
     */
    private Integer yonghuId;


    /**
     * 孩子姓名
     */
    private String haiziName;


    /**
     * 孩子身份证号
     */
    private String haiziIdNumber;


    /**
     * 孩子头像
     */
    private String haiziPhoto;


    /**
     * 性别
     */
    private Integer sexTypes;


    /**
     * 年龄
     */
    private Integer haiziNianling;


    /**
     * 创建时间 show3 listShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
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
	 * 获取：创建时间 show3 listShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间 show3 listShow
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
