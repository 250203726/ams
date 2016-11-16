//系统参数控制
var SYSTEM = {
	version: 1,
	hqlb:'hqlb',//会签列表
	htlb:'htlb',//合同列表
	dwlb:'dwlb',//单位列表	
	khlb:'khlb',//客户列表
	xmjllb:'xmjllb',//项目经理列表
	jslb:'jslb',//角色列表
	yhlb:'yhlb',//用户列表
	ljlb:'ljlb',//路劲列表
	dqkht:'dqkht',//待切块合同
	zjfkzx:'zjfkzx',//资金付款执行
	sfkcx:'sfkcx',//收付款查询
	gcjdlb:'gcjdlb',//工程进度列表
	sgdlb:'sgdlb',//施工单列表
	bzgctj:'bzgctj',//报装工程统计
	fbdwtj:'fbdwtj',//分包单位统计
	rwdjtz:'rwdjtz',//任务登记台账
	gcxmqd:'gcxmqd'//工程项目清单
};

$(function(){
	/*
	 * 判断IE6，提示使用高级版本
	 */
	if(Public.isIE6) {
		 var Oldbrowser = {
			 init: function(){
				 this.addDom();
			 },
			 addDom: function() {
			 	var html = $('<div id="browser">您使用的浏览器版本过低，影响网页性能，建议您换用<a href="http://www.google.cn/chrome/intl/zh-CN/landing_chrome.html" target="_blank">谷歌</a>、<a href="http://download.microsoft.com/download/4/C/A/4CA9248C-C09D-43D3-B627-76B0F6EBCD5E/IE9-Windows7-x86-chs.exe" target="_blank">IE9</a>、或<a href=http://firefox.com.cn/" target="_blank">火狐浏览器</a>，以便更好的使用！<a id="bClose" title="关闭">x</a></div>').insertBefore('#pageloading').slideDown(500); 
			 	this._colse();
			 },
			 _colse: function() {
				  $('#bClose').click(function(){
						 $('#browser').remove();
				 });
			 }
		 };
		 Oldbrowser.init();
	};
});

var Public = Public || {};
var Business = Business || {};
Public.isIE6 = !window.XMLHttpRequest;	//ie6

//设置表格宽高
Public.setGrid = function(adjustH, adjustW){
	var adjustH = adjustH || 65;
	var adjustW = adjustW || 20;
	var gridW = $(window).width() - adjustW, gridH = $(window).height() - $(".grid-wrap").offset().top - adjustH;
	return {
		w : gridW,
		h : gridH
	};
};
//重设表格宽高
Public.resizeGrid = function(adjustH, adjustW){
	var grid = $("#grid");
	var gridWH = Public.setGrid(adjustH, adjustW);
	grid.jqGrid('setGridHeight', gridWH.h);
	grid.jqGrid('setGridWidth', gridWH.w);
};
//自定义报表宽度初始化以及自适应
Public.initCustomGrid = function(tableObj){
	//去除报表原始定义的宽度
	$(tableObj).css("width") && $(tableObj).attr("width","auto");
	//获取报表宽度当做最小宽度
	var _minWidth = $(tableObj).outerWidth();
	$(tableObj).css("min-width",_minWidth+"px");
	//获取当前window对象的宽度作为报表原始的宽度
	$(tableObj).width($(window).width() - 74);
	//设置resize事件
	var _throttle = function(method,context){
		clearTimeout(method.tid);
		method.tid = setTimeout(function(){
			method.call(context);
		},100);
	};
	var _resize = function(){
		$(tableObj).width($(window).width() - 74);
	};
	$(window).resize(function() {
		_throttle(_resize);
	});
};

//操作项格式化，适用于有“修改、删除”操作的表格
Public.operFmatter = function (val, opt, row) {
	var html_con = '<div class="operating" data-id="' + row.id + '"><span class="ui-icon ui-icon-pencil" title="修改"></span><span class="ui-icon ui-icon-trash" title="删除"></span></div>';
	return html_con;
};

Public.billsOper = function (val, opt, row) {
	var html_con = '<div class="operating" data-id="' + opt.rowId + '"><span class="ui-icon ui-icon-plus" title="新增行"></span><span class="ui-icon ui-icon-trash" title="删除行"></span></div>';
	return html_con;
};

Public.dateCheck = function(){
	$('.ui-datepicker-input').bind('focus', function(e){
		$(this).data('original', $(this).val());
	}).bind('blur', function(e){
		var reg = /((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/;
		var _self = $(this);
		setTimeout(function(){
			if(!reg.test(_self.val())) {
				parent.Public.tips({type:1, content : '日期格式有误！如：2013-08-08。'});
				_self.val(_self.data('original'));
			};
		}, 10);

	});
};

//根据之前的编码生成下一个编码
Public.getSuggestNum = function(prevNum){
	if (prevNum == '' || !prevNum) {
		return '';
	}
	var reg = /^([a-zA-Z0-9\-_]*[a-zA-Z\-_]+)?(\d+)$/;
	var match = prevNum.match(reg);
	if (match) {
		var prefix = match[1] || '';
		var prevNum = match[2];
		var num = parseInt(prevNum, 10) + 1;
		var delta = prevNum.toString().length - num.toString().length;
		if (delta > 0) {
			for (var i = 0; i < delta; i++) {
				num = '0' + num;
			}
		}
		return prefix + num;
	} else {
		return '';
	}
};

Public.bindEnterSkip = function(obj, func){
	var args = arguments;
	$(obj).on('keydown', 'input:visible:not(:disabled)', function(e){
		if (e.keyCode == '13') {
			var inputs = $(obj).find('input:visible:not(:disabled)');
			var idx = inputs.index($(this));
			idx = idx + 1;
			if (idx >= inputs.length) {
				if (typeof func == 'function') {
					var _args = Array.prototype.slice.call(args, 2 );
					func.apply(null,_args);
				}
			} else {
				inputs.eq(idx).focus();
			}
		}
	});
};

/*获取URL参数值*/
Public.getRequest = Public.urlParam = function() {
   var param, url = location.search, theRequest = {};
   if (url.indexOf("?") != -1) {
      var str = url.substr(1);
      strs = str.split("&");
      for(var i = 0, len = strs.length; i < len; i ++) {
		 param = strs[i].split("=");
         theRequest[param[0]]=decodeURIComponent(param[1]);
      }
   }
   return theRequest;
};
/*
  通用post请求，返回json
  url:请求地址， params：传递的参数{...}， callback：请求成功回调
*/ 
Public.ajaxPost = function(url, params, callback){    
	$.ajax({  
	   type: "POST",
	   url: url,
	   data: params, 
	   dataType: "json",  
	   success: function(data, status){  
		   callback(data);
	   },  
	   error: function(err){  
		   if(null!=err.status && "undefined"!=err.status){
			   if("998"==err.status){
				   parent.Public.tips({type: 1, content : '您没有权限，请于管理员联系！'});
			   }else{
				   parent.Public.tips({type: 1, content : '操作失败了哦，请检查您的网络链接！'});
			   }
		   }else{
			   parent.Public.tips({type: 1, content : '操作失败了哦，请检查您的网络链接！'});
		   }
	   }  
	});  
};  
Public.ajaxGet = function(url, params, callback){    
	$.ajax({  
	   type: "GET",
	   url: url,
	   dataType: "json",  
	   data: params,    
	   success: function(data, status){  
		   callback(data);  
	   },   
	   error: function(err){  
		   if(null!=err.status && "undefined"!=err.status){
			   if("998"==err.status){
				   parent.Public.tips({type: 1, content : '您没有权限，请于管理员联系！'});
			   }else{
				   parent.Public.tips({type: 1, content : '操作失败了哦，请检查您的网络链接！'});
			   }
		   }else{
			   parent.Public.tips({type: 1, content : '操作失败了哦，请检查您的网络链接！'});
		   }
	   }  
	});  
};

/*操作提示*/
Public.tips = function(options){ return new Public.Tips(options); };
Public.Tips = function(options){
	var defaults = {
		renderTo: 'body',
		type : 0,
		autoClose : true,
		removeOthers : true,
		time : undefined,
		top : 15,
		onClose : null,
		onShow : null
	};
	this.options = $.extend({},defaults,options);
	this._init();
	
	!Public.Tips._collection ?  Public.Tips._collection = [this] : Public.Tips._collection.push(this);
	
};

Public.Tips.removeAll = function(){
	try {
		for(var i=Public.Tips._collection.length-1; i>=0; i--){
			Public.Tips._collection[i].remove();
		}
	}catch(e){}
};

Public.Tips.prototype = {
	_init : function(){
		var self = this,opts = this.options,time;
		if(opts.removeOthers){
			Public.Tips.removeAll();
		}

		this._create();

		this.closeBtn.bind('click',function(){
			self.remove();
		});

		if(opts.autoClose){
			time = opts.time || opts.type == 1 ? 5000 : 3000;
			window.setTimeout(function(){
				self.remove();
			},time);
		}

	},
	
	_create : function(){
		var opts = this.options;
		this.obj = $('<div class="ui-tips"><i></i><span class="close"></span></div>').append(opts.content);
		this.closeBtn = this.obj.find('.close');
		
		switch(opts.type){
			case 0 : 
				this.obj.addClass('ui-tips-success');
				break ;
			case 1 : 
				this.obj.addClass('ui-tips-error');
				break ;
			case 2 : 
				this.obj.addClass('ui-tips-warning');
				break ;
			default :
				this.obj.addClass('ui-tips-success');
				break ;
		}
		
		this.obj.appendTo('body').hide();
		this._setPos();
		if(opts.onShow){
			opts.onShow();
		}

	},

	_setPos : function(){
		var self = this, opts = this.options;
		if(opts.width){
			this.obj.css('width',opts.width);
		}
		var h =  this.obj.outerHeight(),winH = $(window).height(),scrollTop = $(window).scrollTop();
		//var top = parseInt(opts.top) ? (parseInt(opts.top) + scrollTop) : (winH > h ? scrollTop+(winH - h)/2 : scrollTop);
		var top = parseInt(opts.top) + scrollTop;
		this.obj.css({
			position : Public.isIE6 ? 'absolute' : 'fixed',
			left : '50%',
			top : top,
			zIndex : '9999',
			marginLeft : -self.obj.outerWidth()/2	
		});

		window.setTimeout(function(){
			self.obj.show().css({
				marginLeft : -self.obj.outerWidth()/2
			});
		},150);

		if(Public.isIE6){
			$(window).bind('resize scroll',function(){
				var top = $(window).scrollTop() + parseInt(opts.top);
				self.obj.css('top',top);
			});
		}
	},

	remove : function(){
		var opts = this.options;
		this.obj.fadeOut(200,function(){
			$(this).remove();
			if(opts.onClose){
				opts.onClose();
			}
		});
	}
};
//数值显示格式转化
Public.numToCurrency = function(val, dec) {
	val = parseFloat(val);	
	dec = dec || 2;	//小数位
	if(val === 0 || isNaN(val)){
		return '';
	}
	val = val.toFixed(dec).split('.');
	var reg = /(\d{1,3})(?=(\d{3})+(?:$|\D))/g;
	return val[0].replace(reg, "$1,") + '.' + val[1];
};
//数值显示
Public.currencyToNum = function(val){
	var val = String(val);
	if ($.trim(val) == '') {
		return 0;
	}
	val = val.replace(/,/g, '');
	val = parseFloat(val);
	return isNaN(val) ? 0 : val;
};
//只允许输入数字
Public.numerical = function(e){
	var allowed = '0123456789.-', allowedReg;
	allowed = allowed.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, '\\$&');
	allowedReg = new RegExp('[' + allowed + ']');
	var charCode = typeof e.charCode != 'undefined' ? e.charCode : e.keyCode; 
	var keyChar = String.fromCharCode(charCode);
	if(!e.ctrlKey && charCode != 0 && ! allowedReg.test(keyChar)){
		e.preventDefault();
	};
};

//限制只能输入允许的字符，不支持中文的控制
Public.limitInput = function(obj, allowedReg){
    var ctrlKey = null;
    obj.css('ime-mode', 'disabled').on('keydown',function(e){
        ctrlKey = e.ctrlKey;
    }).on('keypress',function(e){
        allowedReg = typeof allowedReg == 'string' ? new RegExp(allowedReg) : allowedReg;
        var charCode = typeof e.charCode != 'undefined' ? e.charCode : e.keyCode; 
        var keyChar = $.trim(String.fromCharCode(charCode));
        if(!ctrlKey && charCode != 0 && charCode != 13 && !allowedReg.test(keyChar)){
            e.preventDefault();
        } 
    });
};
//限制输入的字符长度
Public.limitLength = function(obj, count){
	obj.on('keyup',function(e){
        if(count < obj.val().length){
        	e.preventDefault();
        	obj.val(obj.val().substr(0,count));
        }
    });
};
/*批量绑定页签打开*/
Public.pageTab = function() {
	$(document).on('click', '[rel=pageTab]', function(e){
		e.preventDefault();
		var tabid = $(this).attr('data-tabid'), url = $(this).attr('href'), showClose = $(this).attr('data-showClose'), text = $(this).attr('data-tabTxt') || $(this).text(),parentOpen = $(this).attr('data-parentOpen');
		if(null==tabid || undefined==tabid || ""==tabid) tabid = new Date().getTime();
		if(parentOpen){
			parent.tab.addTabItem({tabid: tabid, text: text, url: url, showClose: showClose});
		} else {
			tab.addTabItem({tabid: tabid, text: text, url: url, showClose: showClose});
		}
	});
};
Public.addTab=function(tabid,text,url){
	if(null==tabid || undefined==tabid || ""==tabid) tabid = new Date().getTime();
	tab.addTabItem({tabid: tabid, text: text, url: url, showClose: true});
};
/*关闭tab页*/
Public.pageTabClose=function(tabId){
	if(""==tabId || null== tabId || undefined==tabId){
		tabId=tab.getSelectedTabItemID();
	}
	if(tab.isTabItemExist(tabId))
		tab.removeTabItem(tabId);
};
/*刷新选项卡*/
Public.reloadTab=function(tabId){
	if(tab.isTabItemExist(tabId)){
		tab.reload(tabId);
	}
};

$.fn.artTab = function(options) {
  var defaults = {};
  var opts = $.extend({}, defaults, options);
  var callback = opts.callback || function () {};
  this.each(function(){
	  var $tab_a =$("dt>a",this);
	  var $this = $(this);
	  $tab_a.bind("click", function(){
		  var target = $(this);
		  target.siblings().removeClass("cur").end().addClass("cur");
		  var index = $tab_a.index(this);
		  var showContent = $("dd>div", $this).eq(index);
		  showContent.siblings().hide().end().show();
		  callback(target, showContent, opts);
	  });
	  if(opts.tab)
		  $tab_a.eq(opts.tab).trigger("click");
	  if(location.hash) {
		  var tabs = location.hash.substr(1);
		  $tab_a.eq(tabs).trigger("click");
	  }
  });	  
};

$.fn.enterKey = function() {
	this.each(function() {
		$(this).keydown(function(e) {
			if (e.which == 13) {
				var ref = $(this).data("ref");
				if (ref) {
					$('#' + ref).select().focus().click();
				}
				else {
					eval($(this).data("enterKeyHandler"));
				}
			}
		});
	});
};
