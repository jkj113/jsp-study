package test.jsp.study.test;

import java.util.HashMap;
import java.util.Map;

public class Exam05 {

	public static void main(String[] args) {
		String[] strs = new String[3];  //string 공간을 3개 만든다
		System.out.println(strs[0]==null);		
		Map<String,String[]> map = new HashMap<>();
		map.put("id", strs);
		//strs의 데이터타입은 1개 (String 배열)
		//key도 String 배열을 쓸 수 있다. => 데이터 타입은 1개니까
		
	}
}
