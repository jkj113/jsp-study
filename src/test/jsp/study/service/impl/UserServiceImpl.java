package test.jsp.study.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import test.jsp.study.dao.UserDAO;
import test.jsp.study.dao.impl.UserDAOImpl;
import test.jsp.study.service.UserService;

public class UserServiceImpl implements UserService {
private UserDAO udao = new UserDAOImpl();
	@Override
	public List<Map<String, String>> selectUserList(Map<String, String> user) {
		return udao.selectUserList(user);
	}

	@Override
	public Map<String, String> selectUser(Map<String, String> user) {
		return udao.selectUser(user);
	}

	@Override
	public int insertUser(Map<String, String> user) {
		return udao.insertUser(user);
	}

	@Override
	public int updatetUser(Map<String, String> user) {
		return udao.updatetUser(user);
	}

	@Override
	public int deleteUser(Map<String, String> user) {
		return udao.deleteUser(user);
	}

	public static void main(String[] args) {  //내가 테스트하고자 하는 것은 Service단
		UserService us = new UserServiceImpl();
		System.out.println(us.selectUserList(null));
		
		Map<String,String> user = new HashMap<String,String>();
		user.put("ui_num", "45");
		System.out.println(us.selectUser(user));
		
//		user.put("ui_name", "홍");
//		user.put("ui_id", "hong");
//		user.put("ui_age", "33");
//		user.put("ui_etc", "의적");
//		System.out.println(us.insertUser(user));
		
//		user.put("ui_num", "64");
//		user.put("ui_name","홍꺽정");
//		user.put("ui_id", "ho");
//		user.put("ui_age", "50");
//		user.put("ui_etc", "뉴규");
//		System.out.println(us.updatetUser(user));
		
		user.put("ui_num", "63");
		System.out.println(us.deleteUser(user));
		
		System.out.println(us.selectUserList(null));
	}
}
