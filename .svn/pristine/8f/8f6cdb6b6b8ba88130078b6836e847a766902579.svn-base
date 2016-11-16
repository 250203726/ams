<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
	<title>客户详细</title>
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
				parent.Public.addTab("khbj${model.customerId}","客户编辑","${path}/customer/edit?id=${model.customerId}");
				parent.Public.pageTabClose(tabId);
			});
			$("#close").bind("click",function(){
				parent.tab.removeSelectedTabItem();					
			});
		});
	</script>
</head>
<body>
	<div class="man_zone">
     <table class="op_tb">
     	<caption style="text-align: center;">
     		客户详细
     	</caption>
         <tbody>
             <tr>
                 <td class="label">
                     	客户名称：
                 </td>
                 <td>
                     ${model.customerName }
                 </td>
             </tr>
             <tr>
                 <td class="label">
                     	机构代码：
                 </td>
                 <td>
                     ${model.customerCode }
                 </td>
             </tr>
             <tr>
                 <td class="label">
                    	 联&nbsp;系&nbsp;人：
                 </td>
                 <td>
                     ${model.contactPerson }
                 </td>
             </tr>
             <tr>
                 <td class="label">
                     	联系电话：
                 </td>
                 <td>
                    ${model.contatctPhone }
                 </td>
             </tr>
             <tr>
                 <td class="label">
                     	客户地址：
                 </td>
                 <td>
                     ${model.contatctAddress }
                 </td>
             </tr>
             <tr>
                 <td class="label">
                         	备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：
                 </td>
                 <td>
                    ${model.customerNote }
                 </td>
             </tr>
             <tr>
                 <td colspan="2" class="toolbottom" align="center">
                 	<input type="button" class="ui-btn ui-btn-sp" id="btnEdit" value="修改" />&nbsp;&nbsp;
   					<input type="button" class="ui-btn-rad button blue" id="close" value="关闭" />
                 </td>
             </tr>
         </tbody>
     </table> 
 </div>
</body>
</html>