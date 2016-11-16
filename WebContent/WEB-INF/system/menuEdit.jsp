<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>菜单编辑</title>
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
			var url="${path}/menu/save";
			if(""==$("#name").val() || $("#name").val().length<=0){
				parent.Public.tips({type: 2, content : "请输入名称"});
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
	           		<c:if test="${empty menu.menuId }">菜单新建</c:if>
	           		<c:if test="${not empty menu.menuId }">
	           			菜单编辑
	           			<input type="hidden" name="menuId" value="${menu.menuId}"/>
	           		</c:if>
	            </caption>
	            <tbody>
	                <tr>
	                    <td class="label">
	                       	菜单名称：
	                    </td>
	                    <td>
	                        <input type="text" id="name" name="name" value="${menu.name }"/>                    
	                    </td>
	                    <td class="label">
	                       	父级菜单：
	                    </td>
	                    <td>
	                        ${parent.name }
	                        <input type="hidden" name="parentId" value="${menu.parentId }"/>                  
	                    </td>
	                </tr>
	                <tr>
	                    <td class="label">
	                       	菜单简码：
	                    </td>
	                    <td >
	                        <input type="text" name="code" value="${menu.code }"/>                    
	                    </td>
	                    <td class="label">
	                       	模块简码：
	                    </td>
	                    <td >
	                        <input type="text" name="moduleId" value="${menu.moduleId }"/>                    
	                    </td>
	                </tr> 
	               	<tr>
	                    <td class="label">
	                       	请求路径：
	                    </td>
	                    <td colspan="3">
	                        <input type="text" name="url" value="${menu.url }"/>                    
	                    </td>
	                </tr>  
	                <tr>
	                    <td class="label">
	                       	图标路径：
	                    </td>
	                    <td colspan="3">
	                        <input type="text" name="icon" value="${menu.icon }"/>                    
	                    </td>
	                </tr>
	                <tr>
	                    <td class="label">
	                       	层&nbsp;&nbsp;&nbsp;&nbsp;级：
	                    </td>
	                    <td>
	                        <input type="text" name="levels" value="${menu.levels }"/>                    
	                    </td>
	                     <td class="label">
	                       	显示顺序：
	                    </td>
	                    <td>
	                        <input type="text" name="sortCode" value="${menu.sortCode }"/>                    
	                    </td>
	                </tr>                      
	                <tr>
	                    <td class="label">
	                     	是否启用
	                    </td>
	                    <td colspan="3">
							<select name="enable">
								<gt:option selectedValue="${menu.enable }" groupName="dic_state"></gt:option>
							</select>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	    </div>	
	</form>
</body>

</html>