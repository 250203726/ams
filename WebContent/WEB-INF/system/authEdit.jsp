<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>权限编辑</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
	<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
	<link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/base.css" rel="stylesheet" type="text/css" />
    
    <script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${path}/resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    
    <script type="text/javascript">
		function f_save(){
			var url="${path}/auth/save";
			if(""==$("#authName").val() || $("#authName").val().length<=0){
				parent.Public.tips({type: 2, content : "请输入权限名称"});
				return "";
			}
			var params=$("#sub_form").serialize();
			var result=null;
			$.ajax({  
			   type: "POST",
			   url: url,
			   async:false,
			   data: params, 
			   dataType: "json",  
			   success: function(data){ 
				   result= data;
			   },  
			   error: function(err){  
				   if(null!=err.status && "undefined"!=err.status){
					   if("998"==err.status){
						   parent.Public.tips({type: 1, content : '您没有权限，请于管理员联系！'});
					   }else{
						   parent.Public.tips({type: 1, content : '操作失败了哦，请检查您的网络链接！'});
					   }
				   }else{
					   parent.Public.tips({type: 1, content : '操作失败了哦，请检查您的网络链接！'});
				   }
			   }  
			}); 
			return result;
		}
	</script>
	
</head>
<body>
	<form id="sub_form" method="post">
	    <div id="man_zone" class="clear">
	        <table class="op_tb">
	            <caption style="text-align: center;">
	           		<c:if test="${empty auth.authId }">权限新建</c:if>
	           		<c:if test="${not empty auth.authId }">
	           			权限编辑 
	           			<input type="hidden" name="authId" value="${auth.authId}"/>
	           		</c:if>
	            </caption>
	            <tbody>
	                <tr>
	                    <td class="label">
	                       	权限名称：
	                    </td>
	                    <td>
	                        <input type="text" id="authName" name="authName" value="${auth.authName }"/>                    
	                    </td>
	                    <td class="label">
	                       	父级菜单：
	                    </td>
	                    <td>
	                        ${parent.authName }
	                        <input type="hidden" name="parentId" value="${auth.parentId }"/>                  
	                    </td>
	                </tr>
	                <tr>
	                    <td class="label">
	                       	权限值：
	                    </td>
	                    <td>
	                        <input type="text" name="authority" value="${auth.authority }"/>                    
	                    </td>
	                     <td class="label">
	                       	显示顺序：
	                    </td>
	                    <td>
	                        <input type="text" name="sortCode" value="${auth.sortCode }"/>                    
	                    </td>
	                </tr>                      
	                <tr>
	                    <td class="label">
	                     	是否启用
	                    </td>
	                    <td >
							<select name="enable">
								<gt:option selectedValue="${auth.enable }" groupName="dic_state"></gt:option>
							</select>
	                    </td>
	                    <td class="label">
	                     	是否基础权限
	                    </td>
	                    <td >
							<select name="base">
								<gt:option selectedValue="${auth.base }" groupName="dic_state"></gt:option>
							</select>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	    </div>	
	</form>
</body>

</html>