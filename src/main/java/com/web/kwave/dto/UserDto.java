package com.web.kwave.dto;

import java.sql.Timestamp;

public class UserDto {
	   
	   private String userEmail;
	   private String userPassword;
	   private String userName;
	   private Timestamp userRegDate;
	   private int isSNS;
	   private String userNation;
	   private String phone;
	   private String zipCode;
	   private String address1;
	   private String address2;
	   private String city;
	   private String region;
	   private String country;
	   
	   public UserDto() {
	      // TODO Auto-generated constructor stub
	   }
	   
	   
	   public String getUserEmail() {
	      return userEmail;
	   }
	   public void setUserEmail(String userEmail) {
	      this.userEmail = userEmail;
	   }
	   public String getUserPassword() {
	      return userPassword;
	   }
	   public void setUserPassword(String userPassword) {
	      this.userPassword = userPassword;
	   }
	   public String getUserName() {
	      return userName;
	   }
	   public void setUserName(String userName) {
	      this.userName = userName;
	   }
	   public Timestamp getUserRegDate() {
	      return userRegDate;
	   }
	   public void setUserRegDate(Timestamp userRegDate) {
	      this.userRegDate = userRegDate;
	   }
	   public int getIsSNS() {
	      return isSNS;
	   }
	   public void setIsSNS(int isSNS) {
	      this.isSNS = isSNS;
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

	}
