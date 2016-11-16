<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();%>
<c:set var="path" value="<%=basePath %>"/>
<!DOCTYPE html>
<html>
<head>
    <title>Sorry，您撞到404页面了</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/main2.css"/>
    <style type="text/css">
        .mod-notfound
        {
            border-right: #e1e1e1 1px solid;
            border-top: #e1e1e1 1px solid;
            margin-top: 10px;
            background: #fff;
            border-left: #e1e1e1 1px solid;
            border-bottom: #e1e1e1 1px solid;
            text-align: center;
            border-radius: 10px;
        }
        
        .mod-notfound ul
        {
            margin: 0 ;
            padding: 0;
            list-style-position: inside;
            text-align: left;
            text-indent: 1em;
            }
        
        .mod-notfound li
        {
            height: 24px;
            line-height: 24px;
            }
            
        .mod-notfound li a
        {
            color: steelblue;
            }
    </style>
</head>
<body>
    <div class="mod-page-body">
        <div class="mod-page-main wordwrap clearfix">
            <div class="x-page-container">
                <div class="mod-notfound grid-98">
                    <img alt="404 NOT FOUND" class="img-notfound" src="${path }/resources/images/notfound.gif" style="width: 520px;height: 320px;" />
                    <p style="color:#e80;font-size: 24px; line-height: 70px">
                        -.-&nbsp;抱歉！您访问的页面请求无法满足！
                    </p>
                    <div style="margin: 0 auto;width: 500px; color: #999;">
                        <div style="text-align: left;"><h3>最有可能的原因：</h3></div>
                        <ul>
                        	<c:set var="error" value='<%=request.getAttribute("exception") %>' ></c:set>
                        	<c:if test="${not empty error }">
                            	<li>${error }</li>
                        	</c:if>
                            <li>您输入的网址可能不正确</li>                     
                            <li>页面可能已过期</li>
                        </ul>                        
                        <div style="margin: 20px 0 0 0;text-align: left;">您可以：</div>
                        <ul>
                            <li><a href="javascript:void(0);" onClick="history.back();">返回</a></li>                            
                            <li>请等待一段时间后再进入</li>
                            <li>请与管理员联系,^_^</li>
                        </ul>
                        <div>
                    </div>&nbsp;</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>