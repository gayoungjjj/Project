package com.board.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.company.vo.CompanyVo;
import com.board.individual.vo.IndividualVo;

@Mapper
public interface CompanyMapper {

	CompanyVo login(String user_id, String password);
	
	CompanyVo getUserById(String user_id);
    
    void update(CompanyVo companyVo);
    
    void delete(CompanyVo companyVo);

	void signup(CompanyVo companyVo);

	List<CompanyVo> getmainList();

	CompanyVo getmain(CompanyVo companyVo);

	void plushit(CompanyVo companyVo);

	void insertposting(CompanyVo companyVo);

	void deleteposting(CompanyVo companyVo);

	void updateposting(CompanyVo companyVo);

	List<IndividualVo> getappList();

	List<CompanyVo> getCompanyList();

	IndividualVo getresumeList(IndividualVo individualVo);

	void companysignup(CompanyVo companyVo);

	CompanyVo idDupCheck(String user_id);

	CompanyVo compDupCheck(String compname);
	
	CompanyVo emailDupCheck(String email);
	
	List<CompanyVo> recommendList();

	List<CompanyVo> getSortedPostList();


}
