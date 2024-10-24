package com.board.individual.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.company.vo.CompanyVo;
import com.board.individual.vo.IndividualVo;

@Mapper
public interface IndividualMapper {

	IndividualVo login(String userid, String password);

	IndividualVo getUserById(String user_id);

	void update(IndividualVo individualVo);

	void delete(IndividualVo individualVo);

    // 회원가입 처리 메서드
    void signup(IndividualVo individualVo);

	IndividualVo idDupCheck(String user_id);

	List<IndividualVo> recommendList();

	void insert(IndividualVo individualVo);

	CompanyVo emailDupCheck(String email);



}
