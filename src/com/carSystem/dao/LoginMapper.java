package com.carSystem.dao;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Login;

@Repository
public interface LoginMapper {

	
	//��ȡ����login_id
	public String getMaxLogin_id();
	
	//ע�����login��Ϣ
	public void addLogin(Login login);

	//ͨ��id��ѯlogin����Ϣ
	public Login queryLoginById(String login_id);
	
	//����login��Ϣ�������޸����룩
	public void saveLogin(Login login);
}
