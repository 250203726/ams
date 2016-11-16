
// JavaScript Document
// 公历农历日期
function RunGLNL() {
    var today = new Date();
    var d = new Array("周日", "周一", "周二", "周三", "周四", "周五", "周六");
    var dddd = d[today.getDay()];
    dddd = dddd + "&nbsp;&nbsp;" + (CnDateofDateStr(today)); //显示农历
    dddd = dddd + "&nbsp;&nbsp;" + SolarTerm(today); //显示二十四节气
    document.write(today.getFullYear() + "年");
    document.write(today.getMonth() + 1 + "月");
    document.write(today.getDate() + "日 ");
    document.write(dddd);
}
function DaysNumberofDate(dateGl) {
    return parseInt((Date.parse(dateGl) - Date.parse(dateGl.getFullYear() + "/1/1")) / 86400000) + 1;
}
function CnDateofDate(dateGl) {
    var cnData = new Array(
0x16, 0x2a, 0xda, 0x00, 0x83, 0x49, 0xb6, 0x05, 0x0e, 0x64, 0xbb, 0x00, 0x19, 0xb2, 0x5b, 0x00,
0x87, 0x6a, 0x57, 0x04, 0x12, 0x75, 0x2b, 0x00, 0x1d, 0xb6, 0x95, 0x00, 0x8a, 0xad, 0x55, 0x02,
0x15, 0x55, 0xaa, 0x00, 0x82, 0x55, 0x6c, 0x07, 0x0d, 0xc9, 0x76, 0x00, 0x17, 0x64, 0xb7, 0x00,
0x86, 0xe4, 0xae, 0x05, 0x11, 0xea, 0x56, 0x00, 0x1b, 0x6d, 0x2a, 0x00, 0x88, 0x5a, 0xaa, 0x04,
0x14, 0xad, 0x55, 0x00, 0x81, 0xaa, 0xd5, 0x09, 0x0b, 0x52, 0xea, 0x00, 0x16, 0xa9, 0x6d, 0x00,
0x84, 0xa9, 0x5d, 0x06, 0x0f, 0xd4, 0xae, 0x00, 0x1a, 0xea, 0x4d, 0x00, 0x87, 0xba, 0x55, 0x04
);
    var cnMonth = new Array();
    var cnMonthDays = new Array();
    var cnBeginDay;
    var leapMonth;
    var bytes = new Array();
    var i;
    var cnMonthData;
    var daysCount;
    var cnDaysCount;
    var resultMonth;
    var resultDay;
    var yyyy = dateGl.getFullYear();
    var mm = dateGl.getMonth() + 1;
    var dd = dateGl.getDate();
    if (yyyy < 100) yyyy += 1900;
    if ((yyyy < 1997) || (yyyy > 2020)) {
        return 0;
    }
    bytes[0] = cnData[(yyyy - 1997) * 4];
    bytes[1] = cnData[(yyyy - 1997) * 4 + 1];
    bytes[2] = cnData[(yyyy - 1997) * 4 + 2];
    bytes[3] = cnData[(yyyy - 1997) * 4 + 3];
    if ((bytes[0] & 0x80) != 0) { cnMonth[0] = 12; }
    else { cnMonth[0] = 11; }
    cnBeginDay = (bytes[0] & 0x7f);
    cnMonthData = bytes[1];
    cnMonthData = cnMonthData << 8;
    cnMonthData = cnMonthData | bytes[2];
    leapMonth = bytes[3];
    for (i = 15; i >= 0; i--) {
        cnMonthDays[15 - i] = 29;
        if (((1 << i) & cnMonthData) != 0) {
            cnMonthDays[15 - i]++;
        }
        if (cnMonth[15 - i] == leapMonth) {
            cnMonth[15 - i + 1] = -leapMonth;
        }
        else {
            if (cnMonth[15 - i] < 0) { cnMonth[15 - i + 1] = -cnMonth[15 - i] + 1; }
            else { cnMonth[15 - i + 1] = cnMonth[15 - i] + 1; }
            if (cnMonth[15 - i + 1] > 12) { cnMonth[15 - i + 1] = 1; }
        }
    }
    daysCount = DaysNumberofDate(dateGl) - 1;
    if (daysCount <= (cnMonthDays[0] - cnBeginDay)) {
        if ((yyyy > 1901) && (CnDateofDate(new Date((yyyy - 1) + "/12/31")) < 0)) {
            resultMonth = -cnMonth[0];
        }
        else { resultMonth = cnMonth[0]; }
        resultDay = cnBeginDay + daysCount;
    }
    else {
        cnDaysCount = cnMonthDays[0] - cnBeginDay;
        i = 1;
        while ((cnDaysCount < daysCount) && (cnDaysCount + cnMonthDays[i] < daysCount)) {
            cnDaysCount += cnMonthDays[i];
            i++;
        }
        resultMonth = cnMonth[i];
        resultDay = daysCount - cnDaysCount;
    }
    if (resultMonth > 0) {
        return resultMonth * 100 + resultDay;
    }
    else { return resultMonth * 100 - resultDay; }
}
function CnYearofDate(dateGl) {
    var yyyy = dateGl.getFullYear();
    var mm = dateGl.getMonth() + 1;
    var cnMm = parseInt(Math.abs(CnDateofDate(dateGl)) / 100);
    if (yyyy < 100) yyyy += 1900;
    if (cnMm > mm) yyyy--;
    yyyy -= 1864;
    return CnEra(yyyy) + "年";
}
function CnMonthofDate(dateGl) {
    var cnMonthStr = new Array("零", "正", "二", "三", "四", "五", "六", "七", "八", "九", "十", "冬", "腊");
    var month;
    month = parseInt(CnDateofDate(dateGl) / 100);
    if (month < 0) { return "闰" + cnMonthStr[-month] + "月"; }
    else { return cnMonthStr[month] + "月"; }
}
function CnDayofDate(dateGl) {
    var cnDayStr = new Array("零",
"初一", "初二", "初三", "初四", "初五",
"初六", "初七", "初八", "初九", "初十",
"十一", "十二", "十三", "十四", "十五",
"十六", "十七", "十八", "十九", "二十",
"廿一", "廿二", "廿三", "廿四", "廿五",
"廿六", "廿七", "廿八", "廿九", "三十");
    var day;
    day = (Math.abs(CnDateofDate(dateGl))) % 100;
    return cnDayStr[day];
}
function DaysNumberofMonth(dateGl) {
    var mm1 = dateGl.getFullYear();
    mm1 < 100 ? mm1 += 1900 : mm1;
    var mm2 = mm1;
    mm1 += "/" + (dateGl.getMonth() + 1);
    mm2 += "/" + (dateGl.getMonth() + 2);
    mm1 += "/1";
    mm2 += "/1";
    return parseInt((Date.parse(mm2) - Date.parse(mm1)) / 86400000);
}
function CnEra(yyyy) {
    var tiangan = new Array("甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸");
    //var Dizhi=new Array("子(鼠)","丑(牛)","寅(虎)","卯(兔)","辰(龙)","巳(蛇)",
    //"午(马)","未(羊)","申(猴)","酉(鸡)","戌(狗)","亥(猪)");
    var dizhi = new Array("子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥");
    return tiangan[yyyy % 10] + dizhi[yyyy % 12];
}
function CnDateofDateStr(dateGl) {
    if (CnMonthofDate(dateGl) == "零月") return "　请调整您的计算机日期!";
    else return "农历" + CnYearofDate(dateGl) + CnMonthofDate(dateGl) + CnDayofDate(dateGl);
}
function SolarTerm(dateGl) {
    var solarTermStr = new Array(
"小寒", "大寒", "立春", "雨水", "惊蛰", "春分",
"清明", "谷雨", "立夏", "小满", "芒种", "夏至",
"小暑", "大暑", "立秋", "处暑", "白露", "秋分",
"寒露", "霜降", "立冬", "小雪", "大雪", "冬至");
    var differenceInMonth = new Array(
1272060, 1275495, 1281180, 1289445, 1299225, 1310355,
1321560, 1333035, 1342770, 1350855, 1356420, 1359045,
1358580, 1355055, 1348695, 1340040, 1329630, 1318455,
1306935, 1297380, 1286865, 1277730, 1274550, 1271556);
    var differenceInYear = 31556926;
    var beginTime = new Date(1901 / 1 / 1);
    beginTime.setTime(947120460000);
    for (; dateGl.getFullYear() < beginTime.getFullYear(); ) {
        beginTime.setTime(beginTime.getTime() - differenceInYear * 1000);
    }
    for (; dateGl.getFullYear() > beginTime.getFullYear(); ) {
        beginTime.setTime(beginTime.getTime() + differenceInYear * 1000);
    }
    for (var m = 0; dateGl.getMonth() > beginTime.getMonth(); m++) {
        beginTime.setTime(beginTime.getTime() + differenceInMonth[m] * 1000);
    }
    if (dateGl.getDate() > beginTime.getDate()) {
        beginTime.setTime(beginTime.getTime() + differenceInMonth[m] * 1000);
        m++;
    }
    if (dateGl.getDate() > beginTime.getDate()) {
        beginTime.setTime(beginTime.getTime() + differenceInMonth[m] * 1000);
        m == 23 ? m = 0 : m++;
    }
    var jq = "二十四节气";
    if (dateGl.getDate() == beginTime.getDate()) {
        jq += "&nbsp;&nbsp;今日 <font color='#598F03'><b>" + solarTermStr[m] + "</b></font>";
    }
    else if (dateGl.getDate() == beginTime.getDate() - 1) {
        jq += "&nbsp;&nbsp;明日 <font color='#598F03'><b>" + solarTermStr[m] + "</b></font>";
    }
    else if (dateGl.getDate() == beginTime.getDate() - 2) {
        jq += "&nbsp;&nbsp;后日 <font color='#598F03'><b>" + solarTermStr[m] + "</b></font>";
    }
    else {
        jq = "二十四节气";
        if (dateGl.getMonth() == beginTime.getMonth()) {
            jq += "&nbsp;&nbsp;本月";
        }
        else {
            jq += "&nbsp;&nbsp;下月";
        }
        jq += beginTime.getDate() + "日" + "&nbsp;<font color='#598F03'>" + solarTermStr[m] + "</font>";
    }
    return jq;
}
function CAL()
{ }

//调用：RunGLNL();
