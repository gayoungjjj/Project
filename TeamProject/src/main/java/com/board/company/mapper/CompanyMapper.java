package com.board.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.company.vo.CompanyVo;

@Mapper
public interface CompanyMapper {

	List<CompanyVo> getmainList();

	CompanyVo getmain(CompanyVo companyVo);

	void insertposting(CompanyVo companyVo);

	void deleteposting(CompanyVo companyVo);

	void updateposting(CompanyVo companyVo);

	void plushit(CompanyVo companyVo);

}
