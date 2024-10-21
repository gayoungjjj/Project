package com.board.company.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyVo {

	private String aplnum;
	private String post_id;
	private String user_id;
	private String compname;
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
