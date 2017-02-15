package com.kwavedonate.kwaveweb.user.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;

public class UserDetailsVO extends User {

	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private String user_name;
	private String userNation;
	private String phone;
	private String zipCode;
	private String address1;
	private String address2;
	private String city;
	private String region;
	private String country;

	public UserDetailsVO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities,
			String user_name, String userNation, String phone, String zipCode, String address1, String address2,
			String city, String region, String country) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		this.user_name = user_name;
		this.userNation = userNation;
		this.phone = phone;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
		this.city = city;
		this.region = region;
		this.country = country;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUserNation() {
		return userNation;
	}

	public void setUserNation(String userNation) {
		this.userNation = userNation;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Override
	public String toString() {
		return super.toString() + "; userNation: " + this.userNation + "; phone: " + this.phone + "; zipCode: "
				+ this.zipCode + "; address1: " + this.address1 + "; address2: " + this.address2 + "; city: "
				+ this.city + "; region: " + this.region + "; country: " + this.country;
	}

}