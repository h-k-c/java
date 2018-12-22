package com.hkc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hkc.bean.Employee;
import com.hkc.bean.Msg;
import com.hkc.service.EmployeeService;

/**
 * 導入json包
 * 处理员工的crud请求
 * @author hkc
 * 
 * **/
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	public Msg checkuser(String empName){
		boolean b=employeeService.checkUser(empName);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	
	/**
	 * 导入jackson包
	 * @param pn
	 * @return
	 * **/
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(Employee employee) {
		employeeService.saveEmp(employee);
		return Msg.success();
	}
	/**
	 * 	员工页面查询（使用分页）
	 * **/
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		
		PageHelper.startPage(pn,5);
		//紧跟startPage后面的这个查询就是一个分页查询
		List<Employee> emps=employeeService.getAll();
		//使用pageInfo进行包装查询后的结果
		//封装了详细的信息，包括查询出来的数据,连续传入显示的页数
		PageInfo page=new PageInfo(emps,5);
		return Msg.success().add("pageInfo",page);
		
	}
	
	
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		//数据比较多应该使用分页查询
		//引入分页查询的插件
		PageHelper.startPage(pn,5);
		//紧跟startPage后面的这个查询就是一个分页查询
		List<Employee> emps=employeeService.getAll();
		//使用pageInfo进行包装查询后的结果
		//封装了详细的信息，包括查询出来的数据,连续传入显示的页数
		PageInfo page=new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		return "list";
	}
	
}
