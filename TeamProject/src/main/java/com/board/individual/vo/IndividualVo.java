package com.board.individual.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IndividualVo {
	private String user_id;
	private String username;
	private String email;
	private String password;
	private String phone_number;
	private String address;
	private String j_date;
	private int    app_id;
	private String post_id;
	private int    resume_id;
	private String app_date;
	private String location;
}
