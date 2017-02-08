package com.kwavedonate.kwaveweb.core.util;

import javax.servlet.http.HttpServletRequest;

public class GetIpAddress {
	
	public static String getClientIP(HttpServletRequest request) {
		
		String ip = request.getHeader("X-FORWARDED-FOR");
		
		if(ip == null || ip.length() == 0) {
			ip = request.getHeader("accept-language");
			if (ip.indexOf("ko") == 0) {
				return "ko";
			} else {
				return "en";
			}
		}
		
		if(ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-client-IP");
			return ip;
		}
		
		if(ip == null || ip.length() == 0) {
			ip = request.getHeader("WL-Proxy-Client-IP");
			return ip;
		}
		
		if(ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr();
			return ip;
			
		}
		
		
		return "en";
		
	}

}
