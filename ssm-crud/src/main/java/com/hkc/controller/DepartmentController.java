package com.hkc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hkc.bean.Department;
import com.hkc.bean.Employee;
import com.hkc.bean.Msg;
import com.hkc.service.DepartmentService;
/**
 * 处理dept操作的请求
 * @author 胡开成
 * 
 * **/

@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;

	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts(){
		List<Department> list=departmentService.getDepts();
		return Msg.success().add("depts", list);
	}

}
