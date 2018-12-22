package com.hkc.bean;

public class Employee {
    public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employee(Integer tmpId, String tmoName, String gender, String email, Integer dId) {
		super();
		this.tmpId = tmpId;
		this.tmoName = tmoName;
		this.gender = gender;
		this.email = email;
		this.dId = dId;
	}

	private Integer tmpId;

    private String tmoName;

    private String gender;

    private String email;

    private Integer dId;
    
    //希望查询员工的同时部门的信息也能查询
    private Department department; 

    public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getTmpId() {
        return tmpId;
    }

    public void setTmpId(Integer tmpId) {
        this.tmpId = tmpId;
    }

    public String getTmoName() {
        return tmoName;
    }

    public void setTmoName(String tmoName) {
        this.tmoName = tmoName == null ? null : tmoName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}