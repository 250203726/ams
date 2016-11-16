package com.util.hztopy;

import net.sourceforge.pinyin4j.PinyinHelper;

/**
 * 汉字转拼音工具类
 * @author Shalnark
 *
 */
public class PinyinUtil {
	public static String getPinYinHeadChar(String str) {
        String convert = "";
        for (int j = 0; j < str.length(); j++) {
            char word = str.charAt(j);
            // 提取汉字的首字母
            String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
            if (pinyinArray != null) {
                convert += pinyinArray[0].charAt(0);
            } else {
                convert += word;
            }
        }
        return convert;
    }
}
