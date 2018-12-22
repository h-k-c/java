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
 * ����dao��Ĺ���
 * @author hkc
 * �Ƽ�ʹ��Spring����Ŀ�Ϳ���ʹ��Spring�ĵ�Ԫ���ԣ��Ϳ����Զ�ע��������Ҫ�����
 * ����SpringTest�İ�
 * ֱ��autowied
 * **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	/**
	 * ����DepartmentMapper
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
//		//1.����SpringIOC������
//		ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
//		//2.�������л�ȡmapper
//		DepartmentMapper bean=ioc.getBean(DepartmentMapper.class);
		System.out.println(departmentMapper);
		
		//1.���뼸������
		//departmentMapper.deleteByPrimaryKey(5);
		
		//����Ա���Ĳ���
		//employeeMapper.insertSelective(new Employee(null,"hkc","f","hkc@hfnu.com",1));
		//�������룬
//		EmployeeMapper mapper=sqlsession.getMapper(EmployeeMapper.class);
//		for(int i=0;i<1000;i++) {
//			String uid=UUID.randomUUID().toString().substring(0, 5)+i;
//			mapper.insertSelective(new Employee(i,uid,"F",uid+"@hkc.com",1));
//		}
//		System.out.println("�������");
	}
}
