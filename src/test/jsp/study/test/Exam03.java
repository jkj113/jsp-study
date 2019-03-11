package test.jsp.study.test;

public class Exam03 {
	public int a;
	public static int b;

	public void test() {
		a = 1; // 위의 a
		int a = 3;
		// this.a = 1; 밑에 있이면 해당 영역의 a로 알기때문에 this를 붙여서 알려준다.
	}

//	public void test(int a) {
//		this.a = a;
//	}
}
