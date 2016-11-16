<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>
    	用户编辑
	</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
	<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
	<link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/base.css" rel="stylesheet" type="text/css" />
    
    <script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${path}/resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    
	<script type="text/javascript">
		$(document).ready(function(){

			$("#btnSave").bind("click",function(){
				$.ligerDialog.confirm('确认修改个人信息？', function (yes) {
					if(yes){
						var url="${path}/user/save";
						var params=$("#sub_form").serialize();
						parent.Public.ajaxPost(url,params,save);
					}
				});
			});
			$("#btnClose").bind("click",function(){
				parent.tab.removeSelectedTabItem();					
			});
		});

		function save(data){
			data=eval(data);
			if(data.state){
				parent.Public.tips({type: 0, content : data.message});
				var tabId=parent.tab.getSelectedTabItemID();
				parent.Public.addTab("grzl","个人资料","${path}/user/userInfo?id="+data.param);
				parent.Public.pageTabClose(tabId);
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
		}
	
	</script>
</head>
<body>
	<div id="man_zone" class="clear">
		<form id="sub_form" method="post">
        <table class="op_tb">
            <caption style="text-align: center;">
            	<c:if test="${not empty user.userId }">用户编辑</c:if>
            	<input type="hidden" name="userId" value="${user.userId }">
            </caption>
            <tbody>
                <tr>
                    <td class="label">
                       	姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名
                    </td>
                    <td>
                        <input type="text" name="realName" value="${user.realName }"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话
                    </td>
                    <td>
                        <input type="text" name="phone" value="${user.phone }">
                    </td>
                </tr> 
                <tr>
                    <td class="label">
                       	部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门
                    </td>
                    <td>
                        <input type="text" name="phone" value="${user.departId }">
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