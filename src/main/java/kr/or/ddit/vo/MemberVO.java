package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	/*
	 * private int mem_no; private String mem_id; private String mem_pw; private
	 * String mem_name; private String mem_gender; private String mem_phone; private
	 * String mem_email; private String mem_agree;
	 */
	
	   private int memNo;
	   private String memId;
	   private String memPw;
	   private String memName;
	   private String memGender;
	   private String memPhone;
	   private String memEmail;
	   private String memAgree;
}
