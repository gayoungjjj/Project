package com.board.company.mapper;

import java.util.List;

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

	List<CompanyVo> getmainList();

	void plushit(CompanyVo companyVo);

	CompanyVo getmain(CompanyVo companyVo);

	void insertposting(CompanyVo companyVo);

	void deleteposting(CompanyVo companyVo);

	void updateposting(CompanyVo companyVo);

	List<CompanyVo> getCompanyList();

}
