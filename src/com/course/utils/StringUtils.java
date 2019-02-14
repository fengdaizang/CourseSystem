package com.course.utils;

import java.io.UnsupportedEncodingException;

public class StringUtils {
	
	public static String change(String string){
		String str="";
		try {
			str= new String(string.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
}
