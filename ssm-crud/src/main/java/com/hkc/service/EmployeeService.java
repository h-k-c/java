package com.hkc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hkc.bean.Employee;
import com.hkc.bean.EmployeeExample;
import com.hkc.bean.EmployeeExample.Criteria;
import com.hkc.dao.EmployeeMapper;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;

	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		
		return employeeMapper.selectByExampleWithDept(null);
	}
	//Ա�����淽��
	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
		
	}
	//�����û����Ƿ����
	public boolean checkUser(String empName) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria criteria=example.createCriteria();
		criteria.andTmoNameEqualTo(empName);
		//��Ҫ����ѯ�����Ľ��
		long count=employeeMapper.countByExample(example);
		return count==0;
	}

}
