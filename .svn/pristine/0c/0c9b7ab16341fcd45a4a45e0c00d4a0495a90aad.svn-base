<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
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
				{ display: '客户名称', name: 'customerName', width: "50%" },
				{ display: '机构代码', name: 'customerCode', width: "18%" },
				{ display: '联系人', name: 'contactPerson', width: "29%" }],
				checkbox:true,
				usePager:true,
				root:'rows',
				record:'total',
	            url:"${path}/customer/popList",
				fixedCellHeight: false,
				rownumbers:true,
				clickToEdit:false,
				width: '100%',height:'98%',
				isChecked:function(rowdata){
					if (rowdata.customerId=='${model.customerId}') 
		                return true;
		            return false;
				},
				onCheckRow: function(checked, rowdata, rowindex) {
				       for (var rowid in this.records)
				           this.unselect(rowid); 
				       this.select(rowindex);
				   }
			});
		});
		function search(){
			grid.changePage("first");
			var params=$("#searchForm").serialize();
			grid.set("url","${path}/customer/popList?"+params);//重新设置url,grid会自动加载，不需要再用grid.loadData(),否则查询会执行两次;
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
				<label class="b-label" for="txt_kw">机构代码：</label>
				<span class="ui-search"><input name="customerCode" type="text" class="ui-input"></span>
				<label class="b-label" for="txt_kw">客户名称：</label>
				<span class="ui-search"><input name="customerName" type="text" class="ui-input"></span>
			    <input id="btnOK" type="submit" value="搜 索" class="ui-btn" >&nbsp;&nbsp;
			    <input type="reset" value="重置" class="ui-btn" >
			</dd>
		</dl>
		</form>		
	</div>
	<div class="clear ht_10"></div>
    <div id="maingrid" style="margin:0; padding:0"></div>
</body>
</html>