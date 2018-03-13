package com.carSystem.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carSystem.dao.PersonMapper;
import com.carSystem.entity.Person;

@Service
public class PersonService {

	@Autowired
	private PersonMapper personMapper;
	
	//注册时添加person表信息
	public void addPerson(String name, String id, String person_tel){
		Person person = new Person();
		person.setPerson_name(name);
		person.setPerson_id(id);
		person.setPerson_tel(person_tel);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    person.setPerson_time_register( sdf.format(new Date()) );  
	    
	    personMapper.addPerson(person);
	}
	
	//注册时检测手机号是否已经存在，如果不存在则返回FALSE，存在返回TRUE
	public boolean textTelExist(String tel){
		String id = personMapper.textTelExist(tel);
		if(id == null || id.equals("")){
			return false;
		}else{
			return true;
		}
	}
	
	//通过id查询person
	public Person queryPersonById(String person_id){
		return personMapper.queryPersonById(person_id);
	}
	
	//保存修改后的person数据
	public void saveUpdatePersonInfo(Person person){
		personMapper.saveUpdatePersonInfo(person);
	}
}
