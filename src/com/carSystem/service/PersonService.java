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
	
	//ע��ʱ���person����Ϣ
	public void addPerson(String name, String id, String person_tel){
		Person person = new Person();
		person.setPerson_name(name);
		person.setPerson_id(id);
		person.setPerson_tel(person_tel);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    person.setPerson_time_register( sdf.format(new Date()) );  
	    
	    personMapper.addPerson(person);
	}
	
	//ע��ʱ����ֻ����Ƿ��Ѿ����ڣ�����������򷵻�FALSE�����ڷ���TRUE
	public boolean textTelExist(String tel){
		String id = personMapper.textTelExist(tel);
		if(id == null || id.equals("")){
			return false;
		}else{
			return true;
		}
	}
	
	//ͨ��id��ѯperson
	public Person queryPersonById(String person_id){
		return personMapper.queryPersonById(person_id);
	}
	
	//�����޸ĺ��person����
	public void saveUpdatePersonInfo(Person person){
		personMapper.saveUpdatePersonInfo(person);
	}
}
