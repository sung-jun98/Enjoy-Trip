package com.ssafy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.ssafy.model.dto.UserDto;

@Mapper
public interface UserMapper {
    int insertUser(UserDto userDto);

    // 기존 selectOneByUserIdAndEmail을 selectOneByUserIdAndPw로 변경
    UserDto selectOneByUserIdAndPw(@Param("userId") String userId, @Param("userPw") String userPw);

    // selectOneByUserId 추가
    UserDto selectOneByUserId(@Param("userId") String userId);

    UserDto selectOneByUserEmail(@Param("userEmail") String userEmail);
    

    int updateUser(UserDto userDto);

    int updateUserPw(@Param("userId") String userId, @Param("userPw") String userPw, @Param("modifyUserPw") String modifyUserPw);

    int deleteUser(@Param("userId") String userId, @Param("userPw") String userPw);

    List<UserDto> getAllUsers();
}
