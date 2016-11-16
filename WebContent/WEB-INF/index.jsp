<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" ></meta>
	<title>管理系统</title>
	<link rel="icon" href="favicon.ico" type="image/x-icon">
	<link rel="shoucut icon" href="favicon.ico" type="image/x-icon">
	<link href="${path}/resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css">
	<link href="${path}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link href="${path}/resources/css/ui.css" rel="stylesheet" type="text/css" />
	<script src="${path}/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="${path}/resources/ligerUI/js/ligerui.all.js"></script>
	<script src="${path}/resources/js/jquery.cookie.js" type="text/javascript"></script> 
	<script src="${path}/resources/js/config.js" type="text/javascript"></script>
	<script type="text/javascript">
		var tab = null;
		var accordion = null;
		var tree = null;
		var tabItems = [];
		var sidebarData =JSON.parse('${sidebarData}');

       var navigateData = JSON.parse('${navigateData}');		
		$(function () {
			//自定义步骤，写入一级菜单资源的 HTML，需在 LigerUI 布局方法之前完成
			var tempHtml = "";
			$.each(sidebarData, function () {
				tempHtml += "<div title='" + this.name + "' class='1-scroll'>"
						   +"	<ul data-module='"+ this.moduleId +"' id='tree_" + this.menuId + "' style='margin-top:1px;'>"
						   +"</div>";
			});
			$("#accordion1").html(tempHtml);
	
			//布局
			$("#layout1").ligerLayout({ leftWidth: 190, height: '100%', heightDiff: -34, space: 0, onHeightChanged: f_heightChanged });
	
			var height = $(".l-layout-center").height();
	
			//Tab
			$("#framecenter").ligerTab({
				height: height,
				showSwitchInTab: true,
				showSwitch: true,
				onAfterAddTabItem: function (tabdata) {
					tabItems.push(tabdata);
					//saveTabStatus();
				},
				onAfterRemoveTabItem: function (tabid) {
					for (var i = 0; i < tabItems.length; i++) {
						var o = tabItems[i];
						if (o.tabid == tabid) {
							tabItems.splice(i, 1);
							//saveTabStatus();
							break;
						}
					}
				},
				onReload: function (tabdata) {
					var tabid = tabdata.tabid;
				}
			});
	
			//面板
			$("#accordion1").ligerAccordion({
				height: height - 32, speed: null
			});
	
			$(".l-link").hover(function () {
				$(this).addClass("l-link-over");
			}, function () {
				$(this).removeClass("l-link-over");
			});
	
			//Build Tress 菜单资源树
			var treeArray = $("#accordion1>.l-accordion-content>ul");
			$.each(treeArray, function () {
				//取得某一个 ul#tree 的code
				var moduleId = $(this).attr("data-module");
				//根据 code 过滤 navigateData 中属于该 code 的子菜单资源
				var myData = $.grep(navigateData, function(item) {
					return item.moduleId == moduleId;
				}, false);
	
				//实例化一个ligerTree()
				$(this).ligerTree({
					data: myData,
					isExpand: false,
					checkbox: false,
					slide: true,
					btnClickToToggleOnly:false,
					nodeWidth: 120,
					idFieldName :'menuId',
			        parentIDFieldName :'parentId',
			        textFieldName:'name',
					onClick: function (node) {
						if (!node.data.url) return;
						var tabid = node.data.menuId;
						if (!tabid) {
							tabid = new Date().getTime();
							$(node.target).attr("tabid", tabid);
						}
						f_addTab(tabid, node.data.name, "${path}"+node.data.url);
					}
				});
			});
	
			tab = liger.get("framecenter");
			accordion = liger.get("accordion1");
			tree = liger.get("tree1");
			$("#pageloading").hide();
			
			//页签初始化
			//pages_init();			
		});
		
		//高度适应
        function f_heightChanged(options) {
            if (tab)
                tab.addHeight(options.diff);
            if (accordion && options.middleHeight - 32 > 0)
                accordion.setHeight(options.middleHeight - 32);
        }
		
		//添加页签
        function f_addTab(tabid, text, url) {
            tab.addTabItem({
                tabid: tabid,
                text: text,
                url: url
            });
        }
        
		//页签初始化
        function pages_init() {
            var tabJson = $.cookie('liger-home-tab');
            if (tabJson) {
                var tabitems = JSON2.parse(tabJson);
                for (var i = 0; tabitems && tabitems[i]; i++) {
                    f_addTab(tabitems[i].tabid, tabitems[i].text, tabitems[i].url);
                }
            }
        }
		
		//保存页签状态
        function saveTabStatus() {
            $.cookie('liger-home-tab', JSON2.stringify(tabItems));
        }
		
		//获取 Url 参数值
        function getQueryString(name) {
            var nowUrl = document.location.search.slice(1), qArray = nowUrl.split('&');
            for (var i = 0; i < qArray.length; i++) {
                var vArray = qArray[i].split('=');
                if (vArray[0] == name) {
                    return vArray[1];
                }
            }
            return false;
        }
		
		//附加 <link> 资源
        function attachLinkToFrame(iframeId, filename) {
            if (!window.frames[iframeId]) return;
            var head = window.frames[iframeId].document.getElementsByTagName('head').item(0);
            var fileref = window.frames[iframeId].document.createElement("link");
            if (!fileref) return;
            fileref.setAttribute("rel", "stylesheet");
            fileref.setAttribute("type", "text/css");
            fileref.setAttribute("href", filename);
            head.appendChild(fileref);
        }
		
		//获取 <link> 资源
        function getLinkPrevHref(iframeId) {
            if (!window.frames[iframeId]) return;
            var head = window.frames[iframeId].document.getElementsByTagName('head').item(0);
            var links = $("link:first", head);
            for (var i = 0; links[i]; i++) {
                var href = $(links[i]).attr("href");
                if (href && href.toLowerCase().indexOf("ligerui") > 0) {
                    return href.substring(0, href.toLowerCase().indexOf("Content"));
                }
            }
        }
		
        //时钟
        function tick() {
            var hours, minutes, seconds;
            var intHours, intMinutes, intSeconds;
            var today;
            today = new Date();
            intHours = today.getHours();
            intMinutes = today.getMinutes();
            intSeconds = today.getSeconds();

            if (intHours == 0) {
                hours = "00:";
            } else if (intHours < 10) {
                hours = "0" + intHours + ":";
            } else {
                hours = intHours + ":";
            }

            if (intMinutes < 10) {
                minutes = "0" + intMinutes + ":";
            } else {
                minutes = intMinutes + ":";
            }
            if (intSeconds < 10) {
                seconds = "0" + intSeconds + " ";
            } else {
                seconds = intSeconds + " ";
            }
            var timeString = hours + minutes + seconds;

            var weekday = new Array(7);
            weekday[0] = "星期日";
            weekday[1] = "星期一";
            weekday[2] = "星期二";
            weekday[3] = "星期三";
            weekday[4] = "星期四";
            weekday[5] = "星期五";
            weekday[6] = "星期六";
            
            document.getElementById("clock").innerHTML = weekday[today.getDay()] + "&nbsp;&nbsp;&nbsp;&nbsp;" + timeString;
            window.setTimeout("tick();", 1000);
        }
        window.onload = tick;	
	</script>
</head>
<body>
    <div id="pageloading">
    </div>
    <div id="topmenu" class="l-topmenu">
        <div class="topmask">
            <div class="l-topmenu-logo">
                <div class="sysname">
                	<span class="spliter">
                    	<img src="${path}/resources/images/sysicon.gif" width="30" height="22" alt="公司Logo" />
                    </span>
                    <span class="h2">管理系统</span>
                </div>
            </div>
            <div class="l-topmenu-welcome fix_profile" data-toggle="dropdown">
                <label id="wel_label" class="wel_label">欢迎您：
                	<a>
                		${USERSESSION.user.userName }
                		<span class="caret"></span>
                	</a>
                </label>
               	<ul class="t_profile" id="dropdown-menu" style="display: none;">
               		<li class="fir">
               			<a class="myaccount" id="userInfo">
	               			<span class="icon"></span>
	               			<span>我的资料</span>
               			</a>
               		</li>
               		<li>
               			<a class="modifypwd" id="changePwd">
               				<span class="icon"></span>
	               			<span>修改密码</span>               			
               			</a>
               		</li>
               		<li>
               			<a class="logout" href="${path }/logonOut">
               				<span class="icon"></span>
	               			<span>退&nbsp;&nbsp;出</span>               			
               			</a>
               		</li>
               	</ul>
            </div>
            <div class="l-topmenu-welcome">            	
                <span class="wel_links">
                    <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1003535092&amp;site=qq&amp;menu=yes" class="icn_help" title="点击求助： @三峡大学计算机与信息学院" target="_blank">
                        在线求助
                    </a>
                </span>
            </div>
        </div>
    </div>
    <div id="layout1" style="width: 100%; margin: 0 auto;">
        <div position="left" title="系统功能菜单" id="accordion1" style="overflow-y:auto;">
            
        </div>
        <div position="center" id="framecenter">
            <div tabid="home" title="<span class='icn_home'>我的主页</sapn>" style="height: 300px">
                
                <iframe frameborder="0" name="home" id="home" src="${path }/main"></iframe>
            </div>
        </div>
    </div>
    <div class="l-bottom">
        <span id="clock"></span>
    </div>
    <div style="display: none">
    </div>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("div[data-toggle='dropdown']").mouseenter(function(){
    			$("#dropdown-menu").toggle();
    			$(this).toggleClass("profileHover");    			
    		}).mouseleave(function(){
    			$("#dropdown-menu").toggle();
    			$(this).toggleClass("profileHover"); 
    		});
    		$("#userInfo").click(function(e){
    			f_addTab("grzl", "个人资料", "${path}/user/userInfo?id=${USERSESSION.user.userId}");
    			e.preventDefault();
    		});
    		$("#changePwd").click(function(e){
    			f_addTab("xgmm", "修改密码", "${path}/user/changePwd");
    			e.preventDefault();
    		});
    	});
    </script>
</body>
</html>