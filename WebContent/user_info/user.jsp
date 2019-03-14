<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form method="post" action="/jsp-study/user_info/user_ok.jsp">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="uiName"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="uiId"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="uiAge"></td>
			</tr>
			<tr>
				<th>기타</th>
				<td><textarea name="uiEtc"></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><button>등록</button></th>
			</tr>
		</table>
	</form>
</body>
</html>