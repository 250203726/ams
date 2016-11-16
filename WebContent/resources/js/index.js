var tab = null;
        var accordion = null;
        var tree = null;
        var tabItems = [];

        $(function () {
            //自定义步骤，写入一级菜单资源的 HTML，需在 LigerUI 布局方法之前完成
            var sideData = eval(sidebarData);
            var tempHtml = "";
            $.each(sideData, function () {
                tempHtml += "<div title='" + this.text + "' class='l-scroll'><ul data-code='"+ this.code +"' id='tree_" + this.code + "'></div>";
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
                    saveTabStatus();
                },
                onAfterRemoveTabItem: function (tabid) {
                    for (var i = 0; i < tabItems.length; i++) {
                        var o = tabItems[i];
                        if (o.tabid == tabid) {
                            tabItems.splice(i, 1);
                            saveTabStatus();
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
                var code = $(this).attr("data-code");
                //根据 code 过滤 navigateData 中属于该 code 的子菜单资源
                var myData = $.grep(navigateData, function(item) {
                    return item.code == code;
                }, false);

                //实例化一个ligerTree()
                $(this).ligerTree({
                    data: myData,
                    checkbox: false,
                    slide: false,
                    nodeWidth: 120,
                    attribute: ['nodename', 'url'],
                    onSelect: function (node) {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid) {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid);
                        }
                        f_addTab(tabid, node.data.text, node.data.url);
                    }
                });
            });

            tab = liger.get("framecenter");
            accordion = liger.get("accordion1");
            tree = liger.get("tree1");
            $("#pageloading").hide();
			
			//页签初始化
            pages_init();
        });
		
		//随window.resize调整高度
        function f_heightChanged(options) {
            if (tab)
                tab.addHeight(options.diff);
            if (accordion && options.middleHeight - 32 > 0)
                accordion.setHeight(options.middleHeight - 32);
        }
		
		//新建页签
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
		
		//
        function saveTabStatus() {
            $.cookie('liger-home-tab', JSON2.stringify(tabItems));
        }
		
		//取得url参数值
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
		
		//附加<link>资源给 iframe 框架
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
		
		//取得 <link> 资源
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
		
        // 时钟
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