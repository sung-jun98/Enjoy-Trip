package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.model.dto.AttractionDto;
import com.ssafy.model.dto.SidoGugunDto;

public interface AttractionDao {


//	/** 군구 별로 조회 */
//	List<AttractionDto> selectAttractionByGungu(String gungu);
//
//	/** 관광지 이름으로 검색 */
//	List<AttractionDto> selectAttractionByTitle(String name);
//
//	/** 시 + 군구 별로 조회 */
//	List<AttractionDto> selectAttractionBySiTitle(String si, String name);
//
//	/** 시 + 군구 + 관광지 이름 검색 */
//	List<AttractionDto> selectAttractionBySiGunguTitle(String si, String gungu, String name);
//
//	/** contents type 별로 검색 */
//	List<AttractionDto> selectAttractionByContentsType(String name);
//
//	/** 시 + 군구 + contents type 별로 검색 */
//	List<AttractionDto> selectAttractionBySiGunguContentsType(String name, String gungu, String type);
//
//	/** 시 + 관광지 이름 검색 */
//	List<AttractionDto> selectAttractionBySiGungu(String si, String gungu);
//
//
//	void registSido(List<SidoGugunDto> sidoGugunList);
//	void registGugun(List<SidoGugunDto> sidoGugunList);
//	void registAttraction(List<AttractionDto> attractionList);
//	/** 시 + 군구 + contents type 별로 검색  (수정)*/

	List<SidoGugunDto> selectSidoGugun();
	List<AttractionDto> selectAttractionBySidoGugunTitle(String sido, String gungu, String name, Integer contentTypeId) throws SQLException;

}
