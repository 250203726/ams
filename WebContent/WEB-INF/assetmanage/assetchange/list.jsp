<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
    <meta name="robots" content="none" />
	<title>资产调拨列表</title>
	<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css" />	
    <link href="${path}/resources/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/main.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/base.css" rel="stylesheet" type="text/css" />
    <script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${path}/resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="${path}/resources/js/config.js" type="text/javascript" ></script>
    <script src="${path}/resources/js/commonFN.js" type="text/javascript"></script>
    <script type="text/javascript">
    
	    var grid = null;
		$(document).ready(function(){
			grid = $("#maingrid").ligerGrid({
				toolbar: { items: [
					{ text: '领用', click: add, icon:'add'},               	
					{ line: true },
					{ text: '刷新', click: refresh, icon:'refresh'},
				]},
				columns: [
				{ display: '资产调拨编号', name: 'aciId', width: "250"},
				{ display: '资产编号', name: 'assetId', width: "250" },
				{ display: '原使用部门', name: 'originalDepartment', width: "100" },
				{ display: '原负责人', name: 'originalPrincipal', width: "100" },
				{ display: '现使用部门', name: 'nowDepartment', width: "100" },
				{ display: '现负责人', name: 'nowPrincipal', width: "100" },
				{ display: '资产状态', name: 'assetStatus', width: "100" },
				{ display: '操作',width: "140", render: function (rowdata, rowindex, value){
					var h="";
					if(rowdata.assetStatus=="领用中"){
						h += "<a href='javascript:back(\""+rowdata.aciId+"\")' style='color:teal'>归还</a>&nbsp;|&nbsp;";
					}
					h += "<a href='${path}/assetmanage/assetchange/detail?id="+rowdata.aciId+"' rel='pageTab' data-tabid='dwxx"+rowdata.aciId+"' data-tabTxt='详细' data-parentOpen='true' style='color:teal'>详细</a>&nbsp;|&nbsp;";
					h += "<a href='javascript:beginEdit(\"" + rowdata.aciId + "\")' style='color:teal'>编辑</a>&nbsp;|&nbsp;";
					h += "<a href='javascript:itemDel(\""+rowdata.aciId+"\")' style='color:teal' >删除</a> ";
					return h;
				}}],
				usePager:true,
				delayLoad:true,//延迟加载
				root:'rows',
				record:'total',
	            url:"${path}/assetmanage/assetchange/list",
				fixedCellHeight: false,
				rownumbers:true,
				clickToEdit:false,
				width: '100%',height:'99%'
			});
			search();
			Public.pageTab();//启用链接打开tab页
		});
		function add(){
			parent.Public.addTab("","资产调拨新增","${path}/assetmanage/assetchange/add");
		}
		function refresh(){
			window.location.reload();
		}
		function search(){
			grid.changePage("first");
			var params=$("#searchForm").serialize();
			grid.set("url","${path}/assetmanage/assetchange/list?"+params);
			grid.reload();
			return false;
		}
		function beginEdit(aciId) { 
			parent.Public.addTab("dwbj"+aciId,"资产调拨编辑","${path}/assetmanage/assetchange/edit?id="+aciId);
	    }
		//删除
	    function itemDel(aciId){
	    	$.ligerDialog.confirm('请不要随意删除，如要删除，请联系管理员？', function (yes) {
	    		if(yes){
		        	parent.Public.ajaxPost("${path}/assetmanage/assetchange/delete?id="+aciId,"",function(data){
		        		data=eval(data);
		        		if(data){
		        			parent.Public.tips({type: 0, content : data.message});
		        			grid.reload();
		        		}else{
		        			parent.Public.tips({type: 0, content : data.message});
		        		}
		        	});
	    		}
	    	});
	    }
	    
	    function back(aciId){
	    	parent.Public.ajaxPost("${path}/assetmanage/assetchange/back?id="+aciId,"",function(data){
		        		data=eval(data);
		        		if(data){
		        			parent.Public.tips({type: 0, content : data.message});
		        			grid.reload();
		        		}else{
		        			parent.Public.tips({type: 0, content : data.message});
		        		}
		        	});
	    }
	</script>
</head>
<body>
	<div class="search-wrap">
		<form id="searchForm" onsubmit="return search();" method="post">
		<dl>
			<dd>
				<label class="b-label" for="txt_kw">状态：</label>
				<span class="ui-search">
					<select name="assetStatus">
					 	<option value="">--全部--</option>
						<option value="1">领用中</option>
						<option value="0">已归还</option>
					</select>
					
				</span>

				<label class="b-label" for="txt_kw">资产名称：</label>
				<span class="ui-search"><input type="text" name="assetId" value="${model.assetId }" class="ui-input"></span>
				<label class="b-label" for="txt_kw">现负责人：</label>
				<span class="ui-search"><input type="text" name="nowPrincipal" value="${model.nowPrincipal }" class="ui-input"></span>
				<label class="b-label" for="txt_kw">现使用部门：</label>
				<span class="ui-search"><input type="text" name="nowDepartment" value="${model.nowDepartment }" class="ui-input"></span>
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