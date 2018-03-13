package com.carSystem.dao;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Login;

@Repository
public interface LoginMapper {

	
	//获取最大的login_id
	public String getMaxLogin_id();
	
	//注册添加login信息
	public void addLogin(Login login);

	//通过id查询login表单信息
	public Login queryLoginById(String login_id);
	
	//保存login信息（用于修改密码）
	public void saveLogin(Login login);
}
