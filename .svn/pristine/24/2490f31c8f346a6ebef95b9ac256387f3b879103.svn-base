<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>项目经理编辑</title>
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
			var oldParams=$("#sub_form").serialize();
			$("#btnSaveNext").bind("click",function(){
				var url="${path}/manager/save";
				var params=$("#sub_form").serialize();
				parent.Public.ajaxPost(url,params,saveNext);
			});
			$("#btnSave").bind("click",function(){
				var url="${path}/manager/save";
				var params=$("#sub_form").serialize();
				parent.Public.ajaxPost(url,params,save);
			});
			$("#btnClose").bind("click",function(){
				var params=$("#sub_form").serialize();
				if(oldParams!=params){
					$.ligerDialog.confirm('您有信息未保存，是否关闭？', function (yes) { 
						if(yes) parent.tab.removeSelectedTabItem();
					});
				}else{
					parent.tab.removeSelectedTabItem();					
				}
			});
		});
		function saveNext(data){
			data=eval(data);
			if(data.state){
				parent.Public.reloadTab(parent.SYSTEM.xmjllb);
				parent.Public.tips({type: 0, content : data.message});
				window.location.reload();
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
		}
		function save(data){
			data=eval(data);
			if(data.state){
				parent.Public.reloadTab(parent.SYSTEM.xmjllb);
				parent.Public.tips({type: 0, content : data.message});
				var tabId=parent.tab.getSelectedTabItemID();
				parent.Public.addTab("xmjlxx"+data.param,"项目经理详细","${path}/manager/detail?id="+data.param);
				parent.Public.pageTabClose(tabId);
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
		}
	
	</script>

</head>
<body>
	<div id="man_zone" class="clear">
		<form id="sub_form" action="${path }/manager/save" method="post">
        <table class="op_tb" >
            <caption style="text-align: center;">
            	<c:if test="${empty manager.managerId }">项目经理新建</c:if>
            	<c:if test="${not empty manager.managerId }">
            		项目经理修改
            		<input type="hidden" name="managerId" value="${manager.managerId }" /> 
            	</c:if>
            </caption>
            <tbody>
                <tr>
                    <td class="label">
                       	姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
                    </td>
                    <td>
                        <input type="text" name="managerName" value="${manager.managerName }"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                     	工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：
                    </td>
                    <td>
                        <input type="text" name="code" value="${manager.code }"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：
                    </td>
                    <td>
                        <input type="text" name="tel" value="${manager.tel }">
                    </td>
                </tr> 
                <tr>
                    <td class="label">
                       	是否启用：
                    </td>
                    <td>
                    	<select name="enable">
	                        <gt:option selectedValue="${manager.enable }" groupName="dic_state"></gt:option>
                    	</select>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	关联登录用户：
                    </td>
                    <td>
                    	<select name="refuser">
	                        <c:forEach items="${userList }" var="item">
	                        	<option <c:if test="${item.userId eq manager.refuser || item.userName eq manager.managerName }">selected</c:if> value="${item.userId }">${item.userName }</option>
	                        </c:forEach>
                    	</select>
                    </td>
                </tr>
                <tr>
					<td colspan="2" align="center">
						<c:if test="${empty manager.managerId }">
							<input type="button" class="ui-btn ui-btn-sp" id="btnSaveNext" value="保存并新建" />&nbsp;&nbsp;
						</c:if>
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