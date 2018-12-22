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
 * ����json��
 * ����Ա����crud����
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
	 * ����jackson��
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
	 * 	Ա��ҳ���ѯ��ʹ�÷�ҳ��
	 * **/
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		
		PageHelper.startPage(pn,5);
		//����startPage����������ѯ����һ����ҳ��ѯ
		List<Employee> emps=employeeService.getAll();
		//ʹ��pageInfo���а�װ��ѯ��Ľ��
		//��װ����ϸ����Ϣ��������ѯ����������,����������ʾ��ҳ��
		PageInfo page=new PageInfo(emps,5);
		return Msg.success().add("pageInfo",page);
		
	}
	
	
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		//���ݱȽ϶�Ӧ��ʹ�÷�ҳ��ѯ
		//�����ҳ��ѯ�Ĳ��
		PageHelper.startPage(pn,5);
		//����startPage����������ѯ����һ����ҳ��ѯ
		List<Employee> emps=employeeService.getAll();
		//ʹ��pageInfo���а�װ��ѯ��Ľ��
		//��װ����ϸ����Ϣ��������ѯ����������,����������ʾ��ҳ��
		PageInfo page=new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		return "list";
	}
	
}
