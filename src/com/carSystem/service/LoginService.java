package com.carSystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carSystem.dao.LoginMapper;
import com.carSystem.entity.Login;

@Service
public class LoginService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	//���ʱ��ȡ�µ��û�id
	public String getNewId(){
		int max;
		if(loginMapper.getMaxLogin_id() == null || loginMapper.getMaxLogin_id().equals("")){
			max = 1001;
		}else{
			max = Integer.parseInt( loginMapper.getMaxLogin_id() );
		}
		max++;
		String newId = Integer.toString(max); 
		return newId;
	}
	
	//ע�ᣬ���login��
	public void addLogin(String password, String id, String login_permession){
		Login login = new Login();
		login.setLogin_id(id);
		login.setLogin_password(password);
		login.setLogin_permission(login_permession);
		
		loginMapper.addLogin(login);
	}
	
	//ͨ��id��ѯlogin����Ϣ
	public Login queryLoginById(String login_id){
		return loginMapper.queryLoginById(login_id);
	}
	
	//��ȡ�ո�ע����û���Ϣ
	public Login getRegisterLoginEntity(){
		return queryLoginById(loginMapper.getMaxLogin_id());
	}
	
	//����login��Ϣ�������޸����룩
	public void saveLogin(Login login){
		loginMapper.saveLogin(login);
	}
	
	
	
}
