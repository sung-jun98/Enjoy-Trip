package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.UserDto;
import com.ssafy.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean addUser(UserDto userDto) {
        return userMapper.insertUser(userDto) > 0;
    }

    @Override
    public UserDto searchDetail(String userId) {
        return userMapper.selectOneByUserId(userId);
    }

    @Override
    public UserDto searchDetail(String userId, String userPw) {
        return userMapper.selectOneByUserIdAndPw(userId, userPw);
    }

    @Override
    public int modifyUser(UserDto userDto) {
        return userMapper.updateUser(userDto);
    }

    @Override
    public int modifyUserPw(String userId, String userPw, String modifyUserPw) {
        return userMapper.updateUserPw(userId, userPw, modifyUserPw);
    }

    @Override
    public int deleteUser(String userId, String userPw) {
        return userMapper.deleteUser(userId, userPw);
    }

    @Override
    public UserDto findByUserId(String userEmail) {
        return userMapper.selectOneByUserEmail(userEmail);
    }

    @Override
    public UserDto findByUserPw(String userId, String userPw) {
        return userMapper.selectOneByUserIdAndPw(userId, userPw);
    }

    @Override
    public List<UserDto> getAllUsers() {
        return userMapper.getAllUsers();
    }
}
