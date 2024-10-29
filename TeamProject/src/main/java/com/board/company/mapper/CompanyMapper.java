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
	
	List<String> getPostIdsByUserId(String user_id);
	
	List<IndividualVo> getApplicationsByPostIds(List<String> postIds);

	IndividualVo getresumeList(IndividualVo individualVo);

	void companysignup(CompanyVo companyVo);

	CompanyVo idDupCheck(String user_id);

	CompanyVo compDupCheck(String compname);
	
	CompanyVo emailDupCheck(String email);

	void updateresume(String title, String result, String post_id);

	List<CompanyVo> getfaqList();

	List<CompanyVo> getcsList();

	CompanyVo getcs(CompanyVo companyVo);

	void insertcs(CompanyVo companyVo);

	void updatecs(CompanyVo companyVo);

	List<CompanyVo> recommendList();
	
	List<CompanyVo> getSortedPostList();

	String compnameByUserId(String user_id);

	List<CompanyVo> getCompanyList(String compname);

	void updateresume(IndividualVo vo);

	List<CompanyVo> getBookmark(String userId, String title, String compname);

	String isBookmark(String userId, String title);

	void toggleBookmark(String userId, String title);

	void saveBookmark(CompanyVo companyVo);

	List<CompanyVo> bookmarkList(String userId, String title);

	List<CompanyVo> getPostList();


}
