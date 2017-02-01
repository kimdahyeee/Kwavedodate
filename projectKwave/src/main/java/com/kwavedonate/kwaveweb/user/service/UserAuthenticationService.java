package com.kwavedonate.kwaveweb.user.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.kwavedonate.kwaveweb.user.vo.UserDetailsVO;



public class UserAuthenticationService implements UserDetailsService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserAuthenticationService.class);
	private SqlSessionTemplate sqlSession;

	public UserAuthenticationService() {

	}
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Map<String, Object> user;
		user = sqlSession.selectOne("user.selectUser", username);

		if(user == null) throw new UsernameNotFoundException(username);
		
		logger.info("helloLogger {}", user.toString());
	
		List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		gas.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
		return new UserDetailsVO(
				user.get("USERNAME").toString(), 
				user.get("PASSWORD").toString(), 
				true, 
				true, 
				true, 
				true, 
				gas
				);

	}

}
