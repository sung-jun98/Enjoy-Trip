package com.ssafy.model.service;

import java.util.List;
import com.ssafy.model.dto.UserDto;

public interface UserService {
    boolean addUser(UserDto userDto);
    UserDto searchDetail(String userId);
    UserDto searchDetail(String userId, String userPw);
    int modifyUser(UserDto userDto);
    int modifyUserPw(String userId, String userPw, String modifyUserPw);
    int deleteUser(String userId, String userPw);
    UserDto findByUserId(String userEmail);
    UserDto findByUserPw(String userId, String userPw);
    List<UserDto> getAllUsers();
}
