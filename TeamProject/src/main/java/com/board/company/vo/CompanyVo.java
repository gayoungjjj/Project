package com.board.company.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyVo {
	private  String	   user_id;
	private  String    username;
	private  String    compname;
	private  String    email;
	private  String    password;
	private  String    phone_number;
	private  String    j_date;
}
