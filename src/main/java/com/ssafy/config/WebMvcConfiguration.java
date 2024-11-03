package com.ssafy.config;

import java.util.Arrays;
import java.util.List;

//import com.ssafy.interceptor.AdminInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

//import com.ssafy.interceptor.ConfirmInterceptor;

//import lombok.extern.slf4j.Slf4j;

//@Slf4j
@Configuration
@EnableAspectJAutoProxy
@MapperScan(basePackages = { "com.ssafy.**.mapper" })
public class WebMvcConfiguration implements WebMvcConfigurer {

//    // private final ConfirmInterceptor confirmInterceptor;
//    private final AdminInterceptor adminInterceptor;
//
//    public WebMvcConfiguration(AdminInterceptor adminInterceptor) {
//        // this.confirmInterceptor = confirmInterceptor;
//        this.adminInterceptor = adminInterceptor;
//    }

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("index");
	}
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        // ConfirmInterceptor 설정
////        registry.addInterceptor(confirmInterceptor)
////                .addPathPatterns("/list", "/product/regist", "/product/edit", "/product/delete")
////                .excludePathPatterns("/user/log*");
//
//        // AdminInterceptor 설정
//        registry.addInterceptor(adminInterceptor)
//                .addPathPatterns("/reservation/adminList");
//    }

}
