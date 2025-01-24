	/**
 	* 获取年
	*/
	function getYearFormat(currentTime) {
		if(currentTime==null){
			currentTime = new Date();
		}
	    var year = currentTime.getFullYear();
	    return year;
	}

	/**
	 * 获取月
	 */
	function getMonthFormat(currentTime) {
		if(currentTime==null){
			currentTime = new Date();
		}
		var year = currentTime.getFullYear();
		var month = currentTime.getMonth() + 1 < 10 ? '0' + (currentTime.getMonth() + 1) : currentTime.getMonth() + 1;
		return year + "-" + month;
	}


	/**
	 * 获取日
	 */
	function getDateFormat(currentTime) {
		if(currentTime==null){
			currentTime = new Date();
		}
		var year = currentTime.getFullYear();
		var month = currentTime.getMonth() + 1 < 10 ? '0' + (currentTime.getMonth() + 1) : currentTime.getMonth() + 1;
		var day = currentTime.getDate() < 10 ? '0' + currentTime.getDate() : currentTime.getDate();
		return year + "-" + month + "-" + day;
	}

	/**
	 * 获取年月日时分秒
	 */
	function getDatetimeFormat(currentTime) {
		if(currentTime==null){
			currentTime = new Date();
		}
		var year = currentTime.getFullYear();
		var month = currentTime.getMonth() + 1 < 10 ? '0' + (currentTime.getMonth() + 1) : currentTime.getMonth() + 1;
		var day = currentTime.getDate() < 10 ? '0' + currentTime.getDate() : currentTime.getDate();
		var hour = currentTime.getHours();
		var minute = currentTime.getMinutes();
		var second = currentTime.getSeconds();
		return year + "-" + month + "-" + day + " " +hour +":" +minute+":"+second;
	}


	// 整数检查
	function integerChickValue(e){
		var this_val = e.value || 0;
		var reg=/^[0-9]*$/;
		if(!reg.test(this_val)){
			e.value = "";
			layui.layer.msg("只能输入正整数", {time: 2000,icon: 5});
			return false;
		}
	}
	// 小数
	function doubleChickValue(e){
		var this_val = e.value || 0;
		var reg=/^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/;
		if(!reg.test(this_val)){
			e.value = "";
			layui.layer.msg("只允许输入整数6位,小数2位的数字", {time: 2000,icon: 5});
			return false;
		}
	}
	//  手机号
	function phoneChickValue(e){
		var this_val = e.value || 0;
		var reg=/^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;
		if(!reg.test(this_val)){
			e.value = "";
			layui.layer.msg("手机号不正确", {time: 2000,icon: 5});
			return false;
		}
	}
	//  身份证号
	function idNumberChickValue(e){
		var this_val = e.value || 0;
		var reg=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
		if(!reg.test(this_val)){
			e.value = "";
			layui.layer.msg("身份证号不正确", {time: 2000,icon: 5});
			return false;
		}
	}


