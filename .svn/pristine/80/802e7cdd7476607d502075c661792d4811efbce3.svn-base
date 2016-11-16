<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>资金导入</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link href="${path}/resources/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
	<link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
    
    <script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${path}/resources/uploadify/jquery.uploadify.min.js" type="text/javascript" ></script>
    <script src="${path}/resources/js/commonFN.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        var fileName="";
     	$(document).ready(function(){
     		setTimeout(function(){//解决goole游览器加载uploadify崩溃问题
	     		$("#file").uploadify({
	     			auto : true,     //默认自动不上传
	     			method   : 'post',
	     			button_image_url : '${path}/resources/uploadify/button_image_url.png',  //解决初始化时uploadify会请求下当前地址,会报404错误
	     			swf           : '${path}/resources/uploadify/uploadify.swf',  // uploadify.swf在项目中的路径,在引入的uploadify.mim.js加上时间戳，避免游览器崩溃
	     			uploader      : '${path}/upload/tempFile;jsessionid=${pageContext.session.id}',  // 后台UploadController处理上传的方法
	     			fileSizeLimit   : '2000KB',                  // The maximum size of an uploadable file in KB (Accepts units B KB MB GB if string, 0 for no limit)
	     			successTimeout  : 30,                 // The number of seconds to wait for Flash to detect the server's response after the file has finished uploading
	     			removeCompleted : true,              // Remove queue items from the queue when they are done uploading
	     			multi           : false,               // Allow multiple file selection in the browse dialog
	     			removeTimeout   : 1,
	     			fileTypeDesc:'*.xls;*.xlsx;',  
	     			fileTypeExts:'*.xls;*.xlsx;',  
	     			buttonText 		: '选择文件',
	     			height        : 30,
	     			width         : 120,
	     			onUploadSuccess : function(file, data, response){  //上传一次完成
	     				if(""!=data && data.length>0){
		     				fileName=data;
		     				parent.Public.ajaxPost("${path}/import/fundView",{path:fileName},initData);
	     				}else{
	     					parent.Public.tips({type: 1, content : "上传文件失败"});
	     				}
	     			}
	     		});
     		},10);
     		
     		$("#loadData").delegate("#btnSave","click",function(){
     			parent.Public.ajaxPost("${path}/import/fundImport",{path:fileName},save);
     		});
     	});

     	//加载数据
     	function initData(data){
     		if(data.state){
         		var table=$("#loadData");
         		$("#loadData tbody").remove();
         		$("#loadData tfoot").remove();
         		var _html="";
         		_html+='<tbody>';
         		for(var i=0;i<data.rows.length;i++){
         			_html+='<tr>';
         			_html+='	<td>'+(i+1)+'</td>';
         			_html+='	<td>'+data.rows[i].contractId+'</td>';
         			_html+='	<td>'+data.rows[i].fundType.replace(".0","")+'</td>';
         			_html+='	<td>'+data.rows[i].executeAmount+'</td>';
         			_html+='	<td>'+data.rows[i].executeTime+'</td>';
         			_html+='	<td>'+formateNull(data.rows[i].executeNote)+'</td>';
         			_html+='</tr>';
         		}
         		_html+='</tbody>';
         		_html+='<tfoot>';
         		_html+='	<tr>';
         		_html+='		<td colspan="6">';
         		_html+='			<input type="button" value="导入" class="ui-btn-rad button blue" id="btnSave">';
         		_html+='		</td>';
         		_html+='	</tr>';
         		_html+='</tfoot>';
         		$(table).append(_html);
     		}else{
     			parent.Public.tips({type: 1, content : data.message});
     		}
     	}
     	
     	function save(data){
			if(data.state){
				$("#btnSave").attr("disabled","disabled");
				parent.Public.tips({type: 0, content : data.message});
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
     	}
     </script>
</head>
<body>
	<div class="man_zone">
		<div class="fileList" style="padding:10px 10px">
			<input type="file" name="file" id="file" multiple="multiple"/>
			<p>1.excel列名：合同编号、资金类型、执行金额、执行时间、备注，顺序不可变，带'*'不能为空；</p>
			<p>2.资金类型用数字表示：
				<c:forEach items="${dicList }" var="item" varStatus="sta">
					${item.value}-${item.name}<c:if test="${!sta.last }">、</c:if>
				</c:forEach>
				，且该列应该为文本类型；</p>
			<p>3.一次性导入数据最好不要超过100条；</p>
			<p>4.选择文件后，会有预览界面，确认无误后再导入到数据库。</p>
		</div>

		<table id="loadData" class="op_list altrowstable">
			<caption>数据预览</caption>
			<thead>
				<tr>
					<th>序号</th>
					<th>*合同编号</th>
					<th>*资金类型</th>
					<th>*执行金额</th>
					<th>*执行时间</th>
					<th>备注</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>