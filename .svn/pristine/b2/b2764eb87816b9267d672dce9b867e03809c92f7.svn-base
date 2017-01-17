<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
	<title>资产类别信息详细</title>
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
				parent.Public.addTab("zcmcbj${model.assettypeId}","资产类别信息编辑","${path}/assetmanage/assettype/edit?id=${model.assettypeId}");
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
         		资产类别信息详细 
         	</caption>
             <tbody>
                 <tr>
                     <td class="label">
                          	资产类别编号：
                     </td>
                     <td>
                         ${model.assettypeId }
                     </td>
                 </tr>
                 <tr>
                     <td class="label">
                         	资产类别名：
                     </td>
                     <td>
                         ${model.assettypeName }
                     </td>
                 </tr>
                 <tr>
                     <td class="label">
                        	单位编号：
                     </td>
                     <td>
                         ${model.unitId}
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