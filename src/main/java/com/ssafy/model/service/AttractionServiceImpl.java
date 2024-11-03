package com.ssafy.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.model.dto.AttractionDto;
import com.ssafy.model.dto.SidoGugunDto;
import com.ssafy.mapper.AttractionMapper;

@Service
public class AttractionServiceImpl implements AttractionService {

    @Autowired
    private AttractionMapper attractionMapper;

    @Override
    public List<SidoGugunDto> getSidoGugun() {
        return attractionMapper.selectSidoGugun();
    }

    @Override
    public List<AttractionDto> searchAttractions(String sido, String gungu, String name, Integer contentTypeId) {
        return attractionMapper.selectAttractionBySidoGugunTitle(sido, gungu, name, contentTypeId);
    }

    // 필요한 경우 추가 메서드 구현
}
