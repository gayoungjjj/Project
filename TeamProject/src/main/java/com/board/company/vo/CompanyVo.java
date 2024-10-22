package com.board.company.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyVo {
	private String user_id;
	private String password;
	private String username;
	private String compname;
	private String email;
	private String phone_number;
	private String j_date;
	private String aplnum;
	private String post_id;
	private String recruitnum;
	private String deadline;
	private String duty;
	private String career;
	private String edu;
	private String skills;
	private String licenses;
	private String workspace;
	private String salary;
	private String department;
	private int hit;
}
