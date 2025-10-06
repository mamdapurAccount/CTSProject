package com.cts;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
@Component
public class MyDb {
	@Autowired
   DataSource ds;
	@Autowired
	JdbcTemplate jt;
	public MyDb() {
		
	}
	public void display() {
		
		List<Emp> l=jt.query("select * from emp_tbl", new EmpMapper());
		for(Emp e:l)
		System.out.println(e);
	}

	public void update(Emp e) {
		String cmd="update emp_tbl set ename=?, sal=? where eId=?";
		jt.update(cmd,e.getEmpname(),e.getSal(),e.getEno());
		
		}
	public void delete(int eno) {
		String cmd="delete from emp_tbl where eId=?";
		jt.update(cmd, eno);
		
		}
	
	public void insert(Emp e) {
	String cmd="insert into emp_tbl values(?,?,?,?)";
	jt.update(cmd, e.getEno(),e.getEmpname(),e.getSal(),e.getDid());

	}
	public Emp getEmp(int eno) {
		String cmd="select * from emp_tbl where eId=?";
	
		Emp e=jt.queryForObject(cmd,new Object[] {eno} ,new EmpMapper());
		return e;
	}
	public List<Emp> getEmpByNo(int eno) {
		String cmd="select * from emp_tbl where eId>?";
	
		List<Emp> e=jt.query(cmd,new Object[] {eno} ,new EmpMapper());
		return e;
	}
	
	
}

