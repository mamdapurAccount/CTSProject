package com.cts;
import org.springframework.stereotype.Component;


public class Emp {
  int eno;
  String empname;
  int sal;
  int did;
	public Emp() {
		
	}

	
	

	public int getDid() {
		return did;
	}




	public void setDid(int did) {
		this.did = did;
	}




	public Emp(int eno, String empname, int sal, int did) {
		super();
		this.eno = eno;
		this.empname = empname;
		this.sal = sal;
		this.did = did;
	}




	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}




	@Override
	public String toString() {
		return "Emp [eno=" + eno + ", empname=" + empname + ", sal=" + sal + ", did=" + did + "]";
	}

	
  
  
  
}
