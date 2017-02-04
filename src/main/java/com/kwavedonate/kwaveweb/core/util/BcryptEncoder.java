package com.kwavedonate.kwaveweb.core.util;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service("bcryptEncoder")
public class BcryptEncoder implements PasswordEncoder {

	@Resource(name = "passwordEncoder")
	private PasswordEncoder encoder;

	public BcryptEncoder() {
		this.encoder = new BCryptPasswordEncoder();
	}

	public BcryptEncoder(PasswordEncoder passwordEncoder) {
		this.encoder = passwordEncoder;
	}

	@Override
	public String encode(CharSequence rawPassword) {
		// TODO Auto-generated method stub
		return encoder.encode(rawPassword);
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		// TODO Auto-generated method stub
		return encoder.matches(rawPassword, encodedPassword);
	}

}
