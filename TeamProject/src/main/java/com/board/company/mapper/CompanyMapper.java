package com.board.company.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.company.vo.CompanyVo;

@Mapper
public interface CompanyMapper {

	CompanyVo login(String userid, String password);
	
	CompanyVo getUserById(String user_id);
	
	CompanyVo findByUserId(CompanyVo vo);
    
    void update(CompanyVo companyVo);
    
    void delete(CompanyVo companyVo);

	void signup(CompanyVo companyVo);

}
