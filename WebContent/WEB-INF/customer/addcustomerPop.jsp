<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
    <title>添加客户弹框</title>    
	<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
	<link href="${path}/resources/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="${path}/resources/css/base.css" rel="stylesheet" type="text/css" />
    
    <script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${path}/resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script type="text/javascript">
		function save(data){
			if($("#customerName").val() == ""){
				parent.Public.tips({type: 2, content : '客户名称不能为空'});
				return "";
			}
			var flag=checkUser();
			if(!flag){
				var url="${path}/customer/save";
				var params=$("#sub_form").serialize();
				$.ajax({  
				   type: "POST",
				   url: url,
				   data: params,
				   async:false,//同步
				   dataType: "json",  
				   success: function(data, status){  
					   //console.log(data);
					   if(data.state){
						   parent.parent.Public.tips({type: 1, content : data.message});
							return data.param;
						}else{
							parent.parent.Public.tips({type: 2, content : data.message});
							return "";
						}
				   	}
				});
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
				data:{name:name},
	    		dataType:'json',
	    		contentType:"application/x-www-form-urlencoded; charset=utf-8",	
	    		success:function(data){
	    			if(data){
	    				parent.parent.Public.tips({type: 2, content : '客户已存在！'});
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
                <tbody>
                    <tr>
                        <td class="label">
                           	 客户名称：
                        </td>
                        <td>
                            <input type="text" id="customerName" name="customerName" value="${model.customerName }" readonly="readonly"/>
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
                            <textarea name="customerNote" cols="100" rows="5" class="l-textarea" style="width: 500px;">${model.customerNote }</textarea>
                        </td>
                    </tr>
                </tbody>
            </table> 
            </form>
        </div>
    </body>
</html>