<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="robots" content="none" />
<title>资产领用</title>
<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
<link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
<link href="${path}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="${path}/resources/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script src="${path}/resources/My97DatePicker/WdatePicker.js" language="javascript" type="text/javascript"></script>
<script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${path}/resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
<script src="${path}/resources/uploadify/jquery.uploadify.js" type="text/javascript"></script>
<script type="text/javascript">
	    $(document).ready(function(){
			var oldParams=$("#sub_form").serialize();
			$("#btnSaveNext").bind("click",function(){
				/* var flag=isBack();
				if(flag){ */
					var url="${path}/assetmanage/assetchange/save";
					var params=$("#sub_form").serialize();
					parent.Public.ajaxPost(url,params,saveNext);
				/* } */
			});
			$("#btnSave").bind("click",function(){
				/* var flag=isBack();
				if(flag){ */
					var url="${path}/assetmanage/assetchange/save";
					var params=$("#sub_form").serialize();
					parent.Public.ajaxPost(url,params,save);
				/* } */
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
			//设置资产状态的值
			$("#assetStatus").val(${model.assetStatus});
			//初始化表单数据
			if(${empty model.aciId}){
				/* $("#nowDepartment").val("${user_depart.departName }");
				$("#nowPrincipal").val("${USERSESSION.user.userName}"); */
				$("#changeTmie").val("${now_time}");
			}
			
			 $("#asseAttach").uploadify({
                //指定swf文件
                'swf': '${path}/resources/uploadify/uploadify.swf',
                //后台处理的页面
                'uploader': 'UploadHandler.ashx',
                //按钮显示的文字
                'buttonText': '上传图片',
                //显示的高度和宽度，默认 height 30；width 120
                //'height': 15,
                //'width': 80,
                //上传文件的类型  默认为所有文件    'All Files'  ;  '*.*'
                //在浏览窗口底部的文件类型下拉菜单中显示的文本
                'fileTypeDesc': 'Image Files',
                //允许上传的文件后缀
                'fileTypeExts': '*.gif; *.jpg; *.png',
                //发送给后台的其他参数通过formData指定
                //'formData': { 'someKey': 'someValue', 'someOtherKey': 1 },
                //上传文件页面中，你想要用来作为文件队列的元素的id, 默认为false  自动生成,  不带#
                //'queueID': 'fileQueue',
                //选择文件后自动上传
                'auto': true,
                //设置为true将允许多文件上传
                'multi': true
            });
		});
		function saveNext(data){
			data=eval(data);
			if(data.state){
				parent.Public.reloadTab(parent.SYSTEM.dwlb);
				parent.Public.tips({type: 0, content : data.message});
				window.location.reload();
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
		}
		function save(data){
			data=eval(data);
			if(data.state){
				parent.Public.reloadTab(parent.SYSTEM.dwlb);
				parent.Public.tips({type: 0, content : data.message});
				var tabId=parent.tab.getSelectedTabItemID();
				parent.Public.addTab("dwxx"+data.param,"资产调拨详细","${path}/assetmanage/assetchange/detail?id="+data.param);
				parent.Public.pageTabClose(tabId);
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
		}
		
    </script>
</head>
<body>
	<div class="man_zone">
		<form id="sub_form" action="${path }/assetmanage/assetchange/save"
			method="post">
			<table class="op_tb">
				<caption style="text-align: center;">
					<c:choose>
						<c:when test="${empty model.aciId}">资产领用录入</c:when>
						<c:otherwise>
            				资产领用信息修改
            				<input type="hidden" name="aciId"
								value="${model.aciId }" />
						</c:otherwise>
					</c:choose>
				</caption>
				<tbody>
					<tr>
						<td class="label">关联资产编号及信息：</td>
						<td colspan=3>
							<select name="assetId">
									<c:forEach items="${assetinfList }" var="item">
										<option
											<c:if test="${ item.assetId eq model.assetId }">selected</c:if>
											value="${item.assetId }">${item.assetId }-${item.assetBrand }-${item.assetinfoVersion }</option>
									</c:forEach>
							</select> 
						<%-- <input type="text" name="assetId" id="assetId" value="${model.assetId }" /> --%>
						</td>
					</tr>
					<tr>
						<td class="label">原使用部门：</td>
						<td>
							<select name="originalDepartment">
									<c:forEach items="${departList }" var="item">
										<option
											<c:if test="${ item.departId eq model.originalDepartment }">selected</c:if>
											value="${item.departId }">${item.departName }</option>
									</c:forEach>
							</select> 
							<%-- <input type="text" name="originalDepartment" id="originalDepartment" value="${model.originalDepartment }" disabled="disabled" /> --%>
						</td>
						<td class="label">原负责人：</td>
						<td>
							<select name="originalPrincipal">
									<c:forEach items="${userList }" var="item">
										<option
											<c:if test="${ item.userId eq model.originalPrincipal }">selected</c:if>
											value="${item.userId }">${item.userName }</option>
									</c:forEach>
							</select> 
							<%-- <input type="text" name="originalPrincipal" id="originalPrincipal" value="${model.originalPrincipal}" disabled="disabled" /> --%>
						</td>
					</tr>
					<tr>
						<td class="label">现使用部门：</td>
						<td>
							<select name="nowDepartment">
									<c:forEach items="${departList }" var="item">
										<option <c:if test="${ item.departId eq model.nowDepartment }">selected</c:if> value="${item.departId }">${item.departName }</option>
									</c:forEach>
							</select> 
							<%-- <input type="text" name="nowDepartment" id="nowDepartment" value="${model.nowDepartment}" /> --%>
						</td>
						<td class="label">现负责人：</td>
						<td>
							<select name="nowPrincipal">
									<c:forEach items="${userList }" var="item">
										<option 
											<c:if test="${ item.userId eq model.nowPrincipal }">selected</c:if> 
											value="${item.userId }">${ item.userName }
										</option>
									</c:forEach>
							</select> 
							<%-- <input type="text" name="nowPrincipal" id="nowPrincipal" value="${model.nowPrincipal}" /> --%>
						</td>
					</tr>
					<tr>
						<td class="label">调拨时间：</td>
						<td>
						<input type="text" name="changeTmie" id="changeTmie" class="Wdate" style="width:160px"
							value="${model.changeTmie}"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
							datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" 
							errormsg="请选择正确的日期" />
							
							</td>
						<td class="label">资产状态：</td>
						<td><select name="assetStatus" id="assetStatus">
								<option value="1" selected="selected">领用中</option>
								<option value="0">已归还</option>
						</select></td>
					</tr>
					<tr>
						<td class="label">资产附件：</td>
						<td colspan=3>
							<c:if test="${empty model.aciId }">文件下载路径</c:if>
							<input type="file" name="asseAttach" id="asseAttach" value="${model.asseAttach}" />
						</td>
					</tr>
					<tr>
						<td class="label">备注：</td>
						<td colspan=3><textarea name="remark" cols="100" rows="5"
								class="l-textarea" style="width: 100%x;">${model.remark}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="toolbottom" align="center"><c:if
								test="${empty model.aciId }">
								<input type="button" class="ui-btn ui-btn-sp" id="btnSaveNext"
									value="保存并新建" />&nbsp;&nbsp;
							</c:if> <input type="button" class="ui-btn ui-btn-sp" id="btnSave"
							value="保存" />&nbsp;&nbsp; <input type="button"
							class="ui-btn-rad button blue" id="btnClose" value="关闭" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>