<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>url请求过滤</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
	<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
	<link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/base.css" rel="stylesheet" type="text/css" />
    
    <script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${path}/resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var oldParams=$("#sub_form").serialize();
			$("#btnSaveNext").bind("click",function(){
				var flag=checkUrl();
				if(!flag){
					var url="${path}/urlFilter/save";
					var params=$("#sub_form").serialize();
					parent.Public.ajaxPost(url,params,saveNext);
				}
			});
			$("#btnSave").bind("click",function(){
				var flag=checkUrl();
				if(!flag){
					var url="${path}/urlFilter/save";
					var params=$("#sub_form").serialize();
					parent.Public.ajaxPost(url,params,save);
				}
			});
			$("#btnClose").bind("click",function(){
				var params=$("#sub_form").serialize();
				if(oldParams!=params){
					$.ligerDialog.confirm('您有信息未保存，是否关闭？', function (yes) { 
						if(yes) parent.tab.removeSelectedTabItem();
					});
				}else{
					parent.tab.removeSelectedTabItem();					
				}
			});
		});
		function saveNext(data){
			data=eval(data);
			if(data.state){
				parent.Public.tips({type: 0, content : data.message});
				window.location.reload();
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
		}
		function save(data){
			data=eval(data);
			if(data.state){
				parent.Public.tips({type: 0, content : data.message});
				var tabId=parent.tab.getSelectedTabItemID();
				parent.Public.pageTabClose(tabId);
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
		}
		
		//检查当前用户
		function checkUrl(){
			var value=$("input[name='url']").val();
			var flag=true;
			$.ajax({
				type:"post",
				async:false,
				url:"${path}/urlfilter/check",
				data:{url:value,id:"${url.urlId}"},
        		dataType:'json',
        		contentType:"application/x-www-form-urlencoded; charset=utf-8",	
        		success:function(data){
        			if(data){
        				parent.Public.tips({type: 2, content : 'url已存在！'});
        				flag=true;
        			}else{
						flag=false;
        			}
        		},
        		error:function(){
        			flag=true;
        		}
			});
			return flag;
		}
	
	</script>

</head>
<body>
	<div id="man_zone" class="clear">
		<form id="sub_form"  method="post">
        <table class="op_tb" >
            <caption style="text-align: center;">
            	<c:if test="${empty url.urlId }">url新建</c:if>
            	<c:if test="${not empty url.urlId }">
            		url修改
            		<input type="hidden" name="urlId" value="${url.urlId }" /> 
            	</c:if>
            </caption>
            <tbody>
                <tr>
                    <td class="label">
                    	<label>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</label>
                    </td>
                    <td>
                        <input type="text" name="name" value="${url.name }"/>  
                    </td>
                </tr>
                <tr>
                    <td class="label">
                    	<label>请求路径：</label>
                    </td>
                    <td>
                        <input type="text" name="url" value="${url.url }"/>  
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	返回路劲：
                    </td>
                    <td>
                        <input type="text" name="returnUrl" value="${url.returnUrl }"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	请求参数：
                    </td>
                    <td>
                        <input type="text" name="params" value="${url.params }"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	权限值：
                    </td>
                    <td>
                        <input type="text" name="authoritys" value="${url.authoritys }"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	是否登录验证：
                    </td>
                    <td>
                        <select name="rowFilter">
                        	<gt:option selectedValue="${url.rowFilter }" groupName="dic_state"></gt:option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	是否权限验证：
                    </td>
                    <td>
                        <select name="privilegess">
                        	<gt:option selectedValue="${url.privilegess }" groupName="dic_state"></gt:option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	是否验证重复提交：
                    </td>
                    <td>
                        <select name="formtoken">
                        	<gt:option selectedValue="${url.formtoken }" groupName="dic_state"></gt:option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	是否加入流量统计：
                    </td>
                    <td>
                        <select name="pvtype">
                        	<gt:option selectedValue="${url.pvtype }" groupName="dic_state"></gt:option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       	描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：
                    </td>
                    <td>
                        <textarea name="signNote" cols="90" rows="5">${url.description }</textarea>
                    </td>
                </tr> 
                <tr>
					<td colspan="2" align="center">
						<c:if test="${empty url.urlId }">
							<input type="button" class="ui-btn ui-btn-sp" id="btnSaveNext" value="保存并新建" />&nbsp;&nbsp;
						</c:if>
						<input type="button" class="ui-btn ui-btn-sp" id="btnSave" value="保存" />&nbsp;&nbsp;
					    <input type="button" class="ui-btn-rad button blue" id="btnClose" value="关闭" />
                    </td>
				</tr>
            </tbody>
        </table>
        </form>
    </div>
</body>

</html>