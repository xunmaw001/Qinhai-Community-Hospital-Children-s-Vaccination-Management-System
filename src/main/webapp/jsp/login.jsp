<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>登陆</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<%@ include file="static/head.jsp" %>
	<!-- Le styles -->
	<script src="${pageContext.request.contextPath}/resources/assets2/js/jquery.min.js" type="text/javascript"></script>

	<link href="${pageContext.request.contextPath}/jsp/static/style-color.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/assets2/css/loader-style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/assets2/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/assets2/css/signin.css" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<!-- Fav and touch icons -->
	<link href="${pageContext.request.contextPath}/resources/assets2/ico/minus.png" rel="shortcut icon">
</head>
<style>
	html {
		width: 100%;
		height: 100%;
	}
	body {
		background-image: url(/qhsqyyetyfjzglxt/img/back-img-bg.jpg) !important;
		height: 100vh;
		background-position: center center;
		background-size: cover;
		background-repeat: no-repeat;
		overflow: hidden !important;
		width: 100%;
		height: 100%;
	}
	.container {
		padding: 0;
		margin: 0;
		display: flex;
		height: 100%;
		width: 100%;
		justify-content: center;
		align-items: center;
	}

    #login-wrapper {
        display: flex;
        flex-direction: column;
        position: inherit;
        height: auto;
        width: 500px;
        margin: 0 60% 0 0;
        padding: 0 0 20px 0;
        border-radius: 30px 30px 0 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,.3);
        background-color: rgba(252, 251, 255, 1);
        box-shadow: 0 0 2px #c9c4c4;
    }
    #login-wrapper h1 {
        line-height: 60px;
        width: 100%;
        color: #fff;
        font-size: 16px;
        margin: 0 0 30px 0;
        padding: 0 10px;
        border-radius: 30px 30px 0 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,.3);
        background-color: var(--publicMainColor,orange);
        box-shadow: 0 0 6px rgba(30, 144, 255, 0);
        text-align: center;
    }

    #loginForm .form-group-l-r {
        display: flex;
        flex-wrap: wrap;
    }

    #loginForm .form-group {
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        height: auto;
        width: 50%;
        margin: 0 0 0 10%;
        padding: 0 0 10px 0;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,1);
        background-color: rgba(255, 255, 255, 0);
        box-shadow: 0 0 6px rgba(255,0,0,0);
    }

    #loginForm .form-group .label {
        width: 50px;
        line-height: 44px;
        margin: 0;
        color: rgba(3, 3, 3, 1);
        font-size: 16px;
        padding: 0;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,0);
        background-color: transparent;
        box-shadow: 0 0 0px rgba(255,0,0,0);
        text-align: left;
    }

    #loginForm .form-group .form-control-i {
        width: calc(100% - 60px);
        height: 40px;
        margin: 0;
        color: rgba(1, 1, 1, 1);
        font-size: 14px;
        padding: 0 10px;
        border-radius: 10px;
        border-width: 0;
        border-style: solid;
        border-color: #ccc;
        background-color: rgba(255, 255, 255, 1);
        box-shadow: 0 0 3px #cccccc;
        text-align: left;
    }

    #loginForm .form-group .form-control-i:focus {
        outline: 0 none;
    }

    #loginForm .form-group-r {
        display: flex;
        align-items: center;
        width: 80%;
        height: 44px;
        margin: 80px auto 0;
        padding: 0;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,1);
        background-color: rgba(255, 255, 255, 0);
        box-shadow: 0 0 6px rgba(255,0,0,0);
    }

    #loginForm .form-group-r .checkbox {
        margin: 0 10px 0 0;
        padding: 0;
        display: flex;
        align-items: center;
    }

    #loginForm .form-group-r .checkbox label {
        color: #606266;
        font-size: 14px;
        margin: 0;
        margin-top: -1px;
    }

    #loginForm .form-group-r .checkbox.active label {
        color: var(--publicMainColor,orange);
        font-size: 14px;
    }

    #loginForm .form-group-r .checkbox input {
        margin: 0;
        margin-right: 4px;
    }

    #loginForm button.pull-right {
        outline: none;
        width: 110px;
        height: 60px;
        margin: -110px 3% 10px 10%;
        color: var(--publicMainColor,orange);
        font-size: 14px;
        padding: 0 10px;
        border-radius: 16px;
        border-width: 0;
        border-style: solid;
        border-color: #ccc;
        background-color: var(--publicSubColor,rgba(128,64,1,1));
        box-shadow: 0 0 0px rgba(255, 0, 0, .5);
    }

    #loginForm a.btn-register {
        display: inline-block;
        width: auto;
        height: 34px;
        margin: -100px auto 0;
        color: #fff;
        font-size: 14px;
        padding: 0 10px;
        border-radius: 16px;
        border-width: 0;
        border-style: solid;
        border-color: #ccc;
        background-color: var(--publicMainColor,orange);
        box-shadow: 0 0 0px rgba(30, 144, 255, .5);
        display: flex;
        justify-content: center;
        align-items: center;
        text-decoration: none;
    }

    #loginForm .codes {
    }

    #loginForm .codes input {
        width: calc(100% - 84px);
        height: 40px;
        margin: 0;
        color: #1e90ff;
        font-size: 14px;
        padding: 0 10px;
        border-radius: 0;
        border-width: 1px;
        border-style: solid;
        border-color: var(--publicMainColor,orange);
        background-color: #fff;
        box-shadow: 0 0 2px #ed4390;
        outline: none;
    }

    #loginForm .codes .nums {
        width: 84px;
        height: 40px;
        margin: 0;
        color: $template2.back.login.code.nums.color;
        font-size: $template2.back.login.code.nums.fontSize;
        padding: 0;
        border-radius: 0;
        border-width: 1px 1px 1px 0;
        border-style: solid;
        border-color: var(--publicMainColor,orange);
        background-color: #f5f5f5;
        box-shadow: 0 0 2px #ed4390;
        outline: none;
    }
</style>
<body>
	
	<div class="container">

            <div class="" id="login-wrapper">
                <h1 id="projectName">xxxx系统</h1>
                <form id="loginForm" action="" method="post">
                    <div class="form-group">
                        <label class="label">用户名</label>
                        <input type="text" id="username" name="username" placeholder="用户名" class="form-control-i" required>
                    </div>
                    <div class="form-group">
                        <label class="label">密码</label>
                        <input type="password" name="password" placeholder="密码" class="form-control-i" required>
                    </div>
                    <div class="form-group-l-r">
                        <button class="btn btn btn-primary pull-right" type="submit" onclick="login()">登 录</button>

<%--                    <a class="btn-register" href="modules/yonghu/register.jsp">用户注册</a>--%>
                    <a class="btn-register" href="modules/yisheng/register.jsp">医生注册</a>
                    </div>
                </form>
            </div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
	<script type="text/javascript">
		
	<%@ include file="utils/menu.jsp"%>
		
	<%@ include file="utils/baseUrl.jsp"%>
		var role = "";
		var accountTableName = "";
		var numsFlag = "";//验证码开关
		var codes=[{num:1,color:'#000',rotate:'10deg',size:'16px'},{num:2,color:'#000',rotate:'10deg',size:'16px'},{num:3,color:'#000',rotate:'10deg',size:'16px'},{num:4,color:'#000',rotate:'10deg',size:'16px'}]

		//渲染角色选择
		function setRoleOption() {
			var box = document.createElement('div');
			box.setAttribute('class', 'form-group-r');
			for (var i = 0; i < menus.length; i++) {
				//console.log(menu[i].roleName)
				var div = document.createElement('div');
				div.setAttribute('class', 'checkbox');
				var label = document.createElement('label');
				//label.innerHTML = menus[i].roleName;
				var checkbox = document.createElement('input');
				checkbox.setAttribute('type', 'radio');
				checkbox.setAttribute('name', 'chk');
				checkbox.setAttribute('value', menus[i].roleName);
				var attr = "checkRole(" + "\'" + menus[i].roleName + "\',\'"
						+ menus[i].tableName + "\')";
				checkbox.setAttribute('onclick', attr);

                var span = document.createElement('span');
                span.innerHTML =menus[i].roleName;
                label.appendChild(checkbox);
                label.appendChild(span);
                div.appendChild(label);
                box.appendChild(div);
                box.appendChild(div);
			}
			$('form .form-group-l-r').before(box);
		}
		function checkRole(roleName, tableName) {			
			role = roleName;
			$('#loginForm').attr('action', baseUrl + tableName + '/login');
			accountTableName = tableName;
		}
		
		$('#login-wrapper').on('change', 'input[type=radio]', function () {
		    $('#login-wrapper .form-group-r .checkbox').removeClass('active');
			$(this).parent().addClass('active');
		});
		
		function login() {
			if(numsFlag) {
				var arr = []
				for(var i = 0;i<codes.length;i++) {
					arr.push(codes[i].num)
				}
				if(arr.join('').toLowerCase() != $('#code').val().toLowerCase()) {
					layui.layer.msg("请输入正确的验证码", {time: 2000,icon: 5});
					randomString()
					window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
				}
			}
			
			$("#loginForm").ajaxForm(
			function(res) {
				if (role == "" || role == null) {
					layui.layer.msg("请选择角色后再登录", {time: 2000,icon: 5});
				} else {
					if (res.code == 0) {
						layui.layer.msg("登录成功", {time: 2000,icon: 6});
						var username = $('#username').val();
						window.sessionStorage.setItem('accountTableName',accountTableName)
						window.sessionStorage.setItem('username',username);
						window.sessionStorage.setItem('token',res.token);
						window.sessionStorage.setItem('role',role);
						window.sessionStorage.setItem('userId',res.userId);
						window.location.href = "${pageContext.request.contextPath}/index.jsp";
					} else {
						layui.layer.msg(res.msg, {time: 2000,icon: 5});
					}
				}

			});
		}
		function ready() {
			setRoleOption();
			$('#projectName').html(projectName)
		}
		document.addEventListener("DOMContentLoaded", ready);
		
		function randomString() {
			var len = 4;
			var chars = [
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'O', 'P'
				, 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '7', '8'
			]
			var colors = ['0', '1', '2', '2', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
			var sizes = ['14', '15', '16', '17', '18']
			
			for (var i = 0; i < len; i++) {
			  // 随机验证码
			  var key = Math.floor(Math.random() * chars.length)
			  codes[i].num = chars[key]
			  // 随机验证码颜色
			  var code = '#'
			  for (var j = 0; j < 6; j++) {
			    var key = Math.floor(Math.random() * colors.length)
			    code += colors[key]
			  }
			  codes[i].color = code
			  // 随机验证码方向
			  var rotate = Math.floor(Math.random() * 360)
			  var plus = Math.floor(Math.random() * 2)
			  if (plus == 1) rotate = '-' + rotate
			  codes[i].rotate = 'rotate(' + rotate + 'deg)'
			  // 随机验证码字体大小
			  var size = Math.floor(Math.random() * sizes.length)
			  codes[i].size = sizes[size] + 'px'
			}
			var str = ''
			for(var i = 0;i<codes.length;i++) {
				str += '<span style="color:' + codes[i].color + ';transform:' + codes[i].rotate + ';fontSize:' + codes[i].size + ';padding: 0 3px;display:inline-block">'+codes[i].num+'</span>'
			}
			$('#nums').html('').append(str);
		}
		
		randomString();



		layui.use(['layer' , 'jquery' , 'laydate'], function() {
			var layer = layui.layer;
			var jquery = layui.jquery;
			var laydate = layui.laydate;
			// layui.layer.msg("输入不合法", {time: 2000,icon: 5});
			//    5失败 6成功
		});
	</script>

</body>

</html>
