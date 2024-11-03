package com.ssafy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.ssafy.model.dto.AttractionDto;
import com.ssafy.model.dto.SidoGugunDto;

@Mapper
public interface AttractionMapper {
    
    // 시도, 구군 정보 조회
    List<SidoGugunDto> selectSidoGugun();
    
    // 시도, 구군, 관광지 이름 및 콘텐츠 타입으로 관광지 검색
    List<AttractionDto> selectAttractionBySidoGugunTitle(
        @Param("sido") String sido, 
        @Param("gungu") String gungu, 
        @Param("name") String name, 
        @Param("contentTypeId") Integer contentTypeId
    );
    
    // 필요한 경우 추가 메서드 선언 (주석 처리된 메서드들에 대응)
    // 예시:
    // List<AttractionDto> selectAttractionBySiGunguContentsType(@Param("si") String si, @Param("gungu") String gungu, @Param("type") String type);
    // List<AttractionDto> selectAttractionByTitle(@Param("name") String name);
    // ... 기타 메서드
}
