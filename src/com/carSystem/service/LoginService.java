package com.carSystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carSystem.dao.LoginMapper;
import com.carSystem.entity.Login;

@Service
public class LoginService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	//添加时获取新的用户id
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
	
	//注册，添加login表
	public void addLogin(String password, String id, String login_permession){
		Login login = new Login();
		login.setLogin_id(id);
		login.setLogin_password(password);
		login.setLogin_permission(login_permession);
		
		loginMapper.addLogin(login);
	}
	
	//通过id查询login表单信息
	public Login queryLoginById(String login_id){
		return loginMapper.queryLoginById(login_id);
	}
	
	//获取刚刚注册的用户信息
	public Login getRegisterLoginEntity(){
		return queryLoginById(loginMapper.getMaxLogin_id());
	}
	
	//保存login信息（用于修改密码）
	public void saveLogin(Login login){
		loginMapper.saveLogin(login);
	}
	
	
	
}
