package test.jsp.study.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.jsp.study.service.UserService;
import test.jsp.study.service.impl.UserServiceImpl;




public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserService us = new UserServiceImpl();   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8"); //html로 인식해야지 해당 script를 실행한다.
	PrintWriter pw = response.getWriter();
	String cmd = request.getParameter("cmd");
	if(cmd==null) {
		pw.print("커멘드 없는 요청은 정상적인 요청이 아닙니다.");
	}else {
	if("users".equals(cmd)) {
		List<Map<String, String>> userList = us.selectUserList(null);
		RequestDispatcher rd = request.getRequestDispatcher("/tag/lib01.jsp"); // /들어가면 절대 경로
		request.setAttribute("userList", userList);
		rd.forward(request, response);
//		pw.print(us.selectUserList(null));
		return;
	}else if("user".equals(cmd)) {
	String uiNum = request.getParameter("ui_num");
	if(uiNum==null||"".equals(uiNum)) {
		pw.print("누구를 조회하라고??"); //원래는 오류로 내보내야한다.
//		throws new ServletException ("누구를 조회하라고???"); 원래는 이렇게 해야한다.
	}else {
		Map<String,String> user = new HashMap<>();
		user.put("ui_num", uiNum);
		pw.print(us.selectUser(user));
	}
	}
	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String cmd = request.getParameter("cmd");
		if(cmd==null) {
			pw.print("커멘드 없는 요청은 정상적인 요청이 아닙니다.");
		}else {
			if("insert".equals(cmd)) {
				String uiName = request.getParameter("ui_name");
				String uiAge = request.getParameter("ui_age");
				String uiId = request.getParameter("ui_id");
				String uiEtc = request.getParameter("ui_etc");
				Map<String,String> user = new HashMap<>();
				user.put("ui_name", uiName);
				user.put("ui_age", uiAge);
				user.put("ui_id", uiId);
				user.put("ui_etc", uiEtc);
				int cnt = us.insertUser(user);
				String result = "등록 실패!";
				if(cnt==1) {
					result = "등록 완료";
				}
				pw.print(result);
			}else if("update".equals(cmd)) {
				String uiNum = request.getParameter("ui_num");
				String uiName = request.getParameter("ui_name");
				String uiAge = request.getParameter("ui_age");
				String uiId = request.getParameter("ui_id");
				String uiEtc = request.getParameter("ui_etc");
				Map<String,String> user = new HashMap<>();
				user.put("ui_num", uiNum);
				user.put("ui_name", uiName);
				user.put("ui_age", uiAge);
				user.put("ui_id", uiId);
				user.put("ui_etc", uiEtc);
				int cnt = us.updatetUser(user);
				String result = "수정 실패!";
				if(cnt==1) {
					result = "수정 완료";
				}
				pw.print(result);
			}else if("delete".equals(cmd)) {
				String uiNum = request.getParameter("ui_num");
				Map<String,String> user = new HashMap<>();
				user.put("ui_num", uiNum);
				int cnt = us.deleteUser(user);
				String result = "삭제 실패!";
				if(cnt==1) {
					result = "삭제 완료";
				}
				pw.print(result);
			}else if("login".equals(cmd)){
				String uiId = request.getParameter("id");
				String uiPwd = request.getParameter("pwd");
				Map<String, String> user = us.login(uiId);
				if(user!=null) {
					String pwd = user.get("ui_pwd");
					if(uiPwd.equals(pwd)) {
						HttpSession session = request.getSession();
						session.setAttribute("user", user); //Map 오브젝트니까 따로 따로 저장하지 않고 user에 한번에 user를 저장할 수 있다.
						response.sendRedirect("/jsp-study/login/welcome.jsp"); //페이지 이동 명령은 맞지만 여기가 메소드의 끝이 아니다 return하면 끝??
						return;
					}else {
						
					}
				}
				pw.print("<script>");
				pw.print("alert(\"아이디나 비밀번호를 확인해주세요.\");");
				pw.print("location.href='/jsp-study/login/login.jsp';");
				pw.print("</script>");
			}
		}
		
	}

}
