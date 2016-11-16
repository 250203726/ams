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
				{ display: '维护记录编号', name: 'maintenancerecordId', width: "250" },
				{ display: '资产编号', name: 'assetId', width: "100" },
				{ display: '检修成员', name: 'recordPeople', width: "100" },
				{ display: '检修性质', name: 'recordInfo', width: "100"}, 
				{ display: '检修日期', name: 'repairTime', width: "250"},
				{ display: '检修前状态', name: 'repairExstatus', width: "250"},
				{ display: '检修内容', name: 'repairContent', width: "250"},
				{ display: '检修后状态', name: 'repairAftstatus', width: "250"},
				{ display: '验收人', name: 'acceptancePerson', width: "250"},
				{ display: '记录时间', name: 'recordTime', width: "250"},
				{ display: '验收评价', name: 'acceptanceEvaluation', width: "250"},
				],
				checkbox:true,
				usePager:true,
				delayLoad:true,//延迟加载
				root:'rows',
				record:'total',
	            url:"${path}/assetmanage/maintenancerecord/popList",
				fixedCellHeight: false,
				rownumbers:true,
				clickToEdit:false,
				width: '100%',height:'98%',
				isChecked:function(rowdata){
					if (rowdata.maintenancerecordId=='${model.maintenancerecordId}') 
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
			grid.set("url","${path}/assetmanage/maintenancerecord/popList?"+params);
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
				<label class="b-label" for="txt_kw">维护记录编号：</label>
				<span class="ui-search"><input type="text" name="assetId" value="${model.maintenancerecordId }" class="ui-input"></span>
				&nbsp;&nbsp;
				<label class="b-label" for="txt_kw">资产编号：</label>
				<span class="ui-search"><input type="text" name="assetnameId" value="${model.assetId }" class="ui-input"></span>
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