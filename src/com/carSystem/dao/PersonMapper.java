package com.carSystem.dao;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Person;

@Repository
public interface PersonMapper {

	//ע��ʱ����û�
	public void addPerson(Person person);
	
	//ע��ʱ����ֻ����Ƿ��Ѿ�����
	public String textTelExist(String tel);
	
	//��ȡ����person_id
	public String getMaxPerson_id();
	
	//ͨ��id��ѯperson
	public Person queryPersonById(String person_id);
	
	//�����޸ĺ��person����
	public void saveUpdatePersonInfo(Person person);
}
