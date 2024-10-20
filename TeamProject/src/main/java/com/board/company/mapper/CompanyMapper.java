	package com.board.company.mapper;
	
	import org.apache.ibatis.annotations.Mapper;
	import com.board.company.vo.CompanyVo;
	
	@Mapper
	public interface CompanyMapper {
	
		 CompanyVo login( String userid,  String password);
	
	
	}
