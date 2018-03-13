package com.carSystem.entity;

/**
 * ��¼��Ϣʵ��
 * ������
 * 	��sql�ж�Ӧ������
 *	�޲κ��вι��췽����get set������toString����
 */
public class Login {

	private String login_id;
	
	private String login_password;
	
	private String login_permission;

	public Login(String login_id, String login_password, String login_permission) {
		super();
		this.login_id = login_id;
		this.login_password = login_password;
		this.login_permission = login_permission;
	}

	public Login() {
		super();
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getLogin_password() {
		return login_password;
	}

	public void setLogin_password(String login_password) {
		this.login_password = login_password;
	}

	public String getLogin_permission() {
		return login_permission;
	}

	public void setLogin_permission(String login_permission) {
		this.login_permission = login_permission;
	}

	@Override
	public String toString() {
		return "Login [login_id=" + login_id + ", login_password=" + login_password + ", login_permission="
				+ login_permission + "]";
	}

	
}
