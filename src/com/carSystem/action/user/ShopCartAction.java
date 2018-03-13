package com.carSystem.action.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.entity.Login;
import com.carSystem.entity.ShopCart;
import com.carSystem.service.ShopCartService;

@Controller
@RequestMapping("/shopCart")
public class ShopCartAction {

	@Autowired
	private ShopCartService shopCartService;
	
	
	//���ﳵ��Ϣ��
	@RequestMapping("/shopCartList")
	public String shopCartList(HttpSession session, Map<String, Object> map){
		Login login = (Login) session.getAttribute("loginSession");
		if(login == null){
			return "redirect:/loginInitAction";
		}else if( !login.getLogin_permission().equals("user")){
			return "redirect:/loginInitAction";
		}
		List<ShopCart> shopCartList = shopCartService.getAllByPersonId(login.getLogin_id());
		map.put("shopCartList", shopCartList);
		return "user/shopCart/shopCart_list";
	}
	
	//ɾ��ȫ�����ﳵ��Ϣ
	@RequestMapping("/deleteAll")
	public String deleteAll(){
		shopCartService.deleteAll();
		return "redirect:/shopCart/shopCartList";
	}
	
	//����idɾ�����ﳵ
	@RequestMapping("/deleteById")
	public String deleteById(String shopCart_id){
		shopCartService.deleteById(shopCart_id);
		return "redirect:/shopCart/shopCartList";
	}
	
	
}
