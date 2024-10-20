package com.board.individual.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.company.vo.CompanyVo;

@Mapper
public interface IndividualMapper {

	CompanyVo login(String userid, String password);

}
