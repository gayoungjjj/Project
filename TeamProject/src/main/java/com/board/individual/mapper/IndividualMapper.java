package com.board.individual.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.company.vo.CompanyVo;
import com.board.individual.vo.IndividualVo;

@Mapper
public interface IndividualMapper {

	IndividualVo login(String userid, String password);

	IndividualVo getUserById(String user_id);

	void update(IndividualVo individualVo);

	void delete(IndividualVo individualVo);

    void signup(IndividualVo individualVo);

	IndividualVo idDupCheck(String user_id);

	CompanyVo emailDupCheck(String email);

}
