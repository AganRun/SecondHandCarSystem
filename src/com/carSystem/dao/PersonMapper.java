package com.carSystem.dao;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Person;

@Repository
public interface PersonMapper {

	//注册时添加用户
	public void addPerson(Person person);
	
	//注册时检测手机号是否已经存在
	public String textTelExist(String tel);
	
	//获取最大的person_id
	public String getMaxPerson_id();
	
	//通过id查询person
	public Person queryPersonById(String person_id);
	
	//保存修改后的person数据
	public void saveUpdatePersonInfo(Person person);
}
