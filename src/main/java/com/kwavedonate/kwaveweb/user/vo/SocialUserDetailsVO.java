package com.kwavedonate.kwaveweb.user.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.social.security.SocialUser;

public class SocialUserDetailsVO extends SocialUser{

	
	public SocialUserDetailsVO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		// TODO Auto-generated constructor stub
		super(username, password, authorities);
	}
	
	

}
