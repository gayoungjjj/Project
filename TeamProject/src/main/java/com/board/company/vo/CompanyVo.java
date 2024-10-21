package com.board.company.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyVo {
    private String user_id;      // USER_ID
    private String username;     // USERNAME
    private String compname;     // COMPNAME
    private String email;        // EMAIL
    private String password;     // PASSWORD
    private String phone_number;  // PHONE_NUMBER
    private String j_date;       // J_DATE
}
