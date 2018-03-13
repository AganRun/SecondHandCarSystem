package com.carSystem.action.shop;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.entity.Login;
import com.carSystem.entity.Person;
import com.carSystem.service.LoginService;
import com.carSystem.service.PersonService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/shop")
public class ShopUserInfoAction {

	@Autowired
	private PersonService personService;
	
	@Autowired
	private LoginService loginSevice;
	
	
	//��ʼ���û�����ҳ��
	@RequestMapping("/updateInfoInit")
	public String updateInfoInit(HttpSession session, Map<String, Object> map){
		Login login = (Login) session.getAttribute("shoploginSession");
		if(login == null){
			return "redirect:/loginInitAction";
		}else if( !login.getLogin_permission().equals("shop")){
			return "redirect:/loginInitAction";
		}
		Person person = personService.queryPersonById(login.getLogin_id());
		map.put("updatePersonInfo", person);
		return "shop/userInfo/updateInfo";
	}
	
	//�����û��޸ĺ�ĸ�����Ϣ
	@RequestMapping("/saveUpdatePersonInfo")
	public String saveUpdatePersonInfo(Person person, Map<String, Object> map){
		personService.saveUpdatePersonInfo(person);
		return "redirect:/shop/updateInfoInit";
	}
	
	//����ajaxȷ���޸ĺ�ĵ绰����û�б�ע��
	@RequestMapping("/ajaxTextTelExist")
	public void ajaxGetStu_name(HttpServletRequest request, HttpServletResponse response, String person_tel) throws UnsupportedEncodingException{
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		boolean boolTel = personService.textTelExist(person_tel);
		String json = new Gson().toJson(boolTel);
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//�޸��û�������
	@RequestMapping("/changePassword")
	public String changePassword(String oldPwd, String newPwd, Map<String, Object> map, HttpSession session){
		Login login = (Login) session.getAttribute("shoploginSession");
		if(login == null){
			return "redirect:/loginInitAction";
		}else if( !login.getLogin_permission().equals("shop")){
			return "redirect:/loginInitAction";
		}
		
		if( ! login.getLogin_password().equals(oldPwd)){	//�����������
			map.put("changePwdError", "�������ԭ�������");
			return "shop/userInfo/changePassword";
		}
		
		login.setLogin_password(newPwd);
		loginSevice.saveLogin(login);
		map.put("changePwdSuccess", "��ϲ�����޸�����ɹ�");
		return "shop/userInfo/changePassword";
	}
}
