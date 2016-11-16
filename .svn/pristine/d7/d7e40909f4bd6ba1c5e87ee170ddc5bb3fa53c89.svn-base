<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
	<title>角色列表</title>
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
					{ text: '新增', click: add, icon:'add'},               	
					{ line: true }, 
					{ text: '刷新', click: refresh, icon:'refresh'}
				]},
				columns: [
				{ display: '角色编码', name: 'roleId', width: "350" },
				{ display: '角色名称', name: 'roleName', width: "450" },
				{display: '操作',width: "150", render: function (rowdata, rowindex, value){
					var h="";
					h += "<a href='${path}/role/detail?id="+rowdata.roleId+"' rel='pageTab' data-tabid='jsxx"+rowdata.roleId+"' data-tabTxt='角色详细' data-parentOpen='true' style='color:teal'>详细</a>&nbsp;|";
					h += "<a href='javascript:beginEdit(\"" + rowdata.roleId +"\")' style='color:teal'>编辑</a>&nbsp;|";
					h += "<a href='javascript:itemDel(\""+rowdata.roleId+"\")' style='color:teal' >删除</a> ";
					return h;
				}}],
				usePager:true,
				root:'rows',
				record:'total',
                url:"${path}/role/list",
				fixedCellHeight: false,
				rownumbers:true,
				clickToEdit:false,
				width: '100%',height:'99%'
			});
			Public.pageTab();//启用链接倒开标签
		});
		function add(){
			parent.Public.addTab("","新建角色","${path}/role/add");
		}
		function refresh(){
			window.location.reload();
		}
		function search(){
			grid.changePage("first");
			var params=$("#searchForm").serialize();
			grid.set("url","${path}/role/list?"+params);//重新设置url,grid会自动加载，不需要再用grid.loadData(),否则查询会执行两次;
			return false;
		}
		function beginEdit(roleId) { 
			parent.Public.addTab("jsbj"+roleId,"角色编辑","${path}/role/edit?id="+roleId);
        }
		//删除
        function itemDel(roleId){
        	$.ligerDialog.confirm('确定删除？', function (yes) {
        		if(yes){
		        	parent.Public.ajaxPost("${path}/role/delete?id="+roleId,"",function(data){
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
	</script>
</head>
<body>
	<div class="search-wrap">
		<form id="searchForm" onsubmit="return search();" method="post">
		<dl>
			<dd>
				<label class="b-label" >角色名称：</label>
				<span class="ui-search">
					<input type="text" class="ui-input" name="roleName" value="${model.roleName}"/>
				</span>
			     <input id="btnOK" type="submit" value="搜 索" class="ui-btn" >
			     <input type="reset" value="重置" class="ui-btn" >
			</dd>
		</dl>
		</form>	
	</div>
		
	<div class="clear ht_10"></div>
	<div id="maingrid" style="margin:0; padding:0"></div>
</body>

</html>