package com.ssafy.model.service;

import java.util.List;
import com.ssafy.model.dto.AttractionDto;
import com.ssafy.model.dto.SidoGugunDto;

public interface AttractionService {
    List<SidoGugunDto> getSidoGugun();
    List<AttractionDto> searchAttractions(String sido, String gungu, String name, Integer contentTypeId);
    // 필요한 경우 추가 메서드 선언
}
