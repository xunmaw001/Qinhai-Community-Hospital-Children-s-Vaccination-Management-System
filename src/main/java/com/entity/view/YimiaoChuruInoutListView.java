package com.entity.view;

import org.apache.tools.ant.util.DateUtils;
import com.annotation.ColumnInfo;
import com.entity.YimiaoChuruInoutListEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;
import com.utils.DateUtil;

/**
* 出入库详情
* 后端返回视图实体辅助类
* （通常后端关联的表或者自定义的字段需要返回使用）
*/
@TableName("yimiao_churu_inout_list")
public class YimiaoChuruInoutListView extends YimiaoChuruInoutListEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	//当前表

	//级联表 疫苗
							/**
		* 疫苗名称
		*/

		@ColumnInfo(comment="疫苗名称",type="varchar(200)")
		private String yimiaoName;
		/**
		* 疫苗编号
		*/

		@ColumnInfo(comment="疫苗编号",type="varchar(200)")
		private String yimiaoUuidNumber;
		/**
		* 疫苗照片
		*/

		@ColumnInfo(comment="疫苗照片",type="varchar(200)")
		private String yimiaoPhoto;
		/**
		* 疫苗接种地点
		*/

		@ColumnInfo(comment="疫苗接种地点",type="varchar(200)")
		private String yimiaoAddress;
		/**
		* 接种人数
		*/

		@ColumnInfo(comment="接种人数",type="int(11)")
		private Integer yimiaoKucunNumber;
		/**
		* 金额
		*/
		@ColumnInfo(comment="金额",type="decimal(10,2)")
		private Double yimiaoNewMoney;
		/**
		* 疫苗类型
		*/
		@ColumnInfo(comment="疫苗类型",type="int(11)")
		private Integer yimiaoTypes;
			/**
			* 疫苗类型的值
			*/
			@ColumnInfo(comment="疫苗类型的字典表值",type="varchar(200)")
			private String yimiaoValue;
		/**
		* 疫苗介绍
		*/

		@ColumnInfo(comment="疫苗介绍",type="longtext")
		private String yimiaoContent;
		/**
		* 逻辑删除
		*/

		@ColumnInfo(comment="逻辑删除",type="int(11)")
		private Integer yimiaoDelete;
	//级联表 出入库
		/**
		* 出入库流水号
		*/

		@ColumnInfo(comment="出入库流水号",type="varchar(200)")
		private String yimiaoChuruInoutUuidNumber;
		/**
		* 出入库名称
		*/

		@ColumnInfo(comment="出入库名称",type="varchar(200)")
		private String yimiaoChuruInoutName;
		/**
		* 出入库类型
		*/
		@ColumnInfo(comment="出入库类型",type="int(11)")
		private Integer yimiaoChuruInoutTypes;
			/**
			* 出入库类型的值
			*/
			@ColumnInfo(comment="出入库类型的字典表值",type="varchar(200)")
			private String yimiaoChuruInoutValue;
		/**
		* 备注
		*/

		@ColumnInfo(comment="备注",type="longtext")
		private String yimiaoChuruInoutContent;



	public YimiaoChuruInoutListView() {

	}

	public YimiaoChuruInoutListView(YimiaoChuruInoutListEntity yimiaoChuruInoutListEntity) {
		try {
			BeanUtils.copyProperties(this, yimiaoChuruInoutListEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}





	//级联表的get和set 疫苗

		/**
		* 获取： 疫苗名称
		*/
		public String getYimiaoName() {
			return yimiaoName;
		}
		/**
		* 设置： 疫苗名称
		*/
		public void setYimiaoName(String yimiaoName) {
			this.yimiaoName = yimiaoName;
		}

		/**
		* 获取： 疫苗编号
		*/
		public String getYimiaoUuidNumber() {
			return yimiaoUuidNumber;
		}
		/**
		* 设置： 疫苗编号
		*/
		public void setYimiaoUuidNumber(String yimiaoUuidNumber) {
			this.yimiaoUuidNumber = yimiaoUuidNumber;
		}

		/**
		* 获取： 疫苗照片
		*/
		public String getYimiaoPhoto() {
			return yimiaoPhoto;
		}
		/**
		* 设置： 疫苗照片
		*/
		public void setYimiaoPhoto(String yimiaoPhoto) {
			this.yimiaoPhoto = yimiaoPhoto;
		}

		/**
		* 获取： 疫苗接种地点
		*/
		public String getYimiaoAddress() {
			return yimiaoAddress;
		}
		/**
		* 设置： 疫苗接种地点
		*/
		public void setYimiaoAddress(String yimiaoAddress) {
			this.yimiaoAddress = yimiaoAddress;
		}

		/**
		* 获取： 接种人数
		*/
		public Integer getYimiaoKucunNumber() {
			return yimiaoKucunNumber;
		}
		/**
		* 设置： 接种人数
		*/
		public void setYimiaoKucunNumber(Integer yimiaoKucunNumber) {
			this.yimiaoKucunNumber = yimiaoKucunNumber;
		}

		/**
		* 获取： 金额
		*/
		public Double getYimiaoNewMoney() {
			return yimiaoNewMoney;
		}
		/**
		* 设置： 金额
		*/
		public void setYimiaoNewMoney(Double yimiaoNewMoney) {
			this.yimiaoNewMoney = yimiaoNewMoney;
		}
		/**
		* 获取： 疫苗类型
		*/
		public Integer getYimiaoTypes() {
			return yimiaoTypes;
		}
		/**
		* 设置： 疫苗类型
		*/
		public void setYimiaoTypes(Integer yimiaoTypes) {
			this.yimiaoTypes = yimiaoTypes;
		}


			/**
			* 获取： 疫苗类型的值
			*/
			public String getYimiaoValue() {
				return yimiaoValue;
			}
			/**
			* 设置： 疫苗类型的值
			*/
			public void setYimiaoValue(String yimiaoValue) {
				this.yimiaoValue = yimiaoValue;
			}

		/**
		* 获取： 疫苗介绍
		*/
		public String getYimiaoContent() {
			return yimiaoContent;
		}
		/**
		* 设置： 疫苗介绍
		*/
		public void setYimiaoContent(String yimiaoContent) {
			this.yimiaoContent = yimiaoContent;
		}

		/**
		* 获取： 逻辑删除
		*/
		public Integer getYimiaoDelete() {
			return yimiaoDelete;
		}
		/**
		* 设置： 逻辑删除
		*/
		public void setYimiaoDelete(Integer yimiaoDelete) {
			this.yimiaoDelete = yimiaoDelete;
		}
	//级联表的get和set 出入库

		/**
		* 获取： 出入库流水号
		*/
		public String getYimiaoChuruInoutUuidNumber() {
			return yimiaoChuruInoutUuidNumber;
		}
		/**
		* 设置： 出入库流水号
		*/
		public void setYimiaoChuruInoutUuidNumber(String yimiaoChuruInoutUuidNumber) {
			this.yimiaoChuruInoutUuidNumber = yimiaoChuruInoutUuidNumber;
		}

		/**
		* 获取： 出入库名称
		*/
		public String getYimiaoChuruInoutName() {
			return yimiaoChuruInoutName;
		}
		/**
		* 设置： 出入库名称
		*/
		public void setYimiaoChuruInoutName(String yimiaoChuruInoutName) {
			this.yimiaoChuruInoutName = yimiaoChuruInoutName;
		}
		/**
		* 获取： 出入库类型
		*/
		public Integer getYimiaoChuruInoutTypes() {
			return yimiaoChuruInoutTypes;
		}
		/**
		* 设置： 出入库类型
		*/
		public void setYimiaoChuruInoutTypes(Integer yimiaoChuruInoutTypes) {
			this.yimiaoChuruInoutTypes = yimiaoChuruInoutTypes;
		}


			/**
			* 获取： 出入库类型的值
			*/
			public String getYimiaoChuruInoutValue() {
				return yimiaoChuruInoutValue;
			}
			/**
			* 设置： 出入库类型的值
			*/
			public void setYimiaoChuruInoutValue(String yimiaoChuruInoutValue) {
				this.yimiaoChuruInoutValue = yimiaoChuruInoutValue;
			}

		/**
		* 获取： 备注
		*/
		public String getYimiaoChuruInoutContent() {
			return yimiaoChuruInoutContent;
		}
		/**
		* 设置： 备注
		*/
		public void setYimiaoChuruInoutContent(String yimiaoChuruInoutContent) {
			this.yimiaoChuruInoutContent = yimiaoChuruInoutContent;
		}


	@Override
	public String toString() {
		return "YimiaoChuruInoutListView{" +
			", yimiaoChuruInoutUuidNumber=" + yimiaoChuruInoutUuidNumber +
			", yimiaoChuruInoutName=" + yimiaoChuruInoutName +
			", yimiaoChuruInoutContent=" + yimiaoChuruInoutContent +
			", yimiaoName=" + yimiaoName +
			", yimiaoUuidNumber=" + yimiaoUuidNumber +
			", yimiaoPhoto=" + yimiaoPhoto +
			", yimiaoAddress=" + yimiaoAddress +
			", yimiaoKucunNumber=" + yimiaoKucunNumber +
			", yimiaoNewMoney=" + yimiaoNewMoney +
			", yimiaoContent=" + yimiaoContent +
			", yimiaoDelete=" + yimiaoDelete +
			"} " + super.toString();
	}
}
