package com.board.individual.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.board.individual.vo.IndividualVo;

@Mapper
public interface IndividualMapper {

    // 로그인 처리 메서드
    IndividualVo login(String user_id, String password);

    // 회원가입 처리 메서드
    void signup(IndividualVo individualVo);

}
