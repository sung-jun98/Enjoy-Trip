package com.ssafy.util;

import java.util.Random;
import org.mindrot.jbcrypt.BCrypt;

public class MyUtility {
    private static MyUtility instance = new MyUtility();
    
    private MyUtility() {
        // 생성자 내부에서 인스턴스를 다시 생성하지 않도록 수정
    }
            
    public static MyUtility getInstance() {
        return instance;
    }
            
    public static String getRandomString() {
        return getRandomString(4);
    }

    public static String getRandomString(int length) {
        Random random = new Random(System.nanoTime());
        StringBuilder info = new StringBuilder();
        
        for(int i = 0 ; i < length; i++) {
            info.append((char) (random.nextInt(26) + 'A')); // 'A'부터 'Z'까지
        }
        
        return info.toString();
    }
    
    // 비밀번호 해싱
    public static String hashPassword(String password, String salt) {
        return BCrypt.hashpw(password, salt);
    }

    // Salt 생성
    public static String generateSalt() {
        return BCrypt.gensalt();
    }

    // 비밀번호 검증
    public static boolean checkPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }
    
    public static String getRandomNumberString() {
        return getRandomNumberString(4);
    }
    
    public static String getRandomNumberString(int length) {
        Random random = new Random(System.nanoTime());
        StringBuilder info = new StringBuilder();
        
        for(int i = 0 ; i < length; i++) {
            info.append(random.nextInt(10)); // 0-9 임의의 한자리수
        }
        
        return info.toString();
    }
    
    public static String getRandomSecureString(int length) {
        // 안전한 랜덤 문자열 생성 로직을 구현하세요.
        return null;
    }
    
    public static void main(String[] args) {
        System.out.println(MyUtility.getRandomString());
        System.out.println(MyUtility.getRandomString(4));
        System.out.println(MyUtility.getRandomString(6));
        System.out.println(MyUtility.getRandomNumberString());
        System.out.println(MyUtility.getRandomNumberString(4));
        System.out.println(MyUtility.getRandomNumberString(6));
    }
}
