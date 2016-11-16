<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %> 
<!DOCTYPE html>
<html>
<head>
	<title>修改密码</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
	<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
	<link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/base.css" rel="stylesheet" type="text/css" />
    
    <script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${path}/resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    
    <!-- JQuery Validate Scripts -->
    <script type="text/javascript" src="${path }/resources/jquery-ui/jquery.validate.js"></script>
    <script type="text/javascript" src="${path }/resources/jquery-ui/jquery.metadata.js"></script>
	<script type="text/javascript" src="${path }/resources/jquery-ui/jquery.validate.messages_cn.js"></script>
	<!-- JQuery Validate Scripts End -->
    
    <script type="text/javascript">
		$(document).ready(function(){
			//表单验证
            var v = $("#sub_form").validate({
            	rules :{
            		pass:{required:true},
            		newPwd:{required:true},
            		newPwd2:{required:true}
    			},
    			messages: {
    				pass:{required:'请输入原密码'},
    				newPwd:{required:'请输入新密码'},
            		newPwd2:{required:'请输入确认密码'}
    			},
    			debug: true
            });
			
			$("#btnSave").bind("click",function(){
				if($("#pass").val().length<=0){
					parent.Public.tips({type: 1, content : "请输入原密码"});
					return false;
				}
				if($("#newPwd").val().length<=0){
					parent.Public.tips({type: 1, content : "请输入新密码"});
					return false;
				}
				if($("#newPwd2").val().length<=0){
					parent.Public.tips({type: 1, content : "请输入确认密码"});
					return false;
				}
				if(v.errorList.length<=0){
					$.ligerDialog.confirm('确认修改密码？', function (yes) {
						if(yes){
							var flag=checkOld();
							if(flag){
								if($("#newPwd").val()==$("#newPwd2").val()){
									var url="${path}/user/savePwd";
									var params=$("#sub_form").serialize();
									parent.Public.ajaxPost(url,params,save);
								}else{
									parent.Public.tips({type: 1, content : "两密码不相同"});
									$("#newPwd").val("").focus();
									$("#newPwd2").val("");
								}
							}
						}
					});
				}
			});
			$("#btnClose").bind("click",function(){
				parent.tab.removeSelectedTabItem();					
			});
		});

		function save(data){
			data=eval(data);
			if(data.state){
				parent.Public.tips({type: 0, content : data.message});
				parent.tab.removeSelectedTabItem();
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
		}
		
		//检查旧密码
		function checkOld(){
			var pwd=$("#pass").val();
			var flag=true;
			$.ajax({
				type:"post",
				async:false,
				url:"${path}/user/checkOld",
				data:{old:pwd},
        		dataType:'json',
        		contentType:"application/x-www-form-urlencoded; charset=utf-8",	
        		success:function(data){
        			if(data){
        				flag=true;
        			}else{
        				parent.Public.tips({type: 2, content : '原密码不正确！'});
						flag=false;
        			}
        		},
        		error:function(){
        			flag=false;
        		}
			});
			return flag;
		}
	
	</script>
	
</head>
<body>
    <div id="man_zone" class="clear">
    <form id="sub_form" method="post">
        <table class="op_tb">
            <caption style="text-align: center;">修改密码</caption>
            <tbody>
                <tr>
                    <td class="label">
                       	原&nbsp;密&nbsp;码
                    </td>
                    <td>
                        <input type="password" id="pass" name="pass" style="width: 60%;" />                      
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	新&nbsp;密&nbsp;码
                    </td>
                    <td>
                        <input type="password" id="newPwd" name="newPwd" style="width: 60%;" />
                    </td>
                </tr>                        
                <tr>
                    <td class="label">
                       	确认密码
                    </td>                            
                    <td>
                        <input type="password" id="newPwd2" name="newPwd2"  style="width: 60%;"/>
                    </td>
                </tr>
                <tr>
					<td colspan="2" align="center">
						<input type="button" class="ui-btn ui-btn-sp" id="btnSave" value="保存" />&nbsp;&nbsp;
					    <input type="button" class="ui-btn-rad button blue" id="btnClose" value="关闭" />
                    </td>
				</tr>
            </tbody>
        </table>
    </form>
    </div>
</body>
</html>