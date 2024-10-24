package com.board.individual.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.individual.vo.IndividualVo;

@Mapper
public interface IndividualMapper {

	IndividualVo login(String userid, String password);

	IndividualVo getUserById(String user_id);

	void update(IndividualVo individualVo);

	void delete(IndividualVo individualVo);

    // 회원가입 처리 메서드
    void signup(IndividualVo individualVo);

    
    
    // 이력서등록

	void insert(IndividualVo individualVo);

	
	//공고목록 이력서
	
	IndividualVo getmain2(String userid);

	List<String> getTitlesByUSerId(String userid);



}
