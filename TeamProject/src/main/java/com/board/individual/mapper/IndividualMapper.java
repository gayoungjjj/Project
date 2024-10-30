package com.board.individual.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.company.vo.CompanyVo;
import com.board.individual.vo.IndividualVo;

@Mapper
public interface IndividualMapper {

	IndividualVo login(String user_id, String password);
	
	IndividualVo emailDupCheck(String email);

	IndividualVo getUserById(String user_id);

	void update(IndividualVo individualVo);

	void delete(IndividualVo individualVo);

    // 회원가입 처리 메서드
    void signup(IndividualVo individualVo);

	IndividualVo idDupCheck(String user_id);

	List<IndividualVo> recommendList(String user_id);

	void insert(IndividualVo individualVo);
	
	List<IndividualVo> getappList(IndividualVo vo);
	
	List<String> getTitlesByUSerId(String user_id);

	void insert2(IndividualVo individualVo);

	IndividualVo getResum(String userid);

	List<IndividualVo> getreList(IndividualVo vo);

	IndividualVo getresumeList(IndividualVo individualVo);

	void update2(IndividualVo individualVo);

	void deleteres(IndividualVo individualVo);

	void delapplist(IndividualVo individualVo);

	void delbookmark(IndividualVo individualVo);


	List<IndividualVo> getsubres(String user_id, String title);

	List<IndividualVo> checkappex(String user_id, String aplnum);

	List<IndividualVo> checkTitleExists( String userId, String title);
	
	// 원호 수정됨

	List<IndividualVo> getBookmarksByUsername(IndividualVo vo);

	IndividualVo getallUserById(String user_id);

	List<IndividualVo> getJobPostingsByUserId(String string);





}
