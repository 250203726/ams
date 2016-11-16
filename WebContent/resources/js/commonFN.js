/*
 * Common Functions
 * */
/**
* 初始化时间控件
* param array: 对象数组
*/
function dataPickerInit(array) {
    $.each(array, function () {
        if (null != $(this) || "undefined" != $(this)) {
            $(this).datepicker({
                defaultDate: +0,
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                changeYear: true,
                showMonthAfterYear: true
            });
        }
    });
}

/**
 * 序列化
 */
$.fn.serializeObject = function()    
{    
   var o = {};    
   var a = this.serializeArray();    
   $.each(a, function() {    
       if (o[this.name]) {    
           if (!o[this.name].push) {    
               o[this.name] = [o[this.name]];    
           }    
           o[this.name].push(this.value || '');    
       } else {    
           o[this.name] = this.value || '';    
       }    
   });    
   return o;    
}; 

/**
 * 金额数字格式化
 * @param s：字符串
 * @param n：保留有效位小数
 * @returns {String}：12345.67格式化为 12,345.67
 */
function fmoney(s, n)   
{   
   n = n > 0 && n <= 20 ? n : 2;   
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";   
   var l = s.split(".")[0].split("").reverse(),   
   r = s.split(".")[1];   
   t = "";   
   for(i = 0; i < l.length; i ++ )   
   {   
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
   }   
   return t.split("").reverse().join("") + "." + r;   
}

//去除空格 
String.prototype.trim = function() 
{ 
  return this.replace(/\s+/g, ""); 
};

//去除换行 
String.prototype.clearBr = function()
{ 
    return this.replace(/[\r\n]/g, ""); 
};

/**
 * 替换所有
 * @param o:原字符
 * @param n:新字符
 */
String.prototype.replaceAll=function(o,n){
	 return this.replace(new RegExp(o,"gm"),n);
};
/**
 * 验证时间格式:2013-01-01
 */
String.prototype.validateDate=function(){
	var date=/^\d{4}[-]\d{2}[-]\d{2}$/;
	return date.test(this);
};
/**
 * 验证合法的数字
 */
String.prototype.validateNumber=function(){
	var double=/^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/;
	return double.test(this);
};
/**
 * 验证是否为空
 */
function isEmpty(str){
	if(typeof(str)=="undefined" || str=='' || str=='null' || str==null || str.trim().length==0)
	return true;
};
/**
 * 验证是否为空
 */
function isNotEmpty(str){
	return !isEmpty(str);
};
	
//是否为由数字组成的字符串 
function is_digitals(str) 
{ 
	var reg=/^[0-9]*$/;//匹配整数 
	return reg.test(str);   
}
/**
 * 格式化null值或未定义的字段值
 * @param str
 */
function formateNull(str){
	if(null==str || undefined==str) return "";
	else return str;
}
