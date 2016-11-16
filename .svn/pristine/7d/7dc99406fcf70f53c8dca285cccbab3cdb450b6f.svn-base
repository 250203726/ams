<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
    <title>客户信息编辑</title>    
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
				var flag=checkUser();
				if(!flag){
					var url="${path}/customer/save";
					var params=$("#sub_form").serialize();
					parent.Public.ajaxPost(url,params,saveNext);
				}
			});
			$("#btnSave").bind("click",function(){
				var flag=checkUser();
				if(!flag){
					var url="${path}/customer/save";
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
				parent.Public.reloadTab(parent.SYSTEM.khlb);
				parent.Public.tips({type: 0, content : data.message});
				window.location.reload();
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
		}
		function save(data){
			data=eval(data);
			if(data.state){
				parent.Public.reloadTab(parent.SYSTEM.khlb);
				parent.Public.tips({type: 0, content : data.message});
				var tabId=parent.tab.getSelectedTabItemID();
				parent.Public.addTab("khxx"+data.param,"客户详细","${path}/customer/detail?id="+data.param);
				parent.Public.pageTabClose(tabId);
			}else{
				parent.Public.tips({type: 1, content : data.message});
			}
		}
		
		//检查当前客户
		function checkUser(){
			var name=$("#customerName").val();
			var flag=true;
			$.ajax({
				type:"post",
				async:false,
				url:"${path}/customer/checkCustomer",
				data:{name:name,id:"${model.customerId}"},
	    		dataType:'json',
	    		contentType:"application/x-www-form-urlencoded; charset=utf-8",	
	    		success:function(data){
	    			if(data){
	    				parent.Public.tips({type: 2, content : '客户已存在！'});
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
        <div class="man_zone">
            <form id="sub_form" action="${path }/customer/save" method="post">
            <table class="op_tb">
            	<caption style="text-align: center;">
            		<c:choose>
            			<c:when test="${empty model.customerId}">客户信息录入</c:when>
            			<c:otherwise>
            				客户信息修改
            				<input type="hidden" name="customerId" value="${model.customerId }" />
            			</c:otherwise>
            		</c:choose>
            	</caption>
                <tbody>
                    <tr>
                        <td class="label">
                           	 客户名称：
                        </td>
                        <td>
                            <input type="text" id="customerName" name="customerName" value="${model.customerName }"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                                                                             机构代码：
                        </td>
                        <td>
                            <input type="text" name="customerCode" value="${model.customerCode }"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            	联&nbsp;系&nbsp;人：
                        </td>
                        <td>
                            <input type="text" name="contactPerson" value="${model.contactPerson }"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            	联系电话：
                        </td>
                        <td>
                            <input type="text" name="contatctPhone" value="${model.contatctPhone }"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            	客户地址：
                        </td>
                        <td>
                            <input type="text" name="contatctAddress" value="${model.contatctAddress }"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                                	备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：
                        </td>
                        <td>
                            <textarea name="customerNote" cols="100" rows="5" class="l-textarea" style="width: 600px;">${model.customerNote }</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="toolbottom" align="center">
                            <c:if test="${empty model.customerId }">
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