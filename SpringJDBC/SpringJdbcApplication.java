package com.cts;

import javax.sql.DataSource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@SpringBootApplication
public class SpringJdbcApplication {

	public static void main(String[] args) {
ApplicationContext cnt=SpringApplication.run(SpringJdbcApplication.class, args);
MyDb db= cnt.getBean(MyDb.class);
//db.display();
//Emp e = new Emp(4,"Ranjini",25000,101);
//db.insert(e);
// List<Emp> e= db.getEmpByNo(3);
//  System.out.println(e);
//Emp e= db.getEmp(3);
//System.out.println(e);
//db.update(e);
db.delete(4);

		
	}

	
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
		driverManagerDataSource.setUrl("jdbc:mysql://localhost:3306/mphasis");
		driverManagerDataSource.setUsername("root");
		driverManagerDataSource.setPassword("root");
		driverManagerDataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		return driverManagerDataSource;
	}
}
