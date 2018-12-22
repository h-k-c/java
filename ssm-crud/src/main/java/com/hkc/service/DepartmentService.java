package com.hkc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hkc.bean.Department;
import com.hkc.dao.DepartmentMapper;

/**
 * 处理有关dept的操作
 * @author 胡开成
 * **/

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentMapper departmentMapper;

	public List<Department> getDepts() {
		List<Department> list=departmentMapper.selectByExample(null);
		return list;
		// TODO Auto-generated method stub
		
	}
	
}
