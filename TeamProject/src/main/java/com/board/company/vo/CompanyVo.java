package com.board.company.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyVo {
	private  String   userid;
	private  String   username;
	private  String   email;
	private  String   password;
	private  String   phonenumber;
	private  String   address;
	private  String   jdate;
}
