package com.ssafy.controller;

import java.util.List;
import java.util.Comparator;

import com.ssafy.model.dto.AttractionDto;
import com.ssafy.model.dto.SidoGugunDto;
import com.ssafy.model.dto.UserDto;
import com.ssafy.model.service.AttractionService;
import com.ssafy.model.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/attraction")
public class AttractionController {
    
    @Autowired
    private AttractionService attractionService;
    
    @Autowired
    private UserService userService;
    
    /**
     * 시도, 구군 정보를 조회하는 엔드포인트
     * URL: /attraction/getSidoGugun
     * Method: GET
     * Response: JSON 리스트
     */
    @GetMapping("/getSidoGugun")
    @ResponseBody
    public List<SidoGugunDto> getSidoGugun() {
        return attractionService.getSidoGugun();
    }	
    
    /**
     * 시도, 구군, 관광지 이름 및 콘텐츠 타입으로 관광지를 검색하는 엔드포인트
     * URL: /attraction/searchByGungu
     * Method: GET
     * Parameters:
     * - sido (String): 시도 코드
     * - gugun (String): 구군 코드
     * - name (String): 관광지 이름
     * - contentTypeId (Integer, optional): 콘텐츠 타입 ID
     * Response: JSON 리스트
     */
    @GetMapping("/searchByGungu")
    @ResponseBody
    public List<AttractionDto> searchByGungu(
        @RequestParam("sido") String sido,
        @RequestParam("gugun") String gungu,
        @RequestParam("name") String name,
        @RequestParam(value = "contentTypeId", required = false) Integer contentTypeId
    ) {
        // 요청 파라미터 로깅
        System.out.println("Received searchByGungu request: sido=" + sido + ", gungu=" + gungu + ", contentTypeId=" + contentTypeId + ", name=" + name);
        try {
            return attractionService.searchAttractions(sido, gungu, name, contentTypeId);
        } catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error searching attractions");
        }
    }
    
    /**
     * 여행 검색 페이지로 포워딩하는 엔드포인트
     * URL: /attraction/tripSearch
     * Method: GET
     * Response: trip-search.jsp 페이지
     */
    @GetMapping("/tripSearch")
    public String tripSearch(HttpServletRequest request) {
        //setTopVisitors(request);
        return "trip-search"; // View 이름 (prefix와 suffix는 application.properties에서 설정)
    }
    
    /**
     * 상위 방문자 정보를 설정하는 메서드
     * @param request HttpServletRequest 객체
     */
//    private void setTopVisitors(HttpServletRequest request) {
//        List<UserDto> allUsers = userService.getAllUsers();
//
//        // 방문 횟수 기준으로 내림차순 정렬
//        allUsers.sort(Comparator.comparingInt(UserDto::getUserVisited).reversed());
//
//        // 상위 2명 선택
//        List<UserDto> topVisitors = allUsers.size() >= 2 ? allUsers.subList(0, 2) : allUsers;
//
//        // 요청 속성에 추가
//        request.setAttribute("topVisitors", topVisitors);
//    }
}
