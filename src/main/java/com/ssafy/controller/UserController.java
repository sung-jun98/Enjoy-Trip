package com.ssafy.controller;

import com.ssafy.mapper.UserMapper;
import com.ssafy.model.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user") // 모든 매핑에 공통적으로 /user를 추가
public class UserController {

    @Autowired
    private UserMapper userMapper;

    // 로그인 페이지 표시
    @GetMapping("/login")
    public String showLoginPage() {
        return "user/login"; // /WEB-INF/views/user/login.jsp
    }

    // 로그인 처리
    @PostMapping("/login")
    public String processLogin(@RequestParam("userid") String userid, 
                               @RequestParam("userPw") String userPw, 
                               HttpSession session, 
                               Model model) {
        UserDto user = userMapper.selectOneByUserIdAndPw(userid, userPw);
        System.out.println("로그인 결과 UserDto: " + user); // user 객체 내용 출력
        if (user != null) {
            session.setAttribute("userinfo", user);
            return "redirect:/"; // 로그인 성공 시 메인 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            return "user/login"; // 로그인 실패 시 로그인 페이지로 이동
        }
    }

    // 회원가입 페이지 표시
    @GetMapping("/signup")
    public String showSignupPage() {
        return "user/signup"; // /WEB-INF/views/user/signup.jsp
    }

    // 회원가입 처리
    @PostMapping("/join")
    public String processJoin(@RequestParam("userid") String userid,
                              @RequestParam("password") String password,
                              @RequestParam("name") String name,
                              @RequestParam("email") String email,
                              Model model) { // nickname 제거

        // 회원가입 처리
        UserDto newUser = new UserDto(userid, password, name, email);
        int rowsInserted = userMapper.insertUser(newUser);
        if (rowsInserted > 0) {
            return "redirect:/user/login"; // 회원가입 성공 시 로그인 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "회원가입에 실패했습니다.");
            return "user/signup"; // 회원가입 실패 시 회원가입 페이지로 이동
        }
    }

    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/board/"; // 로그아웃 후 메인 페이지로 리다이렉트
    }

    // 마이페이지 표시
    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        UserDto user = (UserDto) session.getAttribute("userinfo");
        if (user == null) {
            return "redirect:/user/login"; // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
        }
        model.addAttribute("userinfo", user);
        return "user/mypage"; // /WEB-INF/views/user/mypage.jsp
    }
}
