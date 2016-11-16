<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
	<title>资产报损详细</title>
	<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
	<link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/base.css" rel="stylesheet" type="text/css" />
    
    <script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${path}/resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btnEdit").bind("click",function(){
				var tabId=parent.tab.getSelectedTabItemID();
				parent.Public.addTab("zcbsbj${model.assetDamageID}","资产报损编辑","${path}/assetmanage/assetdamage/edit?id=${model.assetDamageID}");
				parent.Public.pageTabClose(tabId);
			});
			$("#btnClose").bind("click",function(){
				parent.tab.removeSelectedTabItem();					
			});
		});
	</script>
</head>
<body>
    <div class="man_zone">
         <table class="op_tb">
         	<caption style="text-align: center;">
         		资产报损详细 
         	</caption>
             <tbody>
                 <tr>
                     <td class="label">
                          	资产报损编号：
                     </td>
                     <td>
                         ${model.assetDamageID }
                     </td>
                 </tr>
                 <tr>
                     <td class="label">
                         	资产名称：
                     </td>
                     <td>
                         ${model.assetId }
                     </td>
                 </tr>
                 <tr>
                     <td class="label">
                        	 鉴定人编号：
                     </td>
                     <td>
                         ${model.userId}
                     </td>
                 </tr>
                 <tr>
                     <td class="label">
                         	资产报损原因：
                     </td>
                     <td>
                         ${model.assetDamageReason }
                     </td>
                 </tr>
                 <tr>
                     <td class="label">
                         	资产报损选择：
                     </td>
                     <td>
                         ${model.assetDamageOpinion }
                     </td>
                 </tr>
                 <tr>
                     <td class="label">
                         	鉴定时间：
                     </td>
                     <td>
                         ${model.appDate }
                     </td>
                 </tr>
                 <tr>
                     <td class="label">
                         	审批意见：
                     </td>
                     <td>
                         ${model.lastOpinion }
                     </td>
                 </tr>
                 <tr>
                     <td class="label">
                             	资产报损备注备注：
                     </td>
                     <td>
                        ${model.assetDamageRemark }
                     </td>
                 </tr>
                 <tr>
                     <td colspan="2" class="toolbottom" align="center">
                     	<input type="button" class="ui-btn ui-btn-sp" id="btnEdit" value="修改" />&nbsp;&nbsp;
			    		<input type="button" class="ui-btn-rad button blue" id="btnClose" value="关闭" />
                     </td>
                 </tr>
             </tbody>
         </table>   
     </div>
</body>
</html>