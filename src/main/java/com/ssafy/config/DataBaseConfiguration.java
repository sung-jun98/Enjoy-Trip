package com.ssafy.config;

import javax.sql.DataSource;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

//읽어와야될 프러퍼티의 소스는 application.properties에 있음
@Configuration
@PropertySource("classpath:/application.properties")
@MapperScan(basePackages = { "com.ssafy.**.mapper" })
@EnableAspectJAutoProxy //<aop:aspectj-autoproxy />
public class DataBaseConfiguration {

	//정보를 읽어와서 hikariconfig라는 객체 만듦
	//아래 메서드에 대해 설정할 때 필요한 접두어는 spring.datasource.hikari를 읽어옴
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.hikari")
	public HikariConfig hikariConfig() {
		return new HikariConfig();
	}
	
	//데이터소스를 만들 때, hikariconfig 정보를 넘겨줌
	@Bean
	public DataSource dataSource() throws Exception {
		DataSource dataSource = new HikariDataSource(hikariConfig());
		System.out.println(dataSource.toString());
		return dataSource;
	}
	
}
