<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<c:if test="${empty role.roleId }"><title>新建角色</title></c:if>
	<c:if test="${not empty role.roleId }"><title>角色编辑</title></c:if>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
	<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
	<link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/base.css" rel="stylesheet" type="text/css" />
    
    <script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${path}/resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		var authTree=null;
		$(document).ready(function(){
			var oldParams=$("#sub_form").serialize();
			//初始化tree
			var data =[
						<c:forEach items="${allAuth }" var="item" varStatus="i"> 
							{id:"${item.authId}",pid:"${item.parentId}",text:"${item.authName}",<c:if test='${fn:contains(aList,item.authId) }'>ischecked:true,</c:if>}<c:if test='${i.last eq false}'>,</c:if>
					 	</c:forEach>
					 		];
			authTree=$("#authTree").ligerTree({  
	            data:data, 
	            checkbox: true,
	            idFieldName: 'id',
	            isExpand: 2,
	            parentIDFieldName :'pid',
	            onCheck:onCheck
	        });
			
			$("#btnSaveNext").bind("click",function(){
				var url="${path}/role/save";
				var params=$("#sub_form").serialize();
				parent.Public.ajaxPost(url,params,saveNext);
			});
			$("#btnSave").bind("click",function(){
				var url="${path}/role/save";
				var params=$("#sub_form").serialize();
				parent.Public.ajaxPost(url,params,save);
			});
			$("#btnClose").bind("click",function(){
				var params=$("#sub_form").serialize();
				if(oldParams!=params){
					$.ligerDialog.confirm('您好有信息未保存，是否退出？', function (yes) { 
						if(yes) parent.tab.removeSelectedTabItem();
					});
				}else{
					parent.tab.removeSelectedTabItem();					
				}
			});
		    function onCheck(note, checked){
				var nodes=authTree.getChecked();
				var v="";
			    for(var i=0;i<nodes.length;i++){
			        v+=nodes[i].data.id + ",";
		        }
			    $("#auth").val(v);
		    }
			function saveNext(data){
				data=eval(data);
				if(data.state){
					parent.Public.reloadTab(parent.SYSTEM.jslb);
					parent.Public.tips({type: 0, content : data.message});
					window.location.reload();
				}else{
					parent.Public.tips({type: 1, content : data.message});
				}
			}
			function save(data){
				data=eval(data);
				if(data.state){
					parent.Public.reloadTab(parent.SYSTEM.jslb);
					parent.Public.tips({type: 0, content : data.message});
					var tabId=parent.tab.getSelectedTabItemID();
					parent.Public.addTab("jsxx"+data.param,"角色详细","${path}/role/detail?id="+data.param);
					parent.Public.pageTabClose(tabId);
				}else{
					parent.Public.tips({type: 1, content : data.message});
				}
			}
		});
	
	</script>

</head>
<body>
	<form id="sub_form" onsubmit="return false;" action="${path }/role/save" method="post">
	    <div id="man_zone" class="clear">
	        <table class="op_tb">
	            <caption style="text-align: center;">
	           		<c:if test="${empty role.roleId }">角色新建</c:if>
	           		<c:if test="${not empty role.roleId }">
	           			角色编辑
	           			<input type="hidden" name="roleId" value="${role.roleId}"/>
	           		</c:if>
	            </caption>
	            <tbody>
	                <tr>
	                    <td class="label">
	                       	角色名称
	                    </td>
	                    <td>
	                        <input type="text" name="roleName" value="${role.roleName }"/>                    
	                    </td>
	                </tr>                        
	                <tr>
	                    <td class="label">
	                     	用户权限
	                    </td>
	                    <td>
	                    	<div style="height:400px;overflow: scroll;">
								<div id="authTree" ></div>
							</div>
							<input type="hidden" name="auth" id="auth" value="${aList}">
	                    </td>
	                </tr>
	                <tr>
						<td colspan="2" align="center">
							<c:if test="${empty user.userId }">
								<input type="button" class="ui-btn ui-btn-sp" id="btnSaveNext" value="保存并新建" />&nbsp;&nbsp;
							</c:if>
							<input type="button" class="ui-btn ui-btn-sp" id="btnSave" value="保存" />&nbsp;&nbsp;
						    <input type="button" class="ui-btn-rad button blue" id="btnClose" value="关闭" />
	                    </td>
					</tr>
	            </tbody>
	        </table>
	    </div>	
	
	</form>
</body>

</html>