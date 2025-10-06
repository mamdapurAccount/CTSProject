package com.cts;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class EmpMapper implements RowMapper<Emp> {

	public Emp mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Emp e = new Emp();
		e.setEno(rs.getInt(1));
		e.setEmpname(rs.getString(2));
		e.setSal(rs.getInt(3));
		e.setDid(rs.getInt(4));
		return e;
	}

	
	
}
