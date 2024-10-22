package com.board.individual.mapper;

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

}
