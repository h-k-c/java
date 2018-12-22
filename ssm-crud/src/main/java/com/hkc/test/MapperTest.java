package com.hkc.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hkc.bean.Department;
import com.hkc.bean.Employee;
import com.hkc.dao.DepartmentMapper;
import com.hkc.dao.EmployeeMapper;
/**
 * 测试dao层的工作
 * @author hkc
 * 推荐使用Spring的项目就可以使用Spring的单元测试，就可以自动注入我们需要的组件
 * 导入SpringTest的包
 * 直接autowied
 * **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	/**
	 * 测试DepartmentMapper
	 * 
	 * **/
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlsession;
	
	@Test
	public void testCRUD() {
//		//1.创建SpringIOC的容器
//		ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
//		//2.从容器中获取mapper
//		DepartmentMapper bean=ioc.getBean(DepartmentMapper.class);
		System.out.println(departmentMapper);
		
		//1.插入几个部门
		//departmentMapper.deleteByPrimaryKey(5);
		
		//生成员工的测试
		//employeeMapper.insertSelective(new Employee(null,"hkc","f","hkc@hfnu.com",1));
		//批量插入，
//		EmployeeMapper mapper=sqlsession.getMapper(EmployeeMapper.class);
//		for(int i=0;i<1000;i++) {
//			String uid=UUID.randomUUID().toString().substring(0, 5)+i;
//			mapper.insertSelective(new Employee(i,uid,"F",uid+"@hkc.com",1));
//		}
//		System.out.println("批量完成");
	}
}
