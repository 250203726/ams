<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
    <meta name="robots" content="none" />
	<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css" />	
    <link href="${path}/resources/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/main.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/base.css" rel="stylesheet" type="text/css" />
    <script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${path}/resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="${path}/resources/js/commonFN.js" type="text/javascript"></script>
    <script type="text/javascript">
    
	    var grid = null;
		$(document).ready(function(){
			grid = $("#maingrid").ligerGrid({
				columns: [
				{ display: '资产报损编号', name: 'assetDamageID', width: "50%" },
				{ display: '资产编号', name: 'assetId', width: "18%" },
				{ display: '损坏原因', name: 'assetDamageRemark', width: "29%" },
				{ display: '鉴定人编号', name: 'userId', width: "29%" },
				{ display: '报损理由', name: 'assetDamageReason', width: "50%" },
				{ display: '鉴定意见', name: 'assetDamageOpinion', width: "18%" },
				{ display: '鉴定时间', name: 'appDate', width: "29%" },
				{ display: '审批意见', name: 'lastOpinion', width: "50%" },
				],
				
				checkbox:true,
				usePager:true,
				delayLoad:true,//延迟加载
				root:'rows',
				record:'total',
	            url:"${path}/assetmanage/assetdamage/popList",
				fixedCellHeight: false,
				rownumbers:true,
				clickToEdit:false,
				width: '100%',height:'98%',
				isChecked:function(rowdata){
					if (rowdata.assetDamageID=='${model.assetDamageID}') 
		                return true;
		            return false;
				},
				onCheckRow: function(checked, rowdata, rowindex) {
			       for (var rowid in this.records)
			           this.unselect(rowid); 
			       this.select(rowindex);
				}
			});
			search();
		});
		function search(){
			grid.changePage("first");
			var params=$("#searchForm").serialize();
			grid.set("url","${path}/assetmanage/assetdamage/popList?"+params);
			grid.reload();
			return false;
		}
		function f_select()
        {
            return grid.getSelectedRow();
        }
	</script>
</head>
<body>
	<div >
		<form id="searchForm" onsubmit="return search();" method="post">
		<dl>
			<dd>
				<label class="b-label" for="txt_kw">报损编号：</label>
				<span class="ui-search"><input type="text" name="assetId" value="${model.assetDamageID }" class="ui-input"></span>
				&nbsp;&nbsp;
				<label class="b-label" for="txt_kw">资产编号：</label>
				<span class="ui-search"><input type="text" name="companyName" value="${model.assetId }" class="ui-input"></span>
			    <input id="btnOK" type="submit" value="搜 索" class="ui-btn">
			    <input type="reset" value="重置" class="ui-btn" >
			</dd>
		</dl>
		</form>		
	</div>
	<div class="clear ht_10"></div>
    <div id="maingrid" style="margin:0; padding:0"></div>
</body>
</html>