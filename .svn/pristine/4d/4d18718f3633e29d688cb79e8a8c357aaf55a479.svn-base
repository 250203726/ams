<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>url列表</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
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
					{ text: '刷新缓存', click: refresh, icon:'refresh'}
				]},
				columns: [
				{ display: '路径名称', name: 'name', width: "100" },
				{ display: 'url', name: 'url', width: "250" },
				{ display: '权限值', name: 'authoritys', width: "150" },
				{ display: '是否验证登录', name: 'rowFilter', width: "100",render:function(rowdata, rowindex, value){
					var h="";
					if(rowdata.rowFilter=='1'){
						h="是";
					}else{
						h="否";
					}
					return h;
				} },
				{ display: '是否验证权限', name: 'privilegess', width: "100",render:function(rowdata, rowindex, value){
					var h="";
					if(rowdata.privilegess=='1'){
						h="是";
					}else{
						h="否";
					}
					return h;
				} },
				{display: '操作',width: "150", render: function (rowdata, rowindex, value){
					var h="";
					h += "<a href='javascript:beginEdit(\"" + rowdata.urlId + "\")' style='color:teal'>编辑</a>&nbsp;|";
					h += "<a href='javascript:itemDel(\""+rowdata.urlId+"\")' style='color:teal' >删除</a> ";
					return h;
				}}],
				usePager:true,
				root:'rows',
				record:'total',
                url:"${path}/urlFilter/list",
				fixedCellHeight: false,
				rownumbers:true,
				clickToEdit:false,
				width: '100%',height:'99%'
			});
			Public.pageTab();//启用链接打开标签
		});
		function add(){
			parent.Public.addTab("","url新建","${path}/urlFilter/add");
		}
		function refresh(){
			window.location.reload();
		}
		function search(){
			grid.changePage("first");
			var params=$("#searchForm").serialize();
			grid.set("url","${path}/urlFilter/list?"+params);//重新设置url,grid会自动加载，不需要再用grid.loadData(),否则查询会执行两次;
			return false;
		}
		function beginEdit(urlId) { 
			parent.Public.addTab("ljbj"+urlId,"url编辑","${path}/urlFilter/edit?id="+urlId);
        }
		//删除
        function itemDel(urlId){
        	$.ligerDialog.confirm('确定删除？', function (yes) {
        		if(yes){
		        	parent.Public.ajaxPost("${path}/urlFilter/delete?id="+urlId,"",function(data){
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
				<label class="b-label" >名称：</label>
				<span class="ui-search">
					<input type="text" class="ui-input" name="name" value="${model.name}"/>
				</span>
				<label class="b-label" >是否登录验证：</label>
				<span class="ui-search">
					<select name="rowFilter">
						<option value="">--全部--</option>
                        <gt:option selectedValue="${model.rowFilter }" groupName="dic_state"></gt:option>
                    </select>
				</span>
				<label class="b-label" >是否权限验证：</label>
				<span class="ui-search">
					<select name="privilegess">
						<option value="">--全部--</option>
                        <gt:option selectedValue="${model.rowFilter }" groupName="dic_state"></gt:option>
                    </select>
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