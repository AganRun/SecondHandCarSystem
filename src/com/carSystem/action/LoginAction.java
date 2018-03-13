package com.carSystem.action;

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
public class LoginAction {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private PersonService personService;
	
	//��¼��ʼ��ҳ��
	@RequestMapping("/loginInitAction")
	public String loginInitAction(){
		return "login";
	}
	
	//ע��
	@RequestMapping("/register")
	public String register(String passwd, String username, String tel, String login_permession, Map<String, Object> map, HttpSession session){
		if(personService.textTelExist(tel)){
			map.put("registerTelError", "�Բ�����������ֻ������Ѿ���ע����ˡ�");
			return "login";
		}
		
		String newId = loginService.getNewId();
		loginService.addLogin(passwd, newId, login_permession);
		personService.addPerson(username, newId, tel);
		
		Login loginInfo = loginService.getRegisterLoginEntity();
		if(loginInfo.getLogin_permission().equals("shop")){
			session.setAttribute("shoploginSession", loginInfo);
			session.setAttribute("shoploginSession_name", username);
			return "/shop/index";
		}else{
			session.setAttribute("loginSession", loginInfo);
			session.setAttribute("loginSession_name", username);
		}
		return "redirect:/indexInitAction";
	}
	
	//��¼����
	@RequestMapping("/loginAction")
	public String loginAction(Login login, Map<String, Object> map, HttpSession session){
		Login queryLogin = loginService.queryLoginById(login.getLogin_id());
		if(queryLogin == null){		//�˺Ų�����
			map.put("loginError", "�˺Ż������������");
			return "login";
		}else if(! queryLogin.getLogin_password().equals(login.getLogin_password()) ){	//�������
			System.out.println("---------error-------");
			map.put("permission", queryLogin.getLogin_permission());
			map.put("loginError1", "�˺Ż������������");
			return "login";
		}else if(queryLogin.getLogin_permission().equals("admin")){		//����Ա
			System.out.println("---------admin-------");
			session.setAttribute("adminloginSession", queryLogin);
			return "admin/index";
		}else if(queryLogin.getLogin_permission().equals("shop")){		//�̼�
			System.out.println("---------shop-------");
			session.setAttribute("shoploginSession", queryLogin);
			session.setAttribute("shoploginSession_name", personService.queryPersonById(queryLogin.getLogin_id()).getPerson_name());
			return "shop/index";
		}else{	//�û�
			System.out.println("---------user--------");
			session.setAttribute("loginSession", queryLogin);
			session.setAttribute("loginSession_name", personService.queryPersonById(queryLogin.getLogin_id()).getPerson_name());
			return "redirect:/indexInitAction";
		}
	}
	
	//��ת�����û����̼ң���ҳ��
	@RequestMapping("/indexInitAction")
	public String indexInit(HttpSession session, Map<String, Object> map){
		Login login =  (Login)session.getAttribute("loginSession");
		if(login != null && login.getLogin_permission().equals("user") ){
			Person person = personService.queryPersonById(login.getLogin_id());
			session.setAttribute("loginSession_name", person.getPerson_name());
			System.out.println("==========index=========" + login.getLogin_permission() + "===========");
		}
		return "/user/index";
	}
	
	
	//����ajaxȷ���޸ĺ�ĵ绰����û�б�ע��
	@RequestMapping("/ajaxTextIdAndTel")
	public void ajaxTextIdAndTel(HttpServletRequest request, HttpServletResponse response, String person_tel, String login_id) throws UnsupportedEncodingException{
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		boolean boolReturn = true;
		
		Login login = loginService.queryLoginById(login_id);
		if(login == null){
			boolReturn = false;
		}else{
			Person person = personService.queryPersonById(login_id);
			if( !person.getPerson_tel().equals(person_tel)){
				boolReturn = false;
			}
		}
		
		String json = new Gson().toJson(boolReturn);
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//�����û��һصĵ�����
	@RequestMapping("/findSaveNewPwd")
	public String findSaveNewPwd(Map<String, Object> map,Login login, HttpSession session){
		loginService.saveLogin(login);
		
		Login loginInfo  = loginService.queryLoginById(login.getLogin_id());
		if(loginInfo.getLogin_permission().equals("shop")){
			session.setAttribute("shoploginSession", loginInfo);
		}else{
			session.setAttribute("loginSession", loginInfo);
		}
		return "redirect:/indexInitAction";
	}
	
	
	
	
}
