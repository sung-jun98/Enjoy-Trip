package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.model.dto.UserDto;

public interface UserDAO {
	
	/**유저 추가**/
	int insertUser(UserDto userDto);
	
	/**유저 정보 수정**/
	int updateUser(UserDto userDto);
	
	/**유저 비밀번호 수정**/
	int updateUserPw(String userId, String userPw, String modifyUserPw);
	
	/**유저 삭제 **/
	int deleteUser(String userId, String userpw);
	
	/**유저 검색**/
	/**유저 Id로 검색**/
	UserDto selectOne(String userId);
	
	/**유저 Email로 검색**/
	UserDto searchOne(String userEmail);
	
	/**유저 Id, Email로 검색**/
	UserDto selectOne(String userId, String email);
	
	/**유저 Id, Pw 로 검색**/
	UserDto searchOne(String userId, String userPw);
	
	/** 모든 사용자 조회 **/
	List<UserDto> getAllUsers();
	
}
