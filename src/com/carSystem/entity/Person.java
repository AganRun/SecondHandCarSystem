package com.carSystem.entity;

/**
 * 用户信息实体
 * 附带：
 * 	与sql中对应的属性
 *	无参和有参构造方法，get set方法和toString方法
 */
public class Person {

	
	private String person_id;
	
	private String person_name;
	
	private String person_gender;
	
	private String person_tel;
	
	private String person_address;
	
	private String person_email;
	
	private String person_time_register;

	public Person() {
		super();
	}

	public Person(String person_id, String person_name, String person_gender, String person_tel, String person_address,
			String person_email, String person_time_register) {
		super();
		this.person_id = person_id;
		this.person_name = person_name;
		this.person_gender = person_gender;
		this.person_tel = person_tel;
		this.person_address = person_address;
		this.person_email = person_email;
		this.person_time_register = person_time_register;
	}

	public String getPerson_id() {
		return person_id;
	}

	public void setPerson_id(String person_id) {
		this.person_id = person_id;
	}

	public String getPerson_name() {
		return person_name;
	}

	public void setPerson_name(String person_name) {
		this.person_name = person_name;
	}

	public String getPerson_gender() {
		return person_gender;
	}

	public void setPerson_gender(String person_gender) {
		this.person_gender = person_gender;
	}

	public String getPerson_tel() {
		return person_tel;
	}

	public void setPerson_tel(String person_tel) {
		this.person_tel = person_tel;
	}

	public String getPerson_address() {
		return person_address;
	}

	public void setPerson_address(String person_address) {
		this.person_address = person_address;
	}

	public String getPerson_email() {
		return person_email;
	}

	public void setPerson_email(String person_email) {
		this.person_email = person_email;
	}

	public String getPerson_time_register() {
		return person_time_register;
	}

	public void setPerson_time_register(String person_time_register) {
		this.person_time_register = person_time_register;
	}

	@Override
	public String toString() {
		return "Person [person_id=" + person_id + ", person_name=" + person_name + ", person_gender=" + person_gender
				+ ", person_tel=" + person_tel + ", person_address=" + person_address + ", person_email=" + person_email
				+ ", person_time_register=" + person_time_register + "]";
	}
	
	
}
